//
//  PeopleView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import SwiftUI

struct PeopleRootView: View {
    
    @StateObject var peopleViewModel = PeopleViewModel()
    
    var body: some View {
        ZStack {
            
            switch peopleViewModel.peopleState {
            case .initial:
                ProgressView()
                    .onAppear {
                        peopleViewModel.fetch(page: 1)
                    }
            case .paging(let people, _):
                PeopleView(people: people) {
                    peopleViewModel.fetchNext()
                }
            case .populated(let people):
                PeopleView(people: people)
            case .error(let error):
                ErrorPlaceholder(description: error.localizedDescription) {
                    peopleViewModel.reset()
                }
            default:
                ErrorPlaceholder(description: "Unable to load state, try again later") {
                    peopleViewModel.reset()
                }
            }
            
        }
        .navigationTitle(Text(LocalizedStrings.popularPeopleTitle()))
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PeopleRootView()
        }
    }
}
