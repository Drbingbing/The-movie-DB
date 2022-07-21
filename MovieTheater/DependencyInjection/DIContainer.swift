//
//  DIContainer.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/4.
//

import Swinject

final class DIContainer {
    
    static let shared = DIContainer()
    
    private let _container: Container = Container()
    private let assembler: Assembler
    
    init() {
        let assemblers: [Assembly] = [
            DataSourceAssembly(),
            HandlerAssembly(),
        ]
        
        assembler = Assembler(assemblers, container: _container)
    }
    
    func resolve<T>() -> T {
        guard let resolvedType = _container.resolve(T.self) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T>(registrationName: String?) -> T {
        guard let resolvedType = _container.resolve(T.self, name: registrationName) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg>(argument: Arg) -> T {
        guard let resolvedType = _container.resolve(T.self, argument: argument) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg1, Arg2>(arguments arg1: Arg1, _ arg2: Arg2) -> T {
        guard let resolvedType = _container.resolve(T.self, arguments: arg1, arg2) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg>(name: String?, argument: Arg) -> T {
        guard let resolvedType = _container.resolve(T.self, name: name, argument: argument) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg1, Arg2>(name: String?, arguments arg1: Arg1, _ arg2: Arg2) -> T {
        guard let resolvedType = _container.resolve(T.self, name: name, arguments: arg1, arg2) else {
            fatalError()
        }
        return resolvedType
    }
}
