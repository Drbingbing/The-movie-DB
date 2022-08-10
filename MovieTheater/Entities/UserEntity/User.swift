//
//  User.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

struct User: Decodable {
    
    let name: String
    let id: Int
    let userName: String
    let includeAdult: Bool
    
    private enum CodingKeys: String, CodingKey {
        case name
        case id
        case userName = "username"
        case includeAdult = "include_adult"
    }
}
