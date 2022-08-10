//
//  TransientAlert.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/27.
//

import SwiftUI

struct TransientAlert<Item>: View where Item: CustomStringConvertible {
    
    @Binding var presenting: Item?
    @State private var visible: Bool = false
    
    var body: some View {
        Rectangle()
            .fill(.clear)
            .overlay(alignment: .bottom) {
                Group {
                    if let presenting = presenting {
                        Text(presenting.description)
                            .id(presenting.description)
                            .padding([.horizontal, .vertical], 12)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                            }
                            .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
                            .padding([.horizontal, .vertical], 12)
                            .frame(maxWidth: .infinity)
                            .transition(
                                AnyTransition.move(edge: .bottom).combined(with: .opacity)
                            )
                            .offset(y: self.presenting == nil ? 150 : 0)
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                                    self.presenting = nil
                                }
                            }
                    }
                }
                .animation(.spring(), value: self.presenting != nil)
            }
    }
}

extension View {
    
    func transientAlert<T>(_ presented: Binding<T?>) -> some View where T: (CustomStringConvertible & Equatable) {
        
        self.overlay {
            TransientAlert(presenting: presented)
        }
    }
}

struct TransientAlert_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
    
    struct Wrapper: View {
        @State var mock: String?
        
        var body: some View {
            VStack {
                Button(action: {
                    mock = "fdsfdsfdsfsdfdsfdsfdsfdsf"
                }) {
                    Text("fdffdsfdfsdsfd")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                TransientAlert(presenting: $mock)
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    mock = "12321313321313123213213"
                }
            }
        }
    }
}
