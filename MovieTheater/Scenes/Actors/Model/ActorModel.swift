//
//  ActorModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import Foundation

final class ActorModel: Identifiable {
    let id = UUID()
    
    let name: String
    let character: String
    let profilePath: URL?
    
    init(person: Actor) {
        self.name = person.name
        self.character = person.character
        self.profilePath = person.posterURL
    }
}
