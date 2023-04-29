//
//  MovieListView.swift
//  MovieAPI
//
//  Created by Kasun Wickramanayake on 29/04/23.
//

import Foundation

import SwiftUI

struct MovieListView: View {
    let movies: [Movie]
    
    @State private var searchText: String = ""
    
    var filteredBreeds: [Movie] {
        if searchText.count == 0 {
          return movies
        } else {
            return movies.filter { $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBreeds) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieRow(movie: movie)
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Find Your Movie")
            .searchable(text: $searchText)
            
        }
    }
}


