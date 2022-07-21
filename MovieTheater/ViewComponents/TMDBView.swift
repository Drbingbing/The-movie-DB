//
//  TMDBView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import SwiftUI
import Macaw

struct TMDBView: UIViewRepresentable {
    
    var fileName: String = "tmdb"
    
    func makeUIView(context: Context) -> some UIView {
        let view = SVGView()
        view.fileName = fileName
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
