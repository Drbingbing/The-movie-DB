//
//  Triangle.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/21.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: (rect.maxY - rect.minY) * 0.66))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: (rect.maxY - rect.minY) * 0.66))
        
        return path
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle()
            .stroke()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
    }
}
