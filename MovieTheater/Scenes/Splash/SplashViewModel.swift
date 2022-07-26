//
//  SplashViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation
import Combine

final class SplashViewModel: ObservableObject {
    
    let configurationInteractor: ConfigurationRepositoryProtocol
    let genreInteractor: GenreRepositoryProtocol
    let configurationHandler: ConfigurationHandlerProtocol
    
    private var cancellables: [AnyCancellable] = []
    
    @Published var state: State = .loading
    
    init() {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.configurationInteractor = remoteDataSource.configurationRepository()
        self.configurationHandler = DIContainer.shared.resolve()
        self.genreInteractor = DIContainer.shared.resolve()
        self.binding()
    }
    
    func binding() {
        
        configurationInteractor.getAppConfiguration()
            .zip(genreInteractor.fetchAll())
            .sink { completion in
                self.state = .end
            } receiveValue: { [weak self] configuration, genres in
                self?.updateConfiguration(configuration)
                self?.updateAvilableGenres(genres)
            }
            .store(in: &cancellables)

    }
    
    
    func updateConfiguration(_ configuration: Configuration?) {
        configurationHandler.setConfiguration(configuration)
    }
    
    func updateAvilableGenres(_ genres: [Genre]) {
        
    }
}

extension SplashViewModel {
    
    enum State: Equatable {
        static func == (lhs: SplashViewModel.State, rhs: SplashViewModel.State) -> Bool {
            switch (lhs, rhs) {
            case (.error, .error):
                return true
            case (.loading, .loading):
                return true
            case (.end, .end):
                return true
            default:
                return false
            }
        }
        
        case loading
        case end
        case error(Error)
    }
    
}
