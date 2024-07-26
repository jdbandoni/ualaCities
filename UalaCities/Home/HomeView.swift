//
//  HomeView.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel(data: .test)
    
    @State private var cityTapped: String = ""
    @State var isPortraitOrientation: Bool = true
    
    
    private var portraitBody: some View {
        NavigationStack {
            List(viewModel.data.cities, id: \.id) { city in
                NavigationLink {
                    Text("\(city.coord.latitud),\(city.coord.longitud)")
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
                    cityTapped = city.name
                } label: {
                    CityCellView(viewModel: CityCellViewModel(cityData: city))
                }
                .buttonStyle(.plain)
            }
            Text("City: \(cityTapped)")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
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
            //update list
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
