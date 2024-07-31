//
//  CityModel+Stub.swift
//  UalaCitiesTests
//
//  Created by Joni Bandoni on 26/07/2024.
//

import Foundation
@testable import UalaCities

extension CityModel {
    static let sanluis: CityModel = .init(id: 1234,
                                             country: "AR",
                                             name: "San Luis",
                                             coord: Coord(longitude: -66.33563, latitude: -33.29501))
}
