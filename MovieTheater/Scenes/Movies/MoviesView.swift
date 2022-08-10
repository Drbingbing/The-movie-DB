//
//  NowPlayingView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import SwiftUI

struct MoviesView: View {
    
    var movies: [MovieModel]
    
    var prefetch: (() -> Void)? = nil
    
    @State var presentingDetail: MovieModel?
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 80, maximum: 130), spacing: 12)
                ],
                spacing: 12
            ) {
                ForEach(movies, id: \.self) { movie in
                    NavigationLink(destination: { showMovieDetail(movie) }) {
                        MovieView(movie: movie)
                    }
                    .buttonStyle(ScaleButtonStyle())
                    .frame(height: 150)
                    .onAppear {
                        prefetch(at: movie)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func showMovieDetail(_ movie: MovieModel) -> some View {
        NavigationLazyView(
            MovieDetailView(movieModel: MovieDetailViewModel(movie: movie))
        )
    }
    
    private func prefetch(at movie: MovieModel) {
        guard let index = movies.firstIndex(of: movie) else { return }
        let total = movies.count
        let offset = 3
        
        let threshold = max((total - offset), 0) - index
        
        
        if threshold == 0 {
            prefetch?()
        }
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    
    static var movies: [Movie] {
        let data = mockMovieJson.data(using: .utf8)!
        return try! JSONDecoder().decode([Movie].self, from: data)
    }
    
    static var previews: some View {
        MoviesView(movies: movies.map(MovieModel.init))
    }
}


private let mockMovieJson = """
    [{
      "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
      "adult": false,
      "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
      "release_date": "2016-08-03",
      "genre_ids": [
        14,
        28,
        80
      ],
      "id": 297761,
      "original_title": "Suicide Squad",
      "original_language": "en",
      "title": "Suicide Squad",
      "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
      "popularity": 48.261451,
      "vote_count": 1466,
      "video": false,
      "vote_average": 5.91
    },
    {
      "poster_path": "/lFSSLTlFozwpaGlO31OoUeirBgQ.jpg",
      "adult": false,
      "overview": "The most dangerous former operative of the CIA is drawn out of hiding to uncover hidden truths about his past.",
      "release_date": "2016-07-27",
      "genre_ids": [
        28,
        53
      ],
      "id": 324668,
      "original_title": "Jason Bourne",
      "original_language": "en",
      "title": "Jason Bourne",
      "backdrop_path": "/AoT2YrJUJlg5vKE3iMOLvHlTd3m.jpg",
      "popularity": 30.690177,
      "vote_count": 649,
      "video": false,
      "vote_average": 5.25
    },
    {
      "poster_path": "/tgfRDJs5PFW20Aoh1orEzuxW8cN.jpg",
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
    }]
"""
