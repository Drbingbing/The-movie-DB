//
//  LanguageCodesHandlerProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

protocol LanguageCodesHandlerProtocol {
    
    func setLanguageCodes(_ codes: [LanguageCode])
    
    func getLanguageName(for alpha2: String) -> String?
}


final class LanguageCodesHandler: LanguageCodesHandlerProtocol {
    
    private var languageCodes: [LanguageCode] = []
    
    func setLanguageCodes(_ codes: [LanguageCode]) {
        self.languageCodes = codes
    }
    
    func getLanguageName(for alpha2: String) -> String? {
        if let code = languageCodes.first(where: { $0.alpha2 == alpha2 }) {
            return code.name
        }
        
        return nil
    }
}
