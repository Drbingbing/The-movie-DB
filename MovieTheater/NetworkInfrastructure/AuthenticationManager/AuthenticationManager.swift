//
//  AuthenticationManager.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    
    var readAccessToken: String {
        NetworkConfiguration.shared.readAccessToken
    }
    
    private(set) var requestToken: String?
    private(set) var accessToken: String?
    private(set) var sessionId: String?
    private(set) var currentUserId: String?
    
    func saveRequestToken(_ token: String) {
        self.requestToken = token
    }
    
    func saveAccessToken(_ token: String) {
        self.accessToken = token
    }
    
    func saveCurrentUser(
        _ sessionId: String,
        accountId: Int
    ) {
        self.sessionId = sessionId
        self.currentUserId = String(accountId)
    }
}
