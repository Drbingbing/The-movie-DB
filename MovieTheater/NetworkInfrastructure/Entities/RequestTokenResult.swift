//
//  RequestTokenResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

struct RequestTokenResult: Decodable {
    
    let success: Bool
    let token: String
    
    private enum CodingKeys: String, CodingKey {
        case success = "success"
        case token = "request_token"
    }
}
