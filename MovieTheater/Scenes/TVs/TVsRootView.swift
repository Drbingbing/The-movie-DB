//
//  TVsView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import SwiftUI

struct TVsRootView: View {
    
    @StateObject var tvsViewModel = TVsViewModel()
    
    var body: some View {
        ZStack {
            
            switch tvsViewModel.tvState {
            case .initial:
                ProgressView()
            case .paging(let tvs, _):
                TvsView(tvs: tvs) {
                    tvsViewModel.fetchNext()
                }
            case .populated(let tvs):
                TvsView(tvs: tvs)
            case .error(let error):
                ErrorPlaceholder(description: error.localizedDescription) {
                    tvsViewModel.reset()
                }
            default:
                ErrorPlaceholder(description: "Unable to load state, try again later") {
                    tvsViewModel.reset()
                }
            }
            
        }
    }
}

struct TVsView_Previews: PreviewProvider {
    static var previews: some View {
        TVsRootView()
    }
}
