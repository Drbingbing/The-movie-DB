//
//  NetworkConfiguration.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

final class NetworkConfiguration {
    
    static let shared = NetworkConfiguration()
    
    private(set) var apiKey: String = ""
    private(set) var readAccessToken: String = ""
    
    func configuration(apiKey: String, readAccessToken: String) {
        self.apiKey = apiKey
        self.readAccessToken = readAccessToken
    }
}
