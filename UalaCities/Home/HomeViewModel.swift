//
//  HomeViewModel.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var data: HomeModel
    
    init(data: HomeModel) {
        self.data = data
    }
    
}
