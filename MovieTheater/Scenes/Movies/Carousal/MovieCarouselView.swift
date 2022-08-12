//
//  MovieCarouselView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/9.
//

import SwiftUI
import Kingfisher

struct MovieCarouselView<Destination>: View where Destination: View {
    
    var movieId: Int? = nil
    var movies: [MovieModel] = []
    var destination: (MovieModel) -> Destination
    var showMore: Bool = false
    var prefix: Int? = nil
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(movies.prefix(prefix ?? movies.count)) { movie in
                        NavigationLink(destination: { onDestination(movie: movie) }) {
                            KFImage(movie.posterURL)
                                .resizable()
                                .placeholder{ _ in
                                    ProgressView()
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(height: proxy.size.height * 0.9)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .shadow(color: .black.opacity(0.25), radius: 6, x: 2, y: 2)
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }
                    
                    if showMore {
                        NavigationLink(destination: showMovieList) {
                            HStack {
                                Text("檢視更多")
                                    .bold()
                                Image(systemName: "chevron.forward")
                                    .font(.body.bold())
                            }
                        }
                        .tint(.black)
                    }
                }
                .padding([.horizontal, .vertical], 12)
            }
            .frame(height: proxy.size.height)
        }
        .navigationBarBackground {
            Color.white
        }
    }
    
    func onDestination(movie: MovieModel) -> some View {
        destination(movie)
    }
    
    private func showMovieList() -> some View {
        NavigationLazyView(
            MovieListView(movieModel: MovieListViewModel(movieId: movieId, movies))
        )
    }
}

struct MovieCarouselView_Previews: PreviewProvider {
    
    static var movie: [Movie] {
        [Movie(id: 507086,
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
        ),
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
         ),
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
         ),
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
         )]
    }
    
    static var previews: some View {
        NavigationView {
            MovieCarouselView(
                movieId: 507086,
                movies: movie.map(MovieModel.init),
                destination: { movie in Text(movie.title) }
            ).frame(height: 250)
        }
    }
}
