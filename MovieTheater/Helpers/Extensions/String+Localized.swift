//
//  String+Localized.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Foundation

extension String {
    
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: self, comment: "")
    }
}
