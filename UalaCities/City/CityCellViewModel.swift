//
//  CityCellViewModel.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import Foundation

//For this case this viewModel is not needed because there is no extra logic o interation needed. However, it is a good practice separating the responsibilities
final class CityCellViewModel: ObservableObject {
    
    @Published private var cityData: CityModel
    
    var formattedCity: String {
        cityData.name + ", " + cityData.country
    }
    
    var formattedCoordinates: String {
        "\(cityData.coord.longitud), \(cityData.coord.latitud)"
    }
    
    init(cityData: CityModel = .empty) {
        self.cityData = cityData
    }
}
