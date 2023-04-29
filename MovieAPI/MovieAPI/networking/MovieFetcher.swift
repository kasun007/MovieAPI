//
//  MovieFetcher.swift
//  MovieAPI
//
//  Created by Kasun Wickramanayake on 29/04/23.
//

import Foundation
class MovieFetcher: ObservableObject {
    
    @Published var movies = [Movie]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
            
        isLoading = true
        errorMessage = nil
        
        // Hardcoded JSON string
        let jsonString = """
           [
             {
               "weight": {
                 "imperial": "7  -  10",
                 "metric": "3 - 5"
               },
               "id": "abys",
               "name": "The Shawshank Redemption",
               "genere": "Horror",
               "story": "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion..",
               "rating": 5,
               "experimental": 0,
               "isBoxOffice": 0,
               "image": {
                 "id": "0XYvRd7oD",
                 "width": 1204,
                 "height": 1445,
                 "url": "https://www.myapifilms.com/imdb/image/poster/g9seio9edd9p7nm76ntimguch1.jpg"
               }
             },
             {
               "weight": {
                 "imperial": "7  -  10",
                 "metric": "3 - 5"
               },
               "id": "aqua",
               "name": "Aqua Man",
               "genere": "Horror",
               "story": "Arthur Curry, the human-born heir to the underwater kingdom of Atlantis, goes on a quest to prevent a war between the worlds of ocean and land.",
               "rating": 5,
               "isBoxOffice": 0,
               "image": {
                 "id": "0XYvRd7oD",
                 "width": 1204,
                 "height": 1445,
                 "url": "https://m.media-amazon.com/images/M/MV5BOTk5ODg0OTU5M15BMl5BanBnXkFtZTgwMDQ3MDY3NjM@._V1_UY209_CR0,0,140,209_AL_.jpg"
               }
             }
           ]
        """
        
        do {
            // Decode the JSON string into an array of Breed objects
            let movies = try JSONDecoder().decode([Movie].self, from: Data(jsonString.utf8))
            
            self.isLoading = false
            self.movies = movies
            
        } catch {
            self.isLoading = false
            self.errorMessage = error.localizedDescription
            print(error.localizedDescription)
        }
    }
  
    
    
    
}
