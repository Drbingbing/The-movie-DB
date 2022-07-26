//
//  CountryCodeHelper.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import Foundation

struct CountryCodeHelper {
    
    static func countryName(_ code: String) -> String {
        let local = Locale.current as NSLocale
        let countryName = local.displayName(forKey: .countryCode, value: code.uppercased())
        
        return countryName ?? "-"
    }
}
