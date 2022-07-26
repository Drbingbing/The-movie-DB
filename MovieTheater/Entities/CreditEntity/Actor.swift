//
//  Credit.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import Foundation

struct Actor: Decodable {
    
    let id: Int
    let name: String
    let character: String
    let profilePath: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case character
        case profilePath = "profile_path"
    }
}
