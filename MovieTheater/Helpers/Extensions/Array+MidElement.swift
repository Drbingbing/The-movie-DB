//
//  Array+MidElement.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

extension Array {
    
    var mid: Element? {
        guard !isEmpty else { return nil }
        
        let count = self.count
        
        let midIndex = (count > 1 ? count - 1 : count) / 2
        return self[midIndex]
    }
}
