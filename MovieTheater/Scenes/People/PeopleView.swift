//
//  PopualerPeopleView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import SwiftUI

struct PeopleView: View {
    
    var people: [PersonModel]
    
    var prefetch: (() -> Void)?
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 80, maximum: 130), spacing: 12)
                ],
                spacing: 12
            ) {
                ForEach(people, id: \.self) { person in
                    Button(action: {}) {
                        PersonView(person: person)
                    }
                    .buttonStyle(ScaleButtonStyle())
                    .onAppear {
                        self.prefetch(at: person)
                    }
                    .frame(height: 150)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func prefetch(at person: PersonModel) {
        guard let index = people.firstIndex(of: person) else { return }
        
        let total = people.count
        let offset = 3
        
        let threshold = max((total - offset), 0) - index
        
        if threshold == 0 {
            prefetch?()
        }
    }
}

struct PopualerPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(people: [])
    }
}
