//
//  Localizable.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Foundation

protocol Localizable {
    
    var tableName: String { get }
    var localized: String { get }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    
    var tableName: String {
        return "Localizable"
    }
    
    var localized: String {
        return rawValue.localized(tableName: tableName)
    }
    
    func callAsFunction() -> String {
        return self.localized
    }
}
