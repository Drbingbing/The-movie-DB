//
//  HandlerAssembly.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation
import Swinject

final class HandlerAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ConfigurationHandlerProtocol.self) { _ in
            return ConfigurationHandler()
        }
        .inObjectScope(.container)
        
        container.register(LanguageCodesHandlerProtocol.self) { _ in
            return LanguageCodesHandler()
        }
        .inObjectScope(.container)
    }
}
