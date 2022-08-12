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
    
    let birthday: String?
    let birthPlace: String?
    let knownFor: String?
    let knownAs: [String]?
    let gender: Int?
    let biography: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case adult = "adult"
        case name = "name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        
        case birthday = "birthday"
        case knownFor = "known_for_department"
        case knownAs = "also_known_as"
        case gender = "gender"
        case birthPlace = "place_of_birth"
        case biography = "biography"
    }
}
