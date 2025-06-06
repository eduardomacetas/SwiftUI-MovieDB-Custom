//
//  MovieItem.swift
//  MovieSwiftUI
//
//  Created by Alfian Losari on 05/06/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import SwiftUI

// struct MovieItem : View {

//     var movie: Movie

//     var body: some View {
//         VStack(alignment: .leading, spacing: 16) {
//             MovieItemImage(imageData: ImageData(movieURL: movie.backdropURL))
//             VStack(alignment: .leading, spacing: 4) {
//                 Text(movie.title)
//                     .foregroundColor(.primary)
//                     .font(.headline)
//                 Text(movie.overview)
//                     .font(.subheadline)
//                     .foregroundColor(.secondary)
//                     .multilineTextAlignment(.leading)
//                     .lineLimit(2)
//                     .frame(height: 40)
//                 }
//             }
//     }
// }

struct MovieItem: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // MovieItemImage(imageData: ImageData(movieURL: movie.backdropURL))
            
            // if let url = movie.posterURL {
            //     PosterImage(url: url)
            //     // .frame(width: 180, height: 270)
            //     .frame(width: 300, height: 169)
            // } else {
            //     Rectangle()
            //     .foregroundColor(.gray)
            //     .frame(width: 10, height: 30)
            // }
            
            if let url = movie.posterURL {
                PosterImage(url: url)
                // .aspectRatio(16/9, contentMode: .fill)
                // .aspectRatio(2/3, contentMode: .fill)
                    .frame(width: 300, height: 169)
                    .clipped()
                    .cornerRadius(20)
                    .shadow(radius: 5)
            } else {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 169)
                    .cornerRadius(8)
                    .shadow(radius: 5)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .foregroundColor(.primary)
                    .font(.headline)
                // .font(.headline)
                // .lineLimit(1)
                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 40)
            }
        }
    }
}

struct MovieItemImage: View {
    
    @State var imageData: ImageData
    
    var body: some View {
        ZStack {
            if self.imageData.image != nil {
                Image(uiImage: self.imageData.image!)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 300, height: 169)
                    .cornerRadius(5)
                    .shadow(radius: 10)
            } else {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 169)
                    .cornerRadius(5)
                    .shadow(radius: 10)
            }
        }.onAppear {
            self.imageData.downloadImage()
        }
    }
}

#if DEBUG
struct MovieItem_Previews : PreviewProvider {
    static var previews: some View {
        MovieItem(movie: Movie.fake)
        
    }
}
#endif
