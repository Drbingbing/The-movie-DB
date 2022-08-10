//
//  AccountViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation
import Combine
import CombineExt

final class AccountViewModel: ObservableObject {
    
    @Published var currentUser: User?
    @Published var authError: String?
    @Published var authURL: URL?
    
    @Published var authorized: Bool = false
    @Published var isStartAuthorization: Bool = false
    
    private let authRepository: AuthRepositoryProtocol
    private let userRepository: UserRepositoryProtocol
    private var cancellables: [AnyCancellable] = []
    
    init() {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.authRepository = remoteDataSource.authRepository()
        self.userRepository = DIContainer.shared.resolve()
    }
    
    func startAuthorization() {
        authorized = false
        isStartAuthorization = true
        
        $authorized
            .filter { $0 }
            .flatMap { [authRepository] _ in
                authRepository.signInUser()
            }
            .sink { [weak self] completion in
                self?.isStartAuthorization = false
                if let error = completion.error {
                    self?.authError = error.localizedDescription
                }
            } receiveValue: { [weak self] user in
                self?.saveUser(user)
            }
            .store(in: &cancellables)
        
        authRepository
            .getAuthURL()
            .sink { [weak self] completion in
                if let error = completion.error {
                    self?.authError = error.localizedDescription
                    self?.isStartAuthorization = false
                }
            } receiveValue: { [weak self] url in
                self?.authURL = url
            }
            .store(in: &cancellables)
    }
    
    private func saveUser(_ user: User) {
        currentUser = user
        userRepository.saveUser(user)
    }
}
