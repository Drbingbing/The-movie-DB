//
//  MovieCreditResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/11.
//

import Foundation

struct MovieCreditResult: Decodable {
    
    let id: Int
    let cast: [Movie]
}
