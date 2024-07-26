//
//  HomeModel.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import Foundation

struct HomeModel: Codable {
    let cities: [CityModel]
    
    static let empty: HomeModel = .init(cities: [])
    static let test: HomeModel = .init(cities: [.empty,.init(id: 1234,
                                                        country: "AR",
                                                        name: "San Luis",
                                                        coord: Coord(longitud: -66.33563, latitud: -33.29501))])
}
