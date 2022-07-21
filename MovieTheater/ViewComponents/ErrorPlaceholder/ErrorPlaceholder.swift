//
//  ErrorPlaceholder.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import SwiftUI

struct ErrorPlaceholder: View {
    
    var description: String
    var rerty: () -> Void
    
    var body: some View {
        VStack {
            Text(description)
            Button(action: rerty) {
                Image(systemName: "arrow.uturn.forward.circle")
            }
        }
    }
}

struct ErrorPlaceholder_Previews: PreviewProvider {
    
    static var previews: some View {
        ErrorPlaceholder(description: "hello, world", rerty: {})
    }
}
