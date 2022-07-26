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

extension CountryCodesProvider: DataHubEndpoint {
    
    var path: String {
        return "/core/currency-codes/r/codes-all.json"
    }
}
