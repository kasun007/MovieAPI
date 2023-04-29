//
//  APIServiceProtocol.swift
//  MovieAPI
//
//  Created by Kasun Wickramanayake on 29/04/23.
//

import Foundation


protocol APIServiceProtocol{
    
    func fetchMovies(url:URL?,completion:@escaping(Result<[Movie],APIE>)->Void  )
    
    
}
