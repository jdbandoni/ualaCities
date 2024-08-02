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
    
    private var urlSession: URLSessionProtocol
    
    @Published var data: HomeModel
    
    init(data: HomeModel = .empty, urlSession: URLSessionProtocol = URLSessionAdapter()) {
        self.data = data
        self.urlSession = urlSession
    }
    
}

//MARK: - Async methods
extension HomeViewModel {
    
    @MainActor
    func getCities() async {
        guard let url = URL(string: "https://gist.githubusercontent.com/hernan-uala/dce8843a8edbe0b0018b32e137bc2b3a/raw/0996accf70cb0ca0e16f9a99e0ee185fafca7af1/cities.json") else { return }
        
        let request: URLRequest = {
            var request = URLRequest(url: url)
            request.cachePolicy = .useProtocolCachePolicy //Other possibilites would be using ETags
            request.httpMethod = "GET"
            return request
        }()

        do {
            async let (responseData, _) = try await urlSession.data(for: request)
            let dataUpdated = try await JSONDecoder().decode([CityModel].self, from: responseData)
            print(dataUpdated)
            self.data = HomeModel(cities: dataUpdated)
        } catch {
            //do something
        }
    }
}
