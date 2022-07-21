//
//  DataSourceAssembly.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation
import Swinject

final class DataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NetworkDependencyProtocol.self) { _ in
            NetworkDependency()
        }
        
        container.register(RemoteDataSourceProtocol.self) { _ in
            return RemoteDataSource()
        }
    }
}
