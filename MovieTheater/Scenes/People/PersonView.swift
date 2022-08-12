//
//  PersonView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import SwiftUI

struct PersonView: View {
    
    var person: PersonModel
    
    var body: some View {
        RoundedImageView(url: person.profilePath)
    }
}

struct PersonView_Previews: PreviewProvider {
    
    static var person: Person {
        Person(
            id: 28782,
            adult: false,
            profilePath: "",
            name: "Monica Bellucci",
            popularity: 48.609344,
            birthday: "1963-12-18",
            birthPlace: "Shawnee, Oklahoma, USA",
            knownFor: "Acting",
            knownAs: ["畢.彼特"],
            gender: 2,
            biography: "William Bradley \"Brad\" Pitt (born December)"
        )
    }
    
    static var previews: some View {
        PersonView(person: PersonModel(person: person))
    }
}
