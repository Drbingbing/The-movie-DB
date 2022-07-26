//
//  AppGroup.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation

enum AppGroup: String, CaseIterable {
    
    case movieTheator = "group.movieTheator"
    
    static var allCaseIdentifiers: [String] {
        return AppGroup.allCases.map(\.rawValue)
    }
}
