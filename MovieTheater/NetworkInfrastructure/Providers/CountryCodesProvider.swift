//
//  CountryCodeProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

// https://datahub.io/core/currency-codes/r/codes-all.json

enum CountryCodesProvider {
    
    case getCountryCodes
}

extension CountryCodesProvider {
    
    private var host: String {
        return "datahub.io"
    }
    
    var path: String {
        return "/core/currency-codes/r/codes-all.json"
    }
    
    var urlComponent: URLComponents {
        var component = URLComponents()
        component.scheme = "https"
        component.host = host
        component.path = path
        
        return component
    }
    
    var request: URLRequest {
        let url = urlComponent.url!
        
        return URLRequest(url: url)
    }
}
