//
//  TransientAlertModifier.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/12.
//

import SwiftUI

struct TransientAlertModifier<Item>: ViewModifier where Item: Hashable {
    
    @Binding var isPresenting: Item?
    var banner: (Item) -> TransientAlert
    
    @State var offsetY: CGFloat = 150
    @State var workItem: DispatchWorkItem?
    var duration: Double = 3
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                ZStack(alignment: .bottom) {
                    if let isPresenting = isPresenting {
                        banner(isPresenting).offset(y: offsetY)
                            .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    }
                }
                .onChange(of: isPresenting) { newValue in
                    if newValue != nil {
                        onAppearAction()
                    }
                }
            }
    }
    
    private func onAppearAction() {
        
        self.workItem?.cancel()
        withAnimation(.spring()) {
            self.offsetY = 0
        }
        
        let task = DispatchWorkItem {
            withAnimation(.spring()) {
                isPresenting = nil
                workItem = nil
                offsetY = 150
            }
        }
        workItem = task
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: task)
    }
}

extension View {
    
    func snackBar<T>(isPresenting: Binding<T?>, banner: @escaping (T) -> TransientAlert) -> some View where T: Hashable {
        modifier(
            TransientAlertModifier(isPresenting: isPresenting, banner: banner)
        )
    }
}
