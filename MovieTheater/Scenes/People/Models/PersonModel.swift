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
    
    init(person: Person) {
        self.id = person.id
        self.name = person.name
        self.profilePath = person.posterURL
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
