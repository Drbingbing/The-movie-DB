//
//  TvShowDetailView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/9/1.
//

import SwiftUI
import Kingfisher

struct TvShowDetailView: View {
    
    @ObservedObject var tvModel: TvShowDetailViewModel
    
    var body: some View {
        ScrollView {
            let tvShow = tvModel.tvShow
            
            Group {
                HStack {
                    KFImage(tvShow.posterURL)
                        .resizable()
                        .frame(width: 100, height: 150)
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
                    VStack {
                        Text(tvShow.name)
                            .bold()
                            .font(.title)
                        
                        HStack {
                            Rectangle()
                                .fill(.white)
                                .overlay {
                                    Image(systemName: "heart")
                                }
                           
                            Rectangle()
                                .fill(.white)
                                .overlay {
                                    Image(systemName: "plus")
                                }
                            
                            Rectangle()
                                .fill(.white)
                                .overlay {
                                    Image(systemName: "bookmark")
                                }
                        }
                        .frame(height: 40)
                    }
                    .padding()
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct TvShowDetailView_Previews: PreviewProvider {
    
    static var tvShow: TvShow {
        TvShow(id: 31917,
           overview: "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.",
           popularity: 47.432451,
           backdropPath: nil,
           posterPath: "https://image.tmdb.org/t/p/w342/8UvOpGWKuEUQ5A1NBcvrEIA6BxV.jpg",
           voteAverage: 5.04,
           firstAirDate: "2010-06-08",
           name: "Pretty Little Liars",
           voteCount: 133)
    }
    
    static var previews: some View {
        TvShowDetailView(tvModel: TvShowDetailViewModel(tvshow: TvShowModel(tv: tvShow)))
    }
}
