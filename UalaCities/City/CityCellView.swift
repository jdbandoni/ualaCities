//
//  CityCellView.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import SwiftUI

struct CityCellView: View {
    @ObservedObject var viewModel: CityCellViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(viewModel.formattedCity)
                .font(.headline)
            Text(viewModel.formattedCoordinates)
                .font(.subheadline)
        }
    }
}

struct CityCellView_Previews: PreviewProvider {
    static var previews: some View {
        CityCellView(viewModel: CityCellViewModel(cityData: .empty))
            .previewLayout(.sizeThatFits)
    }
}
