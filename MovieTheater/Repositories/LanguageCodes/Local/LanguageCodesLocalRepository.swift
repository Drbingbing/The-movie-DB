//
//  LanguageCodesLocalRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

final class LanguageCodesLocalRepository: LanguageCodesLocalRepositoryProtocol {
    
    let store: PersistenceStore<CDLanguageCode>
    
    init(store: PersistenceStore<CDLanguageCode>) {
        self.store = store
    }
    
    func saveLanguageCodes(_ codes: [LanguageCode]) {
        codes.forEach {
            store.saveLanguageCodes($0)
        }
    }
    
    func find(by alpha2: String) -> LanguageCode? {
        store.find(by: alpha2)?.asDomain()
    }
    
    func findAll() -> [LanguageCode] {
        store.findAll().map { $0.asDomain() }
    }
}
