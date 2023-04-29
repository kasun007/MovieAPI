//
//  ContentView.swift
//  MovieAPI
//
//  Created by Kasun Wickramanayake on 29/04/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject var movieFetcher = MovieFetcher()
    var body: some View {
      
        if movieFetcher.isLoading {
            LoadingView()
        }else if movieFetcher.errorMessage != nil  {
            ErrorView(movieFetcher: movieFetcher)
        }else {
            MovieListView(movies: movieFetcher.movies)
        }
      
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
