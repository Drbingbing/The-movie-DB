//
//  TransientAlert.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/27.
//

import SwiftUI

struct TransientAlert: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .id(text)
            .padding([.horizontal, .vertical], 12)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
            }
            .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
            .padding([.horizontal, .vertical], 12)
    }
}


struct TransientAlert_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
    
    struct Wrapper: View {
        
        @State var mock: String?
        
        var body: some View {
            Rectangle()
                .fill(.cyan)
                .onTapGesture {
                    mock = "sdsdsadadsadsadsadsadsadsadsa+ \(Int.random(in: 0...100))"
                }
                .snackBar(isPresenting: $mock) { mock in
                    TransientAlert(text: mock)
                }
        }
    }
}
