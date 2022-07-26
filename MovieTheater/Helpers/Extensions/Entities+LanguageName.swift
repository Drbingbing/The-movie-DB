//
//  Entities+LanguageName.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

protocol LanguageNameable {
    
    var languageName: String { get }
    var languageCode: String { get }
}

extension LanguageNameable {
    
    var languageHandler: LanguageCodesHandlerProtocol {
        return DIContainer.shared.resolve()
    }
    
    var languageName: String {
        guard let name = languageHandler.getLanguageName(for: languageCode) else {
            return "-"
        }
        
        return name
    }
}

extension Movie: LanguageNameable {
    
    var languageCode: String {
        return originalLanguage
    }
}
