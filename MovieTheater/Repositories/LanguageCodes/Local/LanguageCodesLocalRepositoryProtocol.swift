//
//  LanguageCodesLocalRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

protocol LanguageCodesLocalRepositoryProtocol {
    
    func saveLanguageCodes(_ codes: [LanguageCode])
    
    func find(by alpha2: String) -> LanguageCode?
    
    func findAll() -> [LanguageCode]
}
