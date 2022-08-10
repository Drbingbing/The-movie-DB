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
    @ObservedObject var movieModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            let movie = movieModel.movie
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
            
            Group {
                HStack(alignment: .center, spacing: 0) {
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "plus")
                                .resizable()
                                .font(.body.bold())
                                .frame(width: 20, height: 20)
                            
                            Text("新增至清單")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(.black)
                        .padding()
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "heart")
                                .resizable()
                                .font(.body.bold())
                                .frame(width: 22, height: 20)
                            Text("收藏")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(.black)
                        .padding()
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "bookmark")
                                .resizable()
                                .font(.body.bold())
                                .frame(width: 16, height: 20)
                            Text("新增至待看清單")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(.black)
                        .padding()
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "hand.thumbsup")
                                .resizable()
                                .font(.body.bold())
                                .frame(width: 20, height: 20)
                            Text("評分")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(.black)
                        .padding()
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
            }
            
            Group {
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
            }
            
            Group {
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
            }
            
            Group {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(LocalizedStrings.movieDetailOriginLanguageTitle())
                            .bold()
                            .font(.headline)
                        Spacer()
                    }
                    
                    Text(movie.originLanguage)
                        .padding(.vertical, 4)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
            }
            
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
                    ActorsCarouselView(
                        actors: $movieModel.actors,
                        destination: showActor
                    ).frame(height: 250)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
            }
            
            if !movieModel.similarMovies.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(LocalizedStrings.movieDetailSimilarTitle())
                            .bold()
                            .font(.headline)
                        Spacer()
                    }
                    
                    MovieCarouselView(
                        movieId: movieModel.movie.movieID,
                        movies: movieModel.similarMovies,
                        destination: showMovie
                    )
                    .frame(height: 250)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
            }
            
            Rectangle()
                .fill(.clear)
                .frame(height: 40)
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        .navigationTransparentBar(tintColor: nil)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: popUp) {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .padding([.horizontal, .vertical], 8)
                        .foregroundColor(.black)
                        .background(.regularMaterial, in: Circle())
                }
            }
        }
    }
    
    func showActor(person: ActorModel) -> some View {
        Text(person.name)
    }
    
    func showMovie(movie: MovieModel) -> some View {
        NavigationLazyView(
            MovieDetailView(movieModel: MovieDetailViewModel(movie: movie))
        )
    }
    
    func popUp() {
        dismiss()
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
        
        NavigationView {
            MovieDetailView(
                movieModel: MovieDetailViewModel(movie: MovieModel(movie: movie))
            )
        }
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
