//
//  Company.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import Foundation

struct Company: Decodable, Equatable {
    
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "logo_path"
        case name = "name"
        case originCountry = "origin_country"
    }
}
