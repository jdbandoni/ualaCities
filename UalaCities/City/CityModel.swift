//
//  CityModel.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import Foundation

struct CityModel: Codable {
    let id: Int
    let country: String
    let name: String
    let coord: Coord
    
    static let empty: CityModel = .init(id: 707860,
                                        country: "UA",
                                        name: "Hurzuf",
                                        coord: Coord(longitud: 34.283333, latitud: 44.549999))
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case country
        case name
        case coord
    }
}

struct Coord: Codable {
    let longitud: Double
    let latitud: Double
    
    enum CodingKeys: String, CodingKey {
        case longitud = "lon"
        case latitud = "lat"
    }
}
