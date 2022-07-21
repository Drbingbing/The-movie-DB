//
//  ImageConfigurationResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

struct ConfigurationResult: Decodable {
    
    let images: ImageConfiguration
    let sortKeys: [String]
    
    private enum CodingKeys: String, CodingKey {
        case images = "images"
        case sortKeys = "change_keys"
    }
}
