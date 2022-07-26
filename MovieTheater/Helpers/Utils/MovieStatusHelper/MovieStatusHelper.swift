//
//  MovieStatusHelper.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import Foundation

struct MovieStatusHelper {
    
    static func locaized(_ status: String) -> String {
        
        switch status {
        case "Released":
            return LocalizedStrings.movieStatusReleased()
        case "Rumored":
            return LocalizedStrings.movieStatusRumored()
        case "Planned":
            return LocalizedStrings.movieStatusPlanned()
        case "In Production":
            return LocalizedStrings.movieStatusInProduction()
        case "Post Production":
            return LocalizedStrings.movieStatusPostProduction()
        case "Canceled":
            return LocalizedStrings.movieStatusCancelled()
        default:
            return ""
        }
        
    }
}
