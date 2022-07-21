//
//  BaseConfiguration.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

struct BaseConfiguration: Decodable {
    
    struct Keys: Decodable {
        let readAccessToken: String
        let apiKey: String
        
        private enum CodingKeys: String, CodingKey {
            case readAccessToken = "ReadAccessToken"
            case apiKey = "ApiKey"
        }
    }
    
    let keys: Keys
    
    private enum CodingKeys: String, CodingKey {
        case keys = "TheMovieDb"
    }
}
