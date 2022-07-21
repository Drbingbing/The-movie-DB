//
//  OnAirTvView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import SwiftUI
import Kingfisher

struct TvShowView: View {
    var tv: TvShowModel
    
    var body: some View {
        RoundedImageView(url: tv.posterURL)
    }
}

struct OnAirTvView_Previews: PreviewProvider {
    
    static var tv: TvShow {
        return TvShow(id: 31917,
                  overview: "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.",
                  popularity: 47.432451,
                  backdropPath: nil,
                  posterPath: "https://image.tmdb.org/t/p/w185/vC324sdfcS313vh9QXwijLIHPJp.jpg",
                  voteAverage: 5.04,
                  firstAirDate: "2010-06-08",
                  name: "Pretty Little Liars",
                  voteCount: 133)
    }
    
    static var previews: some View {
        TvShowView(tv: TvShowModel(tv: tv))
            .frame(width: 120, height: 150)
            .previewLayout(.sizeThatFits)
    }
}
