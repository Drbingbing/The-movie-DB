//
//  MoviesView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import SwiftUI

struct MoviesRootView: View {
    
    @StateObject var moviesViewModel = MoviesViewModel()
    
    var body: some View {
        ZStack {
            
            switch moviesViewModel.movieState {
            case .initial:
                ProgressView()
                    .onAppear(perform: moviesViewModel.reset)
            case .paging(let movies, _):
                MoviesView(movies: movies) {
                    self.moviesViewModel.fetchNext()
                }
            case .populated(let movies):
                MoviesView(movies: movies)
            case .error(let error):
                ErrorPlaceholder(description: error.localizedDescription) {
                    moviesViewModel.reset()
                }
            default:
                ErrorPlaceholder(description: "Unable to load state, try again later") {
                    moviesViewModel.reset()
                }
            }
            
        }
        .navigationTitle(Text(moviesViewModel.navigationTitle))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                menu
            }
        }
        .navigationBarBackground {
            Color.white
        }
    }
    
    var menu: some View {
        let menu = moviesViewModel.categories()
        return Menu {
            ForEach(0..<menu.count, id: \.self) { index in
                let current = menu[index]
                Button(action: {
                    moviesViewModel.didTapMenu(for: current)
                }) {
                    HStack {
                        Text(current.title)
                        if moviesViewModel.category == current {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .frame(width: 10, height: 8)
                .foregroundColor(.black)
        }

    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoviesRootView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
