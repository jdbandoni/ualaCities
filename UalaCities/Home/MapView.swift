//
//  MapView.swift
//  UalaCities
//
//  Created by Joni Bandoni on 30/07/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel: MapViewModel


    var body: some View {
        Map(position: $viewModel.position)
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(viewModel: MapViewModel(latitude: -33.29501, longitude: -66.33563))
    }
}
