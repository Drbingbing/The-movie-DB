//
//  Dictionary+Extensions.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

extension Dictionary {
    func percentEscaped() -> String {
        return map { key, value in
            let escapeKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let escapeValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return escapeKey + "=" + escapeValue
        }.joined(separator: "&")
    }
}
