//
//  DetailImageHeader.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/21.
//

import SwiftUI
import Kingfisher

struct ImageHeader: View {
    
    var backdropURL: URL?
    var posterURL: URL?
    
    var body: some View {
        GeometryReader { proxy in
            let maxHeight = min(200, proxy.size.height)
            
            ZStack(alignment: .bottomLeading) {
                KFImage(backdropURL)
                    .resizable()
                    .placeholder{ _ in
                        ProgressView()
                    }
                    .overlay(.black.opacity(0.3))
                    .overlay(
                        Triangle()
                            .fill(Color.white)
                    )
                
                HStack {
                    KFImage(posterURL)
                        .resizable()
                        .frame(width: 100, height: min(maxHeight * 0.8, 150))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.white, lineWidth: 1.5)
                        )
                        .shadow(
                            color: .black.opacity(0.4),
                            radius: 8,
                            x: 0,
                            y: 1
                        )
                    Spacer()
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
            }
            .frame(maxHeight: maxHeight)
        }
    }
}

struct DetailImageHeader_Previews: PreviewProvider {
    static var previews: some View {
        ImageHeader(
            backdropURL: URL(string: "https://image.tmdb.org/t/p/w500/393mh1AJ0GYWVD7Hsq5KkFaTAoT.jpg"),
            posterURL: URL(string: "https://image.tmdb.org/t/p/w185/mC9SZcD4lNqXYZVKrB3DPvDBv3k.jpg"))
        .frame(width: nil, height: 200)
        .previewLayout(.sizeThatFits)
    }
}

/**
 https://image.tmdb.org/t/p/w185/393mh1AJ0GYWVD7Hsq5KkFaTAoT.jpg
 https://image.tmdb.org/t/p/w185/mC9SZcD4lNqXYZVKrB3DPvDBv3k.jpg
 */
