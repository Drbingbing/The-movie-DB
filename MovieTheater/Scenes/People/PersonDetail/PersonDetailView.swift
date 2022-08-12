//
//  PersonDetailView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/10.
//

import SwiftUI
import Kingfisher

struct PersonDetailView: View {
    
    @ObservedObject var personModel: PersonDetailViewModel
    
    var body: some View {
        ScrollView {
            let person = personModel.person
            
            Group {
                Text(person.name)
                    .bold()
                    .font(.title2)
                
                if let birthPlace = person.birthPlace {
                    Text(birthPlace)
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                
                KFImage(person.profilePath)
                    .resizable()
                    .placeholder { ProgressView() }
                    .frame(width: 100, height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 1)
            }
            
            if personModel.isSocialMediaAvailable {
                socialMedias
            }
            
            aboutMe
            
            famousCredit
            
            Rectangle().fill(.clear)
                .frame(height: 20)
        }
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTransparentBar(tintColor: nil)
        .snackBar(isPresenting: $personModel.socialLink) { link in
            TransientAlert(text: link)
        }
    }
    
    var aboutMe: some View {
        LazyVStack {
            let person = personModel.person
            Group {
                HStack {
                    Text("•••").foregroundColor(.orange)
                    Text("個人簡介").foregroundColor(Color(red: 66/255, green: 66/255, blue: 66/255))
                    Text("•••").foregroundColor(.blue)
                }
                .padding(.vertical, 12)
                
                if let biography = person.biography {
                    Text(biography)
                        .multilineTextAlignment(.center)
                }
            }
            
            Group {
                HStack {
                    Text("•••").foregroundColor(.orange)
                    Text("聞名於").foregroundColor(Color(red: 66/255, green: 66/255, blue: 66/255))
                    Text("•••").foregroundColor(.blue)
                }
                .padding(.vertical, 12)
                
                if let knownFor = person.knownFor {
                    Text(knownFor)
                    
                }
            }
            
            Group {
                HStack {
                    Text("•••").foregroundColor(.orange)
                    Text("性別").foregroundColor(Color(red: 66/255, green: 66/255, blue: 66/255))
                    Text("•••").foregroundColor(.blue)
                }
                .padding(.vertical, 12)
                
                if let gender = person.gender {
                    Text(gender == 1 ? "女性" : "男性")
                }
            }
            
            Group {
                HStack {
                    Text("•••").foregroundColor(.orange)
                    Text("別名").foregroundColor(Color(red: 66/255, green: 66/255, blue: 66/255))
                    Text("•••").foregroundColor(.blue)
                }
                .padding(.vertical, 12)
                
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 150), spacing: 0)
                ], spacing: 8) {
                    ForEach(person.knownAs, id: \.self) { knownAs in
                        Text(knownAs)
                    }
                }
            }
            
            Group {
                HStack {
                    Text("•••").foregroundColor(.orange)
                    Text("生日").foregroundColor(Color(red: 66/255, green: 66/255, blue: 66/255))
                    Text("•••").foregroundColor(.blue)
                }
                .padding(.vertical, 12)
                
                if let birthday = person.birthday {
                    Text(birthday)
                }
            }
        }
    }
    
    var famousCredit: some View {
        VStack {
            HStack {
                Text("•••").foregroundColor(.orange)
                Text("知名作品").foregroundColor(Color(red: 66/255, green: 66/255, blue: 66/255))
                Text("•••").foregroundColor(.blue)
            }
            .padding(.vertical, 12)
            
            MovieCarouselView(movies: personModel.movieCredits, destination: showMovie)
                .frame(height: 250)
        }
    }
    
    var socialMedias: some View {
        
        VStack {
            HStack {
                Text("•••").foregroundColor(.orange)
                Text("媒體").foregroundColor(Color(red: 66/255, green: 66/255, blue: 66/255))
                Text("•••").foregroundColor(.blue)
            }
            .padding(.vertical, 12)
            
            if let externalID = personModel.externalID {
                HStack(spacing: 20) {
                    if externalID.facebookID?.isEmpty == false {
                        Button(action: personModel.showFacebook) {
                            Image("facebook-icon-black")
                                .resizable()
                                .padding(.all, 4)
                                .frame(width: 32, height: 32)
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }

                    if externalID.instagramID?.isEmpty == false {
                        Button(action: personModel.showInstagram) {
                            Image("instagram-icon")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }

                    if externalID.twitterID?.isEmpty == false {
                        Button(action: personModel.showTwitter) {
                            Image("twitter_bird_icon")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }
                }
            }
        }
        
    }
    
    private func showMovie(_ movie: MovieModel) -> some View {
        NavigationLazyView(
            MovieDetailView(movieModel: MovieDetailViewModel(movie: movie))
        )
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    
    static var person: PersonModel {
        PersonModel(person: Person(
            id: 28782,
            adult: false,
            profilePath: "/kU3B75TyRiCgE270EyZnHjfivoq.jpg",
            name: "Monica Bellucci",
            popularity: 48.609344,
            birthday: "1963-12-18",
            birthPlace: "Shawnee, Oklahoma, USA",
            knownFor: "演出",
            knownAs: ["畢.彼特", "ブラッド・ピット"],
            gender: 2,
            biography: "William Bradley \"Brad\" Pitt (born December)"
        )
        )
    }
    
    static var previews: some View {
        PersonDetailView(personModel: PersonDetailViewModel(person: person))
    }
}
