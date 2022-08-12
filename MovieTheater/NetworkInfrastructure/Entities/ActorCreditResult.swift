//
//  CreditsResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import Foundation

struct ActorCreditResult: Decodable {
    
    let id: Int
    let cast: [Actor]
}
