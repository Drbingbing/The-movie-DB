//
//  NowPlayingMovieView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import SwiftUI
import Kingfisher

struct MovieView: View {
    
    var movie: MovieModel
    
    var body: some View {
        RoundedImageView(url: movie.posterURL)
    }
}

struct NowPlayingMovieView_Previews: PreviewProvider {
    static var movie: Movie {
        let data = mockMovieJson.data(using: .utf8)!
        return try! JSONDecoder().decode(Movie.self, from: data)
    }
    
    static var previews: some View {
        MovieView(movie: MovieModel(movie: movie))
            .frame(width: 120, height: 150)
            .previewLayout(.sizeThatFits)
    }
}

private let mockMovieJson = """
        {
          "poster_path": "https://image.tmdb.org/t/p/w342/r9Ij698L18MEuO2z8TK1tX4Nlf2.jpg",
          "adult": false,
          "overview": "Arthur Bishop thought he had put his murderous past behind him when his most formidable foe kidnaps the love of his life. Now he is forced to travel the globe to complete three impossible assassinations, and do what he does best, make them look like accidents.",
          "release_date": "2016-08-25",
          "genre_ids": [
            80,
            28,
            53
          ],
          "id": 278924,
          "original_title": "Mechanic: Resurrection",
          "original_language": "en",
          "title": "Mechanic: Resurrection",
          "backdrop_path": "/3oRHlbxMLBXHfMqUsx1emwqiuQ3.jpg",
          "popularity": 20.375179,
          "vote_count": 119,
          "video": false,
          "vote_average": 4.59
        }
"""
