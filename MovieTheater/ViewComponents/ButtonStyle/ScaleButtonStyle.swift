//
//  ScaleButtonStyle.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.8 : 1)
            .animation(.linear(duration: 0.2), value: configuration.isPressed)
    }
}
