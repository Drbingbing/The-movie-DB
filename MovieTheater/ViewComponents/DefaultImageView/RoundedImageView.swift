//
//  RoundedImageView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import SwiftUI
import Kingfisher

struct RoundedImageView: View {
    
    var url: URL?
    
    var body: some View {
        KFImage(url)
            .resizable()
            .placeholder{ _ in
                ProgressView()
            }
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
    }
}
