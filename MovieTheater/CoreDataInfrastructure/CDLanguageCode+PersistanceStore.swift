//
//  CDLanguageCode+PersistanceStore.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

extension PersistenceStore where Entity == CDLanguageCode {
    
    func saveLanguageCodes(_ code: LanguageCode) {
        managedObjectContext.performChanges {
            _ = CDLanguageCode.insert(
                into: self.managedObjectContext,
                name: code.name,
                alpha2: code.alpha2
            )
        }
    }
    
    func find(by alpha2: String) -> CDLanguageCode? {
        let predicate = NSPredicate(format: "alpha2 == %d", alpha2)
        
        return CDLanguageCode.findOrFetch(in: managedObjectContext, predicate: predicate)
    }
    
    func findAll() -> [CDLanguageCode] {
        return CDLanguageCode.fetch(in: managedObjectContext)
    }
}
