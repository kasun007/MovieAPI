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
                "cfa_url": "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
                "vetstreet_url": "http://www.vetstreet.com/cats/abyssinian",
                "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
                "genere": "Horror",
                "origin": "Egypt",
                "country_codes": "EG",
                "country_code": "EG",
                "description": "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
                "life_span": "14 - 15",
                "indoor": 0,
                "lap": 1,
                "alt_names": "",
                "adaptability": 5,
                "affection_level": 5,
                "child_friendly": 3,
                "dog_friendly": 4,
                "energy_level": 5,
                "grooming": 1,
                "health_issues": 2,
                "intelligence": 5,
                "shedding_level": 2,
                "social_needs": 5,
                "stranger_friendly": 5,
                "vocalisation": 1,
                "experimental": 0,
                "hairless": 0,
                "natural": 1,
                "rare": 0,
                "rex": 0,
                "suppressed_tail": 0,
                "short_legs": 0,
                "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
                "hypoallergenic": 0,
                "reference_image_id": "0XYvRd7oD",
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
                "cfa_url": "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
                "vetstreet_url": "http://www.vetstreet.com/cats/abyssinian",
                "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
                "genere": "Horror",
                "origin": "Egypt",
                "country_codes": "EG",
                "country_code": "EG",
                "description": "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
                "life_span": "14 - 15",
                "indoor": 0,
                "lap": 1,
                "alt_names": "",
                "adaptability": 5,
                "affection_level": 5,
                "child_friendly": 3,
                "dog_friendly": 4,
                "energy_level": 5,
                "grooming": 1,
                "health_issues": 2,
                "intelligence": 5,
                "shedding_level": 2,
                "social_needs": 5,
                "stranger_friendly": 5,
                "vocalisation": 1,
                "experimental": 0,
                "hairless": 0,
                "natural": 1,
                "rare": 0,
                "rex": 0,
                "suppressed_tail": 0,
                "short_legs": 0,
                "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
                "hypoallergenic": 0,
                "reference_image_id": "0XYvRd7oD",
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
