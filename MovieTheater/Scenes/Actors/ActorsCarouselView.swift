//
//  ActorsCarouselView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import SwiftUI

struct ActorsCarouselView<Destination>: View where Destination: View {
    
    @Binding var actors: [ActorModel]
    
    var destination: (ActorModel) -> Destination
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(actors.prefix(10)) { person in
                        NavigationLink(destination: {
                            destination(person)
                        }, label: {
                            ActorView(person: person)
                        })
                        .buttonStyle(ScaleButtonStyle())
                    }
                    
                    NavigationLink(destination: ActorsListView(actors: actors)) {
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
        ActorsCarouselView(
            actors: .constant(actors.map(ActorModel.init)),
            destination: { _ in Text("ddd") }
        ).frame(height: 250)
    }
}
