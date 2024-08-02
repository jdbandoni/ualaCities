//
//  HomeView.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    
    @State private var selectedCity: CityModel = .empty
    @State var isPortraitOrientation: Bool = true
    
    
    private var portraitBody: some View {
        NavigationStack {
            List(viewModel.data.cities, id: \.id) { city in
                NavigationLink {
                    MapView(viewModel: MapViewModel(latitude: city.coord.latitude, longitude: city.coord.longitude))
                } label: {
                    CityCellView(viewModel: CityCellViewModel(cityData: city))
                }
            }
        }
    }

    private var landscapeBody: some View {
        HStack (alignment: .top) {
            List(viewModel.data.cities, id: \.id) { city in
                Button {
                    selectedCity = city
                } label: {
                    CityCellView(viewModel: CityCellViewModel(cityData: city))
                }
                .buttonStyle(.plain)
            }
            MapView(viewModel: MapViewModel(latitude: selectedCity.coord.latitude, longitude: selectedCity.coord.longitude))
        }

    }
    
    var body: some View {
        Group {
            if isPortraitOrientation {
                portraitBody
            } else {
                landscapeBody
            }
        }
        .task {
            await viewModel.getCities()
        }
        .onRotate { newOrientation in
            isPortraitOrientation = (newOrientation.isPortrait || newOrientation == .unknown)
        }
    }
    
}

struct HomeViewPortrait_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isPortraitOrientation: true)
            .previewInterfaceOrientation(.portrait)
    }
}

struct HomeViewLandscape_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isPortraitOrientation: false)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
