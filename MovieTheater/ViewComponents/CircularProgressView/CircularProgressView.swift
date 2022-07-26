//
//  CircularProgressView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/21.
//

import SwiftUI

struct CircularProgressView: View {
    
    init(value: Double, base: Double = 10) {
        self.percent = value / base
        self.value = value
    }
    
    var percent: Double
    var value: Double
    
    var body: some View {
        
        GeometryReader { proxy in
            
            let width = proxy.size.width
            let height = proxy.size.height
            let radius = min(width, height)
            
            ZStack {
                Circle()
                    .stroke(.gray, lineWidth: 5)
                    .frame(width: radius, height: radius)
                
                Circle()
                    .trim(from: 0, to: percent)
                    .stroke(
                        .black,
                        style: StrokeStyle(
                            lineWidth: 5,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                
                Text(String(format: "%.1f", value))
                    .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
            }
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(value: 6.5)
            .frame(width: 40, height: 40)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
