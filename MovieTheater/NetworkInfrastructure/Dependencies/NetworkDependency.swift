//
//  NetworkDependency.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

final class NetworkDependency: NetworkDependencyProtocol {
    
    let session: URLSession
    
    let backgroundScheduler: OperationQueue
    let mainScheduler: OperationQueue
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
        
        self.mainScheduler = OperationQueue.main
        
        let backgroundQueue = OperationQueue()
        backgroundQueue.maxConcurrentOperationCount = 2
        backgroundQueue.qualityOfService = .userInitiated
        self.backgroundScheduler = backgroundQueue
    }
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        self.init(configuration: configuration)
    }
}
