//
//  URLRequest+Extensions.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

extension URLRequest {
    
    mutating func setJSONContentType() {
        setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
}
