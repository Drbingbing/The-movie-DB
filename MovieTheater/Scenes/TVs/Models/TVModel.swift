//
//  OnAirTVsModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Foundation

final class TVModel: Hashable, Equatable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: TVModel, rhs: TVModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let posterURL: URL?
    
    init(tv: TV) {
        self.name = tv.name
        self.id = tv.id
        self.posterURL = tv.posterURL
    }
}
