//
//  TVsView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import SwiftUI

struct TvShowsRootView: View {
    
    @StateObject var tvshowsViewModel = TvShowsViewModel()
    
    var body: some View {
        ZStack {
            
            switch tvshowsViewModel.tvState {
            case .initial:
                ProgressView()
                    .onAppear(perform: tvshowsViewModel.reset)
            case .paging(let tvs, _):
                TvShowsView(tvs: tvs) {
                    tvshowsViewModel.fetchNext()
                }
            case .populated(let tvs):
                TvShowsView(tvs: tvs)
            case .error(let error):
                ErrorPlaceholder(description: error.localizedDescription) {
                    tvshowsViewModel.reset()
                }
            default:
                ErrorPlaceholder(description: "Unable to load state, try again later") {
                    tvshowsViewModel.reset()
                }
            }
            
        }
        .navigationTitle(Text(tvshowsViewModel.navigationTitle))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                menu
            }
        }
    }
    
    var menu: some View {
        let menu = tvshowsViewModel.categories()
        
        return Menu {
            
            ForEach(0..<menu.count, id: \.self) { index in
                let category = menu[index]
                
                Button(action: {
                    tvshowsViewModel.didSelectCategory(category)
                }) {
                    HStack {
                        Text(category.localized)
                        if tvshowsViewModel.category == category {
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

struct TVsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TvShowsRootView()
        }
    }
}
