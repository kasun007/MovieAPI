//
//  Erroriew.swift
//  MovieAPI
//
//  Created by Kasun Wickramanayake on 29/04/23.
//

import Foundation
import SwiftUI
struct ErrorView: View {
    @ObservedObject var movieFetcher: MovieFetcher
    var body: some View {
        VStack {
            
            Text("😿")
                .font(.system(size: 80))
            
            Text(movieFetcher.errorMessage ?? "")
            
            Button {
                movieFetcher.fetchAllBreeds()
            } label: {
                Text("Try again")
            }

            
        }
    }
}
 
