//
//  SplashView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/4.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var splashViewModel = SplashViewModel()
    
    var body: some View {
        Group {
            switch splashViewModel.state {
            case .end:
                RootView()
            default:
                TMDBView()
            }
        }
        .onAppear(perform: splashViewModel.initialDownload)
    }
}

struct SplashViewPreview_Provider: PreviewProvider {
    
    static var previews: some View {
        SplashView()
    }
}

