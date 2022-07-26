//
//  MovieDetailViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation
import Combine

final class MovieDetailViewModel: ObservableObject {
    
    private(set) var movie: MovieModel
    
    private let moviesRepository: MoviesRepositoryProtocol
    private let genreInteractor: GenreRepositoryProtocol
    private var cancellables: [AnyCancellable] = []
    
    @Published var genreName: String = "-"
    
    @Published var backdropURL: URL?
    
    @Published var actors: [ActorModel] = []
    
    @Published var navigationTitle: String = ""
    
    @Published var showCredits: Bool = false
    
    @Published var showSimilars: MovieModel?
    
    @Published var similarMovies: [MovieModel] = []
    
    init(movie: MovieModel) {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.moviesRepository = remoteDataSource.moviesRepository()
        self.movie = movie
        self.backdropURL = movie.backdropURL
        self.navigationTitle = movie.title
        self.genreInteractor = DIContainer.shared.resolve()
        self.fetch()
    }
    
    func fetch() {
        let genreIDs = movie.genreIDs
        
        Publishers.Sequence<[Int], Never>(sequence: genreIDs)
            .flatMap { [genreInteractor] id in
                genreInteractor.find(with: id)
            }
            .collect()
            .map { genres in
                genres.map(\.name)
            }
            .map { $0.joined(separator: ",") }
            .replaceError(with: "-")
            .sink { [weak self] value in
                self?.genreName = value
            }
            .store(in: &cancellables)
        
        let movie = self.movie
        moviesRepository.getMovieDetail(movie.movieID)
            .map(MovieModel.init)
            .replaceError(with: movie)
            .sink { [weak self] value in
                self?.movie = value
            }
            .store(in: &cancellables)
        
        if actors.isEmpty {
            moviesRepository.getMovieCredits(movie.movieID)
                .`catch` { error in
                    Empty<[Actor], Never>()
                }
                .map {
                    $0.map(ActorModel.init)
                }
                .sink { [weak self] value in
                    self?.actors = value
                }
                .store(in: &cancellables)
        }
        
        if similarMovies.isEmpty {
            moviesRepository.getSimilarMovies(movie.movieID, page: 1)
                .`catch` { error in
                    Empty<[Movie], Never>()
                }
                .map {
                    $0.map(MovieModel.init)
                }
                .sink { [weak self] value in
                    self?.similarMovies = value
                }
                .store(in: &cancellables)
        }
    }
    
    func showSimilarMovies() {
        self.showSimilars = movie
    }
    
    func showingCredits() {
        if self.actors.isEmpty {
            return
        }
        
        self.showCredits = true
    }
}
