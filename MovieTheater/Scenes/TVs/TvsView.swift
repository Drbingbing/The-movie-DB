//
//  OnAirTvsView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import SwiftUI

struct TvsView: View {
    
    var tvs: [TVModel]
    
    var prefetch: (() -> Void)? = nil
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 80, maximum: 130), spacing: 12)
                ],
                spacing: 12
            ) {
                ForEach(tvs, id: \.self) { tv in
                    Button(action: {}) {
                        TvView(tv: tv)
                    }
                    .buttonStyle(ScaleButtonStyle())
                    .onAppear {
                        self.prefetch(at: tv)
                    }
                    .frame(height: 150)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func prefetch(at tv: TVModel) {
        guard let index = tvs.firstIndex(of: tv) else { return }
        
        let total = tvs.count
        let offset = 3
        
        let threshold = max((total - offset), 0) - index
        
        if threshold == 0 {
            prefetch?()
        }
    }
}

struct OnAirTvsView_Previews: PreviewProvider {
    
    static var tvs: [TV] {
        [
            TV(id: 31917,
               overview: "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.",
               popularity: 47.432451,
               backdropPath: nil,
               posterPath: "https://image.tmdb.org/t/p/w342/8UvOpGWKuEUQ5A1NBcvrEIA6BxV.jpg",
               voteAverage: 5.04,
               firstAirDate: "2010-06-08",
               name: "Pretty Little Liars",
               voteCount: 133),
            TV(id: 62560,
               overview: "A contemporary and culturally resonant drama about a young programmer, Elliot, who suffers from a debilitating anti-social disorder and decides that he can only connect to people by hacking them. He wields his skills as a weapon to protect the people that he cares about. Elliot will find himself in the intersection between a cybersecurity firm he works for and the underworld organizations that are recruiting him to bring down corporate America.",
               popularity: 37.882356,
               backdropPath: "/v8Y9yurHuI7MujWQMd8iL3Gy4B5.jpg",
               posterPath: "https://image.tmdb.org/t/p/w342/8UvOpGWKuEUQ5A1NBcvrEIA6BxV.jpg",
               voteAverage: 7.5,
               firstAirDate: "2015-05-27",
               name: "Mr. Robot",
               voteCount: 287)
        ]
    }
    
    static var previews: some View {
        TvsView(tvs: tvs.map(TVModel.init))
    }
}

/**
 {
       "poster_path": "/esN3gWb1P091xExLddD2nh4zmi3.jpg",
       "popularity": 37.882356,
       "id": 62560,
       "backdrop_path": "/v8Y9yurHuI7MujWQMd8iL3Gy4B5.jpg",
       "vote_average": 7.5,
       "overview": "A contemporary and culturally resonant drama about a young programmer, Elliot, who suffers from a debilitating anti-social disorder and decides that he can only connect to people by hacking them. He wields his skills as a weapon to protect the people that he cares about. Elliot will find himself in the intersection between a cybersecurity firm he works for and the underworld organizations that are recruiting him to bring down corporate America.",
       "first_air_date": "2015-05-27",
       "origin_country": [
         "US"
       ],
       "genre_ids": [
         80,
         18
       ],
       "original_language": "en",
       "vote_count": 287,
       "name": "Mr. Robot",
       "original_name": "Mr. Robot"
     }
 */
