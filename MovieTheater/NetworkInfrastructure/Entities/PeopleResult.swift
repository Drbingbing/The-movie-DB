//
//  PeopleResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Foundation

struct PeopleResult: Decodable {
    
    let page: Int
    let results: [Person]
    let totalResults: Int
    let totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case results = "results"
        case page = "page"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
