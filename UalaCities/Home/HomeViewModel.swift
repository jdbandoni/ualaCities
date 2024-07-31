//
//  HomeViewModel.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import Foundation
import SwiftUI
import MapKit

final class HomeViewModel: ObservableObject {
    
    @Published var data: HomeModel
    
    init(data: HomeModel) {
        self.data = data
    }
    
}
