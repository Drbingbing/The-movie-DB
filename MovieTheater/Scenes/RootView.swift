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
                NavigationLazyView(
                    MoviesRootView()
                )
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
                Text(LocalizedStrings.movieTabBarTitle())
            }
            .navigationTransparentBar(tintColor: nil)
            
            NavigationView {
                NavigationLazyView(
                    TvShowsRootView()
                )
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        TMDBView(fileName: "tmdb_short")
                            .frame(width: 24, height: 24)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
            }
            .tabItem {
                Image(systemName: "tv")
                Text(LocalizedStrings.tvShowTabBarTitle())
            }
            .navigationTransparentBar(tintColor: nil)
            
            NavigationView {
                NavigationLazyView(
                    PeopleRootView()
                ).toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        TMDBView(fileName: "tmdb_short")
                            .frame(width: 24, height: 24)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
            }
            .tabItem {
                Image(systemName: "star")
                Text(LocalizedStrings.peopleTabBarTitle())
            }
            .navigationTransparentBar(tintColor: nil)
            
            NavigationView {
                AccountRootView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            TMDBView(fileName: "tmdb_short")
                                .frame(width: 24, height: 24)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                    }
            }
            .tabItem {
                Image(systemName: "person")
                Text(LocalizedStrings.accountTabBarTitle())
            }
            .navigationTransparentBar(tintColor: nil)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
