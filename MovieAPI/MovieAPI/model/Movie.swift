//
//  Movie.swift
//  MovieAPI
//
//  Created by Kasun Wickramanayake on 29/04/23.
//

import Foundation

struct Movie: Codable,CustomStringConvertible,Identifiable{
    // Properties of the Movie struct.
    let id: String
    let name: String
    let genere: String
    let story: String
    let rating: Int
    let isBoxOffice: Bool
    let image: MovieImage?

    // Computed property for the description of a movie.
    var description: String {
        return "Movie Name: \(name) and id \(id), genere: \(genere) Box Ofiice: \(isBoxOffice ? "YES" : "NO")"
    }

    // CodingKeys enumeration is used to map the keys of the JSON response to the properties of the Movie struct.
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case genere
        case story = "story"
        case rating = "rating"
        case isBoxOffice = "isBoxOffice"
        case image
    }

    // Initializer for the Movie struct that initializes it from the values of the decoder.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        genere = try values.decode(String.self, forKey: .genere)
        story = try values.decode(String.self, forKey: .story)
        rating = try values.decode(Int.self, forKey: .rating)
        
        let boxOffice = try values.decode(Int.self, forKey: .isBoxOffice)
        isBoxOffice = boxOffice == 1
        
        image = try values.decodeIfPresent(MovieImage.self, forKey: .image)
    }

    // Initializer for the Movie struct that takes the properties of a movie as parameters.
    init(name: String, id: String, story: String, genere: String, rating: Int, isBoxOffice: Bool, image: MovieImage?){
        self.name = name
        self.id = id
        self.story = story
        self.rating = rating
        self.genere = genere
        self.image = image
        self.isBoxOffice = isBoxOffice
    }

 
     
}
   
    
    
    
    
    
    
 
