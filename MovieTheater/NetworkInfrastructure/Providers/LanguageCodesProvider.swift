//
//  LanguageCodesProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

// https://datahub.io/core/language-codes/r/language-codes.json

enum LanguageCodesProvider {
    
    case getLanguageCodes
}

extension LanguageCodesProvider: DataHubEndpoint {
    
    var path: String {
        switch self {
        case .getLanguageCodes:
            return "/core/language-codes/r/language-codes.json"
        }
    }
}
