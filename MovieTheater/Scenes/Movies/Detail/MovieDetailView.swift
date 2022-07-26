//
//  MovieDetailView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/21.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var movieModel: MovieDetailViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            let movie = movieModel.movie
            
            ScrollView {
               
                Group {
                    ImageHeader(
                        backdropURL: movieModel.backdropURL,
                        posterURL: movie.posterURL
                    )
                    .frame(width: nil, height: 200)
                    
                    HStack {
                        Text(movie.title)
                            .bold()
                            .font(.title)
                        Spacer()
                        
                        CircularProgressView(value: movie.voteAverage)
                            .frame(width: 40)
                    }
                    .padding()
                }
                
                HStack(alignment: .center, spacing: 0) {
                    
                    Button(action: {}) {
                        VstackLabel(image: "Reviews", title: "Reviews")
                    }
                      
                    Button(action: {}) {
                        VstackLabel(image: "PlayVideo", title: "Trailers")
                    }
                        
                    Button(action: movieModel.showingCredits) {
                        VstackLabel(image: "Cast", title: "Credits")
                    }
                        
                    Button(action: {}) {
                        VstackLabel(image: "SimilarMovies", title: "Similars")
                    }
                }
                
                HStack {
                    Spacer()
                    VStack(spacing: 8) {
                        Text(LocalizedStrings.movieDetailCategoryTitle())
                            .bold()
                            .font(.title2)
                        Text(movieModel.genreName)
                    }
                    Spacer()
                    VStack(spacing: 8) {
                        Text(LocalizedStrings.movieDetailReleasedDateTitle())
                            .bold()
                            .font(.title2)
                        Text(movie.releaseDate ?? "-")
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(LocalizedStrings.movieDetailOverviewTitle())
                            .bold()
                            .font(.title3)
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    
                    Text(movie.overview)
                        .padding(.horizontal, 16)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(LocalizedStrings.movieDetailOriginMovieTitle())
                            .bold()
                            .font(.headline)
                        Spacer()
                    }
                    
                    Text(movie.originTitle)
                        .padding(.vertical, 4)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                
                if let movieStatus = movie.status {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text(LocalizedStrings.movieDetailStatusTitle())
                                .bold()
                                .font(.headline)
                            Spacer()
                        }
                        
                        Text(MovieStatusHelper.locaized(movieStatus))
                            .padding(.vertical, 4)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(LocalizedStrings.movieDetailOriginLanguageTitle())
                            .bold()
                            .font(.headline)
                        Spacer()
                    }
                    
                    Text(CountryCodeHelper.countryName(movie.originLanguage))
                        .padding(.vertical, 4)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                
                
                Group {
                    if let budget = movie.budget, budget > 0 {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text(LocalizedStrings.movieDetailBudgetTitle())
                                    .bold()
                                    .font(.headline)
                                Spacer()
                            }

                            Text("$\(budget)")
                                .padding(.vertical, 4)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                    }

                    if let revenue = movie.revenue, revenue > 0 {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text(LocalizedStrings.movieDetailRevenueTitle())
                                    .bold()
                                    .font(.headline)
                                Spacer()
                            }

                            Text("$\(revenue)")
                                .padding(.vertical, 4)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                    }
                }
                
                if !movieModel.actors.isEmpty {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text(LocalizedStrings.movieDetailCreditsTitle())
                                .bold()
                                .font(.headline)
                            Spacer()
                        }
                        ActorsCarouselView(actors: $movieModel.actors, onMore: movieModel.showingCredits) 
                        .frame(height: 250)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                }
            }
            .onAppear(perform: movieModel.fetch)
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 8)
        }
        .sheet(isPresented: $movieModel.showCredits) {
            ActorsListView(actors: movieModel.actors)
        }
        .ignoresSafeArea()
    }
}


private struct VstackLabel: View {
    
    var image: String
    var title: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 32, height: 32)
            Text(title)
                .foregroundColor(.black)
        }
        .padding()
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    
    static var movie: Movie {
        Movie(id: 507086,
              overview: "努布拉岛被摧毁四年后，恐龙现在与世界各地的人类一起生活和狩猎。这种脆弱的平衡将重塑未来，并一劳永逸地决定人类是否仍然是他们现在与历史上最可怕的生物共享的星球上的顶尖捕食者。",
              releaseDate: "2022-06-08",
              genreIDs: [12, 28, 878],
              title: "侏罗纪世界3",
              backdropPath: "/393mh1AJ0GYWVD7Hsq5KkFaTAoT.jpg",
              posterPath: "/mC9SZcD4lNqXYZVKrB3DPvDBv3k.jpg",
              originalTitle: "Park",
              originalLanguage: "en",
              popularity: 12919.366,
              adult: false,
              voteAverage: 7.0,
              voteCount: 1743,
              video: false,
              budget: 63000000,
              homepage: "",
              imdbID: "tt0137523",
              revenue: 100853753,
              status: "Released",
              tagLine: "How much can you know about yourself if you've never been in a fight?",
              spokenLanguages: [],
              companies: [],
              countries: []
        )
    }
    
    static var previews: some View {
        
        MovieDetailView()
            .environmentObject(
                MovieDetailViewModel(movie: MovieModel(movie: movie))
            )
    }
}

/**
 ▿ Optional<Movie>
   ▿ some : Movie
     - id : 507086
     - overview : "努布拉岛被摧毁四年后，恐龙现在与世界各地的人类一起生活和狩猎。这种脆弱的平衡将重塑未来，并一劳永逸地决定人类是否仍然是他们现在与历史上最可怕的生物共享的星球上的顶尖捕食者。"
     - releaseDate : "2022-06-08"
     ▿ genreIDs : 3 elements
       - 0 : 12
       - 1 : 28
       - 2 : 878
     - title : "侏罗纪世界3"
     ▿ backdropPath : Optional<String>
       - some : "/393mh1AJ0GYWVD7Hsq5KkFaTAoT.jpg"
     ▿ posterPath : Optional<String>
       - some : "/mC9SZcD4lNqXYZVKrB3DPvDBv3k.jpg"
     - popularity : 12919.366
     - adult : false
     - voteAverage : 7.0
     - voteCount : 1743
     - video : false
 */
