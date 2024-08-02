//
//  HomeViewModelTests.swift
//  UalaCitiesTests
//
//  Created by Joni Bandoni on 02/08/2024.
//

import XCTest
@testable import UalaCities
import Combine

final class HomeViewModelTests: XCTestCase {

    var cancellables = Set<AnyCancellable>()
    var viewModel: HomeViewModel!
    var mockURLSession: MockURLSession!

    override func setUpWithError() throws {
        mockURLSession = MockURLSession()
        viewModel = HomeViewModel(urlSession: mockURLSession)
    }

    override func tearDownWithError() throws {
        mockURLSession = nil
        viewModel = nil
        cancellables.removeAll()
    }
    
    func test_getCities_whenCallIt_shouldSaveIt() async {
        //Given
        let dataUpdatedExpectation = XCTestExpectation(description: "the data was not updated")
        viewModel.$data
            .dropFirst()
            .sink { _ in
                dataUpdatedExpectation.fulfill()
            }
            .store(in: &cancellables)
        guard let data = MockData.Home.fifteenCities else {
            XCTFail("Failed when getting the mock response for Home")
            return
        }
        let response: URLResponse = HTTPURLResponse(url: URL(string: "https://foo.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        mockURLSession.stubDataForRequestLastResponse = (data,response)

        //when
        await viewModel.getCities()
        await self.fulfillment(of: [dataUpdatedExpectation], timeout: 1)
        
        //then
        XCTAssertEqual(viewModel.data.cities.count, 15)
        if (viewModel.data.cities.count != 15) {
            XCTFail("the number of cities is not equal to 15")
            return
        }
        
        XCTAssertEqual(viewModel.data.cities.first!.coord.longitude, 34.283333)
        XCTAssertEqual(viewModel.data.cities.first!.coord.latitude, 44.549999)
        XCTAssertEqual(viewModel.data.cities[9].name, "Laspi")
        XCTAssertEqual(viewModel.data.cities[10].country, "VE")
        XCTAssertEqual(viewModel.data.cities[12].id, 384848)
    }

}
