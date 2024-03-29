//
//  OnAirTVsModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Foundation

final class TvShowModel: Hashable, Equatable {
    
    static func == (lhs: TvShowModel, rhs: TvShowModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: UUID
    let name: String
    let posterURL: URL?
    let backdropURL: URL?
    let voteAverage: Double
    
    init(tv: TvShow) {
        self.id = UUID()
        self.name = tv.name
        self.posterURL = tv.posterURL
        self.backdropURL = tv.backdropURL
        self.voteAverage = Double(tv.voteAverage)
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
