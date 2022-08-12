//
//  tvsViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Foundation
import Combine

final class TvShowsViewModel: ObservableObject {
    
    @Published var tvState: ViewState<TvShowModel> = .initial
    
    @Published var navigationTitle: String = LocalizedStrings.popularTvTitle()
    @Published var category: Category = .popular
    
    private let interactor: TVsRepositoryProtocol
    private var cancellable: [AnyCancellable] = []
    
    init() {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.interactor = remoteDataSource.tvsRepository()
    }
    
    func fetch(page: Int) {
        self.fetchTvShows(page: page)
            .sink { [weak self] completion in
                if let error = completion.error {
                    self?.tvState = .error(error)
                }
            } receiveValue: { [weak self] tvs in
                self?.proccessResult(tvs)
            }
            .store(in: &cancellable)
        
        let stream = $category
            .dropFirst()
            .removeDuplicates()
            .share()
        
        stream.sink { [weak self] value in
            self?.updateNavigationTitle(for: value)
        }
        .store(in: &cancellable)
        
        stream.sink { [weak self] value in
            self?.tvState = .initial
        }
        .store(in: &cancellable)
        
        stream.flatMap {
            self.fetchTvShows(category: $0)
        }
        .sink { [weak self] completion in
            if let error = completion.error {
                self?.tvState = .error(error)
            }
        } receiveValue: { [weak self] tvShows in
            self?.proccessResult(tvShows)
        }
        .store(in: &cancellable)
    }
    
    private func fetchTvShows(page: Int) -> AnyPublisher<[TvShow], Error> {
        switch category {
        case .topRated:
            return interactor.getTopRatedTvShows(page: page)
        case .onTV:
            return interactor.getOnAirTvShows(page: page)
        case .airingToday:
            return interactor.getAiringTodayTvShows(page: page)
        case .popular:
            return interactor.getPopularTvShows(page: page)
        }
    }
    
    private func fetchTvShows(category: Category) -> AnyPublisher<[TvShow], Error> {
        switch category {
        case .topRated:
            return interactor.getTopRatedTvShows(page: 1)
        case .onTV:
            return interactor.getOnAirTvShows(page: 1)
        case .airingToday:
            return interactor.getAiringTodayTvShows(page: 1)
        case .popular:
            return interactor.getPopularTvShows(page: 1)
        }
    }
    
    private func proccessResult(_ entities: [TvShow]) {
        let tvs = entities.map(TvShowModel.init)
        
        let currentPage = self.tvState.currentPage
        let currentEntities = self.tvState.currentEntities
        
        self.tvState = self.processResult(tvs, currentPage: currentPage, currentEntities: currentEntities)
    }
    
    private func updateNavigationTitle(for category: Category) {
        switch category {
        case .popular:
            self.navigationTitle = LocalizedStrings.popularTvTitle()
        case .topRated:
            self.navigationTitle = LocalizedStrings.topRatedTvTitle()
        case .onTV:
            self.navigationTitle = LocalizedStrings.onTheAirTvTitle()
        case .airingToday:
            self.navigationTitle = LocalizedStrings.airingTodayTvTitle()
        }
    }
    
    func reset() {
        self.tvState = .initial
        self.fetch(page: 1)
    }
    
    func fetchNext() {
        let page = self.tvState.currentPage + 1
        self.fetch(page: page)
    }
    
    func categories() -> [Category] {
        return [.popular, .airingToday, .onTV, .topRated]
    }
    
    func didSelectCategory(_ category: Category) {
        self.category = category
    }
}

extension TvShowsViewModel {
    
    enum Category {
        
        case popular
        case airingToday
        case onTV
        case topRated
        
        var localized: String {
            switch self {
            case .popular:
                return LocalizedStrings.popularTvSearchTitle()
            case .airingToday:
                return LocalizedStrings.airingTodayTvSearchTitle()
            case .onTV:
                return LocalizedStrings.onTheAirTvSearchTitle()
            case .topRated:
                return LocalizedStrings.topRatedTvSearchTitle()
            }
        }
    }
    
}
