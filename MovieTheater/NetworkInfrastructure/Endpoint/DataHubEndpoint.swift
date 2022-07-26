//
//  DataHubEndpoint.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation


protocol DataHubEndpoint: Endpoint {}

extension DataHubEndpoint {
    
    private var scheme: String {
        return "https"
    }

    private var host: String {
        return "datahub.io"
    }
    
    var parameterEncoding: ParameterEndcoding {
        return .defaultEncoding
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var params: [String : Any]? {
        return nil
    }
    
    
    var urlComponents: URLComponents {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        
        return component
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
