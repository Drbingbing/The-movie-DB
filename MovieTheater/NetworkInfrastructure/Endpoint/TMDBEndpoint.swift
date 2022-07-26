//
//  Endpoint.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

protocol TMDBEndpoint: Endpoint {
    
    var headers: [String: String]? { get }
}

extension TMDBEndpoint {
    
    private var scheme: String {
        return "https"
    }

    private var host: String {
        return "api.themoviedb.org"
    }
    
    private var apiKey: String {
        return NetworkConfiguration.shared.apiKey
    }
    
    private var language: String {
        return "zh"
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var urlComponents: URLComponents {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        var queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: language)
        ]
        
        switch parameterEncoding {
        case .defaultEncoding:
            if let params = params, method == .get {
                queryItems.append(
                    contentsOf: params.map { URLQueryItem(name: $0, value: "\($1)") }
                )
            }
        case .compositeEndcoding:
            if let params = params, let queryParams = params["query"] as? [String: Any] {
                queryItems.append(
                    contentsOf: queryParams.map { URLQueryItem(name: $0, value: "\($1)") }
                )
            }
        case .jsonEndcoding:
            break
        }
        
        component.queryItems = queryItems
        
        return component
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                request.setHeader(for: key, with: value)
            }
        }
        
        guard let params = params, method != .get else { return request }
        
        switch parameterEncoding {
        case .defaultEncoding:
            request.httpBody = params.percentEscaped().data(using: .utf8)
        case .jsonEndcoding:
            request.setJSONContentType()
            let jsonData = try? JSONSerialization.data(withJSONObject: params)
            request.httpBody = jsonData
        case .compositeEndcoding:
            if let bodyParams = params["body"] as? [String: Any] {
                request.setJSONContentType()
                let jsonData = try? JSONSerialization.data(withJSONObject: bodyParams)
                request.httpBody = jsonData
            }
        }
        
        return request
    }
}

