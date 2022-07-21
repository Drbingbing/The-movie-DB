//
//  MovieResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import Foundation

struct MovieResult: Decodable {
    
    let result: [Movie]
    let currentPage: Int
    
    let totalPage: Int
    let totalCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case result = "results"
        case currentPage = "page"
        case totalPage = "total_pages"
        case totalCount = "total_results"
    }
}
