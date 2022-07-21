//
//  SplashViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation
import Combine

final class SplashViewModel: ObservableObject {
    
    let interactor: ConfigurationRepositoryProtocol
    let configurationHandler: ConfigurationHandlerProtocol
    
    private var cancellables: [AnyCancellable] = []
    
    @Published var state: State = .loading
    
    init() {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.interactor = remoteDataSource.configurationRepository()
        self.configurationHandler = DIContainer.shared.resolve()        
        self.binding()
    }
    
    func binding() {
        
        let result = interactor.getAppConfiguration()
        
        $state
            .removeDuplicates()
            .prefix(while: { $0 == .loading })
            .flatMap { _ in result }
            .replaceError(with: nil)
            .sink { [weak self] configuration in
                self?.updateConfiguration(configuration)
                self?.state = .end
            }
            .store(in: &cancellables)
    }
    
    func initialDownload() {
        self.state = .loading
    }
    
    func updateConfiguration(_ configuration: Configuration?) {
        configurationHandler.setConfiguration(configuration)
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
