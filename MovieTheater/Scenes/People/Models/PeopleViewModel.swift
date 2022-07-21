//
//  PeopleViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Foundation
import Combine

final class PeopleViewModel: ObservableObject {
    
    private let interactor: PeopleRepositoryProtocol
    private let pageThroughSubject = PassthroughSubject<Int, Never>()
    private var cancellable: [AnyCancellable] = []
    
    @Published var peopleState: ViewState<PersonModel> = .initial
    
    init() {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.interactor = remoteDataSource.peopleRepository()
        self.binding()
        self.reset()
    }
    
    private func binding() {
        
        pageThroughSubject
            .flatMap(self.interactor.getPopularPeople)
            .sink { [weak self] completion in
                if let error = completion.error {
                    self?.peopleState = .error(error)
                }
            } receiveValue: { [weak self] people in
                self?.proccessResult(people)
            }
            .store(in: &cancellable)
    }
    
    private func proccessResult(_ entities: [Person]) {
        let currentPage = self.peopleState.currentPage
        let currentEntities = self.peopleState.currentEntities
        let people = entities.map(PersonModel.init)
        
        self.peopleState = self.processResult(people, currentPage: currentPage, currentEntities: currentEntities)
    }
    
    func reset() {
        self.peopleState = .initial
        self.pageThroughSubject.send(1)
    }
    
    func fetchNext() {
        if case .populated = self.peopleState {
            return
        }
        
        let next = peopleState.currentPage + 1
        self.pageThroughSubject.send(next)
    }
}
