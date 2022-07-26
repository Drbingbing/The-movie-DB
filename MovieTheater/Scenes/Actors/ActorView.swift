//
//  ActorView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import SwiftUI
import Kingfisher

struct ActorView: View {
    
    var person: ActorModel
    
    var body: some View {
        Group {
            
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    KFImage(person.profilePath)
                        .resizable()
                        .placeholder{ _ in
                            ProgressView()
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.75)
                        .clipped()
                    
                    VStack {
                        Text(person.name)
                            .bold()
                            .font(.system(size: 14))
                        Text(person.character)
                            .font(.system(size: 12))
                    }
                    .padding(.bottom, 12)
                    .padding(.horizontal, 4)
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.25)
                }
            }
            
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
        .frame(width: 120, height: 200)
    }
}

struct ActorView_Previews: PreviewProvider {
    
    static var actor: Actor {
        Actor(id: 819,
              name: "Edward Norton",
              character: "The Narrator",
              profilePath: "/83o3koL82jt30EJ0rz4Bnzrt2dd.jpg")
    }
    
    static var previews: some View {
        ActorView(person: ActorModel(person: actor))
//            .previewLayout(.sizeThatFits)
    }
}

