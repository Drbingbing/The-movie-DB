//
//  ExternalIDResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/11.
//

import Foundation

struct ExternalIDResult: Decodable {
    
    let facebookID: String?
    let twitterID: String?
    let id: Int
    let instagramID: String?
    
    private enum CodingKeys: String, CodingKey {
        case facebookID = "facebook_id"
        case twitterID = "twitter_id"
        case id
        case instagramID = "instagram_id"
    }
}
