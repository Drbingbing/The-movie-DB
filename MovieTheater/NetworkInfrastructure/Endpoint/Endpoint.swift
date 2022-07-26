//
//  Endpoint.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

protocol Endpoint {
    
    var path: String { get }
    var params: [String: Any]? { get }
    var parameterEncoding: ParameterEndcoding { get }
    var method: HttpMethod { get }
    
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

enum ParameterEndcoding {
    case defaultEncoding
    case jsonEndcoding
    case compositeEndcoding
}
