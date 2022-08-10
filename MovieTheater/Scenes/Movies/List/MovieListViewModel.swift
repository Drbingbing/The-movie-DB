//
//  MovieListViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/9.
//

import Foundation
import Combine

final class MovieListViewModel: ObservableObject {
    
    private let moviesRepository: MoviesRepositoryProtocol
    
    private var cancellable: [AnyCancellable] = []
    
    @Published var movieState: ViewState<MovieModel>
    
    private let movieId: Int
    
    init(movieId: Int, _ initialValue: [MovieModel] = []) {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.moviesRepository = remoteDataSource.moviesRepository()
        self.movieState = .paging(initialValue, next: 1)
        self.movieId = movieId
        self.fetch()
    }
    
    func fetch() {
        let next = movieState.currentPage + 1
        
        moviesRepository.getSimilarMovies(movieId, page: next)
            .sink { [weak self] completion in
                if let error = completion.error {
                    self?.movieState = .error(error)
                }
            } receiveValue: { [weak self] movies in
                self?.proccessResult(movies)
            }
            .store(in: &cancellable)
    }
    
    private func proccessResult(_ entities: [Movie]) {
        let movies = entities.map(MovieModel.init)
        
        let currentEntities = self.movieState.currentEntities
        let currentPage = self.movieState.currentPage
        self.movieState = self.processResult(movies, currentPage: currentPage, currentEntities: currentEntities)
    }
    
    func prefetch(at movie: MovieModel) {
        let movies = movieState.currentEntities
        guard let index = movies.firstIndex(of: movie) else { return }
        let total = movies.count
        let offset = 3
        
        let threshold = max((total - offset), 0) - index
        
        if threshold == 0 {
            fetch()
        }
    }
}
