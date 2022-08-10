//
//  NavigationLazyView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/10.
//

import SwiftUI

struct NavigationLazyView<Content>: View where Content: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
