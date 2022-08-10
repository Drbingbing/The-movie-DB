//
//  AccessTokenResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/27.
//

import Foundation

struct AccessTokenResult: Decodable {
    
    let accessToken: String
    let accountID: String
    let success: Bool
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case success
        case accountID = "account_id"
    }
}
