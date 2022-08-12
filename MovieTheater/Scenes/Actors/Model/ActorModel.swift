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
    let actorId: Int
    let profilePath: URL?
    
    init(person: Actor) {
        self.actorId = person.id
        self.name = person.name
        self.character = person.character
        self.profilePath = person.posterURL
    }
}

extension ActorModel: DomainConvertible {
    func asDomain() -> PersonModel {
        let person = Person(id: actorId,
                            adult: true,
                            profilePath: nil,
                            name: name,
                            popularity: 0,
                            birthday: nil,
                            birthPlace: nil,
                            knownFor: nil,
                            knownAs: nil,
                            gender: nil,
                            biography: nil)
        return PersonModel(person: person)
    }
}
