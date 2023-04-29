//
//  MovieRow.swift
//  MovieAPI
//
//  Created by Kasun Wickramanayake on 29/04/23.
//

import Foundation
import SwiftUI
struct MovieRow: View {
    let movie: Movie
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            
            if movie.image?.url != nil {
                AsyncImage(url: URL(string: movie.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                        
                     } else if phase.error != nil {
                         
                         Text(phase.error?.localizedDescription ?? "error")
                             .foregroundColor(Color.pink)
                             .frame(width: imageSize, height: imageSize)
                     } else {
                        ProgressView()
                             .frame(width: imageSize, height: imageSize)
                     }
                    
                }
            }else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.name)
                    .font(.headline)
                Text(movie.genere)
            }
        }
     
    }
}

 
