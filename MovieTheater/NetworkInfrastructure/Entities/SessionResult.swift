//
//  SessionResult.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/27.
//

import Foundation

struct SessionResult: Decodable {
    
    let success: Bool
    let sessionId: String
    
    private enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}
