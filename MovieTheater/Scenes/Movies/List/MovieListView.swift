//
//  MovieListView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/9.
//

import SwiftUI
import Kingfisher

struct MovieListView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var movieModel: MovieListViewModel
    
    var body: some View {
        Group {
            switch movieModel.movieState {
            case let .paging(movies, _), let .populated(movies):
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(movies) { movie in
                            
                            NavigationLink(destination: { showMovieDetail(movie) }) {
                                HStack(spacing: 20) {
                                    KFImage(movie.posterURL)
                                        .resizable()
                                        .placeholder { _ in
                                            ProgressView()
                                        }
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text(movie.title)
                                            .bold()
                                            .font(.title2)
                                        Spacer()
                                        HStack {
                                            Text("類型: ")
                                                .bold()
                                            Text(movie.genreName)
                                        }
                                        .font(.title3)
                                        Spacer()
                                        if let releaseDate = movie.releaseDate {
                                            Text(releaseDate)
                                        }
                                        Spacer()
                                    }
                                    .frame(maxHeight: .infinity)
                                    
                                    Spacer()
                                    
                                    CircularProgressView(value: movie.voteAverage)
                                        .frame(width: 40)
                                }
                                .padding(.horizontal, 12)
                                .onAppear {
                                    movieModel.prefetch(at: movie)
                                }
                                .id(movie.id)
                            }
                        }
                    }
                }
                .navigationTitle(Text(LocalizedStrings.movieDetailSimilarTitle()))
                .navigationBarTitleDisplayMode(.inline)
            default:
                ProgressView()
            }
        }
        .navigationBarBackground {
            Color.white
        }
    }
    
    func showMovieDetail(_ movie: MovieModel) -> some View {
        MovieDetailView(movieModel: MovieDetailViewModel(movie: movie))
    }
}

struct MovieListView_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieListView(movieModel: MovieListViewModel(movieId: 507086))
    }
}
