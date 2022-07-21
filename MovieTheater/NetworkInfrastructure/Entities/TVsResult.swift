//
//  TVsResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Foundation

struct TVsResult: Decodable {
    
    let results: [TV]
    let page: Int
    
    let totalResults: Int
    let totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case results = "results"
        case page = "page"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
