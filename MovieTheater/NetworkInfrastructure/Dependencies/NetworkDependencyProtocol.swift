//
//  NetworkDependencies.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

protocol NetworkDependencyProtocol {
    
    var session: URLSession { get }
    
    var backgroundScheduler: OperationQueue { get }
    
    var mainScheduler: OperationQueue { get }
}
