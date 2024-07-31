//
//  MapViewModelTests.swift
//  UalaCitiesTests
//
//  Created by Joni Bandoni on 31/07/2024.
//

import XCTest
@testable import UalaCities

final class MapViewModelTests: XCTestCase {

    func test_whenInit_shouldSetPositionCorrectly() {
        //Given - When
        let viewModel = MapViewModel(latitude: 1, longitude: 2)

        //Then
        XCTAssertEqual(viewModel.position.region?.center.latitude, 1)
        XCTAssertEqual(viewModel.position.region?.center.longitude, 2)
    }

}
