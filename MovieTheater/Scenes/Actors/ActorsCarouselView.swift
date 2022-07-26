//
//  ActorsCarouselView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import SwiftUI

struct ActorsCarouselView: View {
    
    @Binding var actors: [ActorModel]
    
    var onMore: () -> Void
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(actors.prefix(10)) { person in
                        ActorView(person: person)
                    }
                    
                    Button(action: onMore) {
                        HStack {
                            Text("檢視更多")
                                .bold()
                            Image(systemName: "chevron.forward")
                                .font(.body.bold())
                        }
                    }
                    .tint(.black)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
            }
            .frame(height: proxy.size.height)
        }
    }
}

struct ActorsCarouselView_Previews: PreviewProvider {
    
    static var actors: [Actor] {
        [
            Actor(id: 819,
               name: "Edward Norton",
               character: "The Narrator",
               profilePath: "/83o3koL82jt30EJ0rz4Bnzrt2dd.jpg"),
            Actor(id: 819,
                  name: "Edward Norton",
                  character: "The Narrator",
                  profilePath: "/83o3koL82jt30EJ0rz4Bnzrt2dd.jpg"),
            Actor(id: 819,
                  name: "Edward Norton",
                  character: "The Narrator",
                  profilePath: "/83o3koL82jt30EJ0rz4Bnzrt2dd.jpg"),
            Actor(id: 819,
                  name: "Edward Norton",
                  character: "The Narrator",
                  profilePath: "/83o3koL82jt30EJ0rz4Bnzrt2dd.jpg"),
            Actor(id: 819,
                  name: "Edward Norton",
                  character: "The Narrator",
                  profilePath: "/83o3koL82jt30EJ0rz4Bnzrt2dd.jpg"),
            Actor(id: 819,
                  name: "Edward Norton",
                  character: "The Narrator",
                  profilePath: "/83o3koL82jt30EJ0rz4Bnzrt2dd.jpg"),
            Actor(id: 819,
                  name: "Edward Norton",
                  character: "The Narrator",
                  profilePath: "/83o3koL82jt30EJ0rz4Bnzrt2dd.jpg")
        ]
    }
    
    static var previews: some View {
        ActorsCarouselView(actors: .constant(actors.map(ActorModel.init)), onMore: {})
            .frame(height: 250)
    }
}
