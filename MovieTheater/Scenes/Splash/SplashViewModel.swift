//
//  SplashViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation
import Combine

final class SplashViewModel: ObservableObject {
    
    private let configurationInteractor: ConfigurationRepositoryProtocol
    private let genreInteractor: GenreRepositoryProtocol
    private let languageCodesInteractor: LanguageCodesRepositoryProtocol
    private let configurationHandler: ConfigurationHandlerProtocol
    private let languageCodesHandler: LanguageCodesHandlerProtocol
    private let genreHandler: GenreHandlerProtocol
    
    private var cancellables: [AnyCancellable] = []
    
    @Published var state: State = .loading
    
    init() {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.configurationInteractor = remoteDataSource.configurationRepository()
        self.configurationHandler = DIContainer.shared.resolve()
        self.genreInteractor = DIContainer.shared.resolve()
        self.languageCodesInteractor = DIContainer.shared.resolve()
        self.languageCodesHandler = DIContainer.shared.resolve()
        self.genreHandler = DIContainer.shared.resolve()
        self.binding()
    }
    
    func binding() {
        
        configurationInteractor.getAppConfiguration()
            .zip(genreInteractor.fetchAll())
            .sink { completion in
                self.state = .end
            } receiveValue: { [weak self] configuration, genres in
                self?.updateConfiguration(configuration)
                self?.updateAvailableGenres(genres)
            }
            .store(in: &cancellables)

        languageCodesInteractor.fetchAll()
            .catch { error in
                Empty(completeImmediately: true)
            }
            .sink { [weak self] codes in
                self?.updateLanguageCodes(codes)
            }
            .store(in: &cancellables)
    }
    
    
    private func updateConfiguration(_ configuration: Configuration?) {
        configurationHandler.setConfiguration(configuration)
    }
    
    private func updateAvailableGenres(_ genres: [Genre]) {
        genreHandler.setGenres(genres)
    }
    
    private func updateLanguageCodes(_ codes: [LanguageCode]) {
        languageCodesHandler.setLanguageCodes(codes)
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
