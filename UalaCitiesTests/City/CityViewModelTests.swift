//
//  CityViewModelTests.swift
//  UalaCitiesTests
//
//  Created by Joni Bandoni on 26/07/2024.
//

import XCTest
@testable import UalaCities

final class CityViewModelTests: XCTestCase {

    func test_formattedCity_shouldFormatCorrectly() {
        //Given
        let viewModel = CityCellViewModel(cityData: .sanluis)
        
        //When
        let formattedCity = viewModel.formattedCity
        
        //Then
        XCTAssertEqual(formattedCity, "San Luis, AR")
    }
    
    func test_formattedCoordinates_shouldFormatCorrectly() {
        //Given
        let viewModel = CityCellViewModel(cityData: .sanluis)
        
        //When
        let formattedCoordinates = viewModel.formattedCoordinates
        
        //Then
        XCTAssertEqual(formattedCoordinates, "-66.33563, -33.29501")
    }


}
