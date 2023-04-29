//
//  MovieDetailRow.swift
//  MovieAPI
//
//  Created by Kasun Wickramanayake on 29/04/23.
//

import Foundation
import SwiftUI
struct MovieDetailView: View
 {
    let movie: Movie
    let imageSize: CGFloat = 300
    
    var body: some View {
        ScrollView {
            VStack {
                if movie.image?.url != nil {
                    AsyncImage(url: URL(string: movie.image!.url!)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .frame( height: imageSize)
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
                    Color.gray.frame(height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(movie.name)
                        .font(.headline)
                    Text(movie.genere)
                        .font(.footnote)
                    Text(movie.breedExplaination)
                    if movie.isHairless {
                        Text("hairless")
                    }
                    
                    HStack {
                        Text("Energy level")
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "star.fill")
                                .foregroundColor(movie.energyLevel > id ? Color.accentColor : Color.gray )
                        }
                    }
                    
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

 
