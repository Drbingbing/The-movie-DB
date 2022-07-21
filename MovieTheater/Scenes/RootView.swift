//
//  RootView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NavigationView {
                MoviesRootView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            TMDBView(fileName: "tmdb_short")
                                .frame(width: 24, height: 24)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                    }
            }
            .tabItem {
                Image(systemName: "film")
                Text("電影")
            }
            
            NavigationView {
                TvShowsRootView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            TMDBView(fileName: "tmdb_short")
                                .frame(width: 24, height: 24)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                    }
            }
            .tabItem {
                Image(systemName: "4k.tv")
                Text("電視節目")
            }
            
            NavigationView {
                PeopleRootView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            TMDBView(fileName: "tmdb_short")
                                .frame(width: 24, height: 24)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                    }
            }
            .tabItem {
                Image(systemName: "person.crop.rectangle")
                Text("人物")
            }
            
            NavigationView {
                
            }
            .tabItem {
                Image(systemName: "ellipsis")
                Text("更多")
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
