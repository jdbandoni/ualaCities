//
//  MockData+GetCities.swift
//  UalaCitiesTests
//
//  Created by Joni Bandoni on 02/08/2024.
//

import Foundation

extension MockData {
    enum Home {
        static let fifteenCities = Fixture.jsonDataFromFile(fixturePath: "Home/FifteenCities")
    }
}
