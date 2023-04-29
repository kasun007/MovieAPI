//
//  Movie.swift
//  MovieAPI
//
//  Created by Kasun Wickramanayake on 29/04/23.
//

import Foundation

struct Movie: Codable,CustomStringConvertible,Identifiable{
    let id: String
    let name: String
    let temperament: String
    let breedExplaination: String
    let energyLevel: Int
    let isHairless: Bool
    let image: MovieImage?
    
    var description: String {
        return "breed with name: \(name) and id \(id), energy level: \(energyLevel) isHairless: \(isHairless ? "YES" : "NO")"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplaination = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
       name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        
        image = try values.decodeIfPresent(MovieImage.self, forKey: .image)
    }
    
    init(name: String, id: String, explaination: String, temperament: String,
         energyLevel: Int, isHairless: Bool, image: MovieImage?){
        self.name = name
        self.id = id
        self.breedExplaination = explaination
        self.energyLevel = energyLevel
        self.temperament = temperament
        self.image = image
        self.isHairless = isHairless
    }
    
 
     
}
   
    
    
    
    
    
    
 
