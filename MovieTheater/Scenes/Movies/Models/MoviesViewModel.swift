//
//  MoviesViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import SwiftUI
import Combine
import CombineExt

final class MoviesViewModel: ObservableObject {
    
    let interactor: MoviesRepositoryProtocol
    
    @Published var movieState: ViewState<MovieModel> = .initial
    
    @Published var navigationTitle: String = LocalizedStrings.nowPlayingMoviesTitle()
    
    @Published var category: Category = .nowPlaying
    
    private let pageIndicatorSubject = PassthroughSubject<Int, Never>()
    private var cancellable: [AnyCancellable] = []
    
    init() {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.interactor = remoteDataSource.moviesRepository()
        self.binding()
        self.reset()
    }
    
    private func binding() {
        
        pageIndicatorSubject
            .flatMap(self.fetchMovies(page:))
            .sink { [weak self] completion in
                if let error = completion.error {
                    self?.movieState = .error(error)
                }
            } receiveValue: { [weak self] movies in
                self?.proccessResult(movies)
            }
            .store(in: &cancellable)
        
        let stream = $category
            .removeDuplicates()
            .share()
        
        stream
            .flatMap(self.fetchMovies(category:))
            .sink { [weak self] completion in
                if let error = completion.error {
                    self?.movieState = .error(error)
                }
            } receiveValue: { [weak self] movies in
                self?.proccessResult(movies)
            }
            .store(in: &cancellable)
        
        stream
            .sink { [weak self] value in
                self?.movieState = .initial
                self?.updateNavigationTitle(for: value)
            }
            .store(in: &cancellable)
    }
    
    private func proccessResult(_ entities: [Movie]) {
        let movies = entities.map(MovieModel.init)
        
        let currentEntities = self.movieState.currentEntities
        let currentPage = self.movieState.currentPage
        self.movieState = self.processResult(movies, currentPage: currentPage, currentEntities: currentEntities)
    }
    
    private func fetchMovies(page: Int) -> AnyPublisher<[Movie], Error> {
        switch category {
        case .nowPlaying:
            return interactor.getNowPlayingMovies(page: page)
        case .popular:
            return interactor.getPopularMovies(page: page)
        case .upcoming:
            return interactor.getUpcomingMovies(page: page)
        }
    }
    
    private func fetchMovies(category: Category) -> AnyPublisher<[Movie], Error> {
        switch category {
        case .nowPlaying:
            return interactor.getNowPlayingMovies(page: 1)
        case .popular:
            return interactor.getPopularMovies(page: 1)
        case .upcoming:
            return interactor.getUpcomingMovies(page: 1)
        }
    }
    
    private func updateNavigationTitle(for category: Category) {
        switch category {
        case .nowPlaying:
            self.navigationTitle = LocalizedStrings.nowPlayingMoviesTitle()
        case .popular:
            self.navigationTitle = LocalizedStrings.popularMoviesTitle()
        case .upcoming:
            self.navigationTitle = LocalizedStrings.upcomingMoviesTitle()
        }
    }
    
    func reset() {
        self.movieState = .initial
        pageIndicatorSubject.send(1)
    }
    
    func fetchNext() {
        let next = self.movieState.currentPage + 1
        pageIndicatorSubject.send(next)
    }
    
    func categories() -> [Category] {
        return [.nowPlaying, .popular, .upcoming]
    }
    
    func didTapMenu(for category: Category) {
        self.category = category
    }
}

extension MoviesViewModel {
    
    enum Category {
        
        case nowPlaying
        
        case popular
        
        case upcoming
        
        var title: String {
            switch self {
            case .nowPlaying:
                return LocalizedStrings.nowPlayingMoviesSearchTitle()
            case .popular:
                return LocalizedStrings.popularMoviesSearchTitle()
            case .upcoming:
                return LocalizedStrings.upcomingMoviesSearchTitle()
            }
        }
    }
    
}
