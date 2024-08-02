//
//  HomeModel.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import Foundation

struct HomeModel {
    let cities: [CityModel]
    
    static let empty: HomeModel = .init(cities: [])
    static let test: HomeModel = .init(cities: [.empty,.init(id: 1234,
                                                        country: "AR",
                                                        name: "San Luis",
                                                        coord: Coord(longitude: -66.33563, latitude: -33.29501))])
}
