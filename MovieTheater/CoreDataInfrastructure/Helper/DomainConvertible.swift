//
//  DomainConvertible.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation

protocol DomainConvertible {
    associatedtype Domain
    
    func asDomain() -> Domain
}
