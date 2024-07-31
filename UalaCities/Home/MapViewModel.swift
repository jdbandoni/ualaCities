//
//  MapViewModel.swift
//  UalaCities
//
//  Created by Joni Bandoni on 31/07/2024.
//

import Foundation
import MapKit
import SwiftUI

final class MapViewModel: ObservableObject {
    
    @Published var position: MapCameraPosition
    
    init(latitude: Double, longitude: Double) {
        self.position = .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        )
    }
    
}
