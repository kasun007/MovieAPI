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
        fetchAllMovies()
    }
    
    func fetchAllMovies() {
        // Set isLoading flag to true and clear any previous error message
        isLoading = true
        errorMessage = nil
        
        // Hardcoded JSON string containing movie data
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
                "dog_friendly": 4,
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
                "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
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
            // Decode the JSON string into an array of Movie objects using the JSONDecoder
            let movies = try JSONDecoder().decode([Movie].self, from: Data(jsonString.utf8))
            
            // Set isLoading flag to false and store the array of movies
            self.isLoading = false
            self.movies = movies
            
        } catch {
            // Set isLoading flag to false and store the error message
            self.isLoading = false
            self.errorMessage = error.localizedDescription
            print(error.localizedDescription)
        }
    }

    /* func fetchAllMovies() {
             
             isLoading = true
             errorMessage = nil
             
             let url = URL(string: "http://127.0.0.1:8000/api/movies")
             service.fetchMovies(url: url) { [unowned self] result in
                 
                 DispatchQueue.main.async {
                     
                     self.isLoading = false
                     switch result {
                     case .failure(let error):
                         self.errorMessage = error.localizedDescription
                         // print(error.description)
                         print(error)
                     case .success(let breeds):
                         print("--- sucess with \(breeds.count)")
                         self.movies = breeds
                     }
                 }
             }
             
         }*/
     
    
    
    
}
