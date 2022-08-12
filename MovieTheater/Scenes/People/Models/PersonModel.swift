//
//  PopularPeopleModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Foundation

final class PersonModel: Hashable {
    
    static func == (lhs: PersonModel, rhs: PersonModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let profilePath: URL?
    let popularity: Float
    
    let birthday: String?
    let birthPlace: String?
    let knownFor: String?
    let knownAs: [String]
    let gender: Int?
    let biography: String?
    
    init(person: Person) {
        self.id = person.id
        self.name = person.name
        self.profilePath = person.posterURL
        self.popularity = person.popularity
        self.birthday = person.birthday
        self.birthPlace = person.birthPlace
        self.knownAs = person.knownAs ?? []
        self.knownFor = person.knownFor
        self.gender = person.gender
        self.biography = person.biography
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
