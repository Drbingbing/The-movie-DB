//
//  LanguageCode.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

struct LanguageCode: Decodable {
    
    let name: String
    let alpha2: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "English"
        case alpha2 = "alpha2"
    }
}
