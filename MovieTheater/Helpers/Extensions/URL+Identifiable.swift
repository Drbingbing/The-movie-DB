//
//  URL+Identifiable.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/27.
//

import Foundation

extension URL: Identifiable {
    public typealias ID = String
    
    public var id: String {
        return absoluteString
    }
}
