//
//  ViewState.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Foundation

enum ViewState<Entity>: Equatable where Entity: Equatable {
    
    
    case initial
    case paging([Entity], next: Int)
    case populated([Entity])
    case empty
    case error(Error)
    
    static func == (lhs: ViewState<Entity>, rhs: ViewState<Entity>) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (let .paging(lhsEntities, _), let .paging(rhsEntities, _)):
            return lhsEntities == rhsEntities
        case (let .populated(lhsEntities), let .populated(rhsEntities)):
            return lhsEntities == rhsEntities
        case (.empty, .empty):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
    
    var currentEntities: [Entity] {
        switch self {
        case .empty, .initial, .error:
            return []
        case .populated(let entities):
            return entities
        case .paging(let entities, _):
            return entities
        }
    }
    
    var currentPage: Int {
        switch self {
        case .initial, .empty, .populated, .error:
            return 1
        case .paging(_, let next):
            return next
        }
    }
    
}


extension ObservableObject {
    
    func processResult<T: Equatable>(_ entities: [T], currentPage: Int, currentEntities: [T]) -> ViewState<T> {
        var allEntities = currentPage == 1 ? [] : currentEntities
        allEntities.append(contentsOf: entities)
        
        guard !allEntities.isEmpty else { return .empty }
        
        return entities.isEmpty ? .populated(allEntities) : .paging(allEntities, next: currentPage + 1)
    }
    
}
