//
//  ActorsListView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/25.
//

import SwiftUI
import Kingfisher

struct ActorsListView: View {
    
    var actors: [ActorModel]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(actors) { person in
                    
                    HStack(spacing: 20) {
                        KFImage(person.profilePath)
                            .resizable()
                            .placeholder { _ in
                                ProgressView()
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        VStack(alignment: .leading) {
                            Text(person.name)
                                .bold()
                                .font(.title2)
                            Text(person.character)
                        }
                    }
                    .padding(.horizontal, 12)
                }
            }
        }
        .navigationTitle(Text("主要演員"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackground {
            Color.white
        }
    }
}

struct ActorsListView_Previews: PreviewProvider {
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
        ActorsListView(actors: actors.map(ActorModel.init))
    }
}
