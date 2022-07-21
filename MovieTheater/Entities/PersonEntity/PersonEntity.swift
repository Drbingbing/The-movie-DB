//
//  PersonEntity.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Foundation

struct Person: Decodable {
    
    let id: Int
    let adult: Bool
    let profilePath: String?
    let name: String
    let popularity: Float
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case adult = "adult"
        case name = "name"
        case popularity = "popularity"
        case profilePath = "profile_path"
    }
}
