//
//  ImageConfiguration.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

struct ImageConfiguration: Decodable {
    
    let baseURLString: String
    let posterSizes: [String]
    let logoSizes: [String]
    let backdropSizes: [String]
    
    private enum CodingKeys: String, CodingKey {
        case baseURLString = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case posterSizes = "poster_sizes"
        case logoSizes = "logo_sizes"
    }
}
