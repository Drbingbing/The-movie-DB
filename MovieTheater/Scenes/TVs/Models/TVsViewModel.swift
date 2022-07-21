//
//  tvsViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Foundation
import Combine

final class TVsViewModel: ObservableObject {
    
    @Published var tvState: ViewState<TVModel> = .initial
    
    private let pageThroughSubject = PassthroughSubject<Int, Never>()
    private let interactor: TVsRepositoryProtocol
    private var cancellable: [AnyCancellable] = []
    
    init() {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.interactor = remoteDataSource.tvsRepository()
        self.binding()
        self.reset()
    }
    
    private func binding() {
        pageThroughSubject
            .flatMap(self.interactor.getOnAirTVs)
            .sink { [weak self] completion in
                if let error = completion.error {
                    self?.tvState = .error(error)
                }
            } receiveValue: { [weak self] tvs in
                self?.proccessResult(tvs)
            }
            .store(in: &cancellable)
    }
    
    private func proccessResult(_ entities: [TV]) {
        let tvs = entities.map(TVModel.init)
        
        let currentPage = self.tvState.currentPage
        let currentEntities = self.tvState.currentEntities
        
        self.tvState = self.processResult(tvs, currentPage: currentPage, currentEntities: currentEntities)
    }
    
    func reset() {
        self.tvState = .initial
        pageThroughSubject.send(1)
    }
    
    func fetchNext() {
        let page = self.tvState.currentPage + 1
        pageThroughSubject.send(page)
    }
}
