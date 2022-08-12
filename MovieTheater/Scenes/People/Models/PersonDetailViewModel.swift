//
//  PersonDetailViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/10.
//

import Foundation
import Combine
import CombineExt

final class PersonDetailViewModel: ObservableObject {
    
    private let peopleRepository: PeopleRepositoryProtocol
    
    private var cancellable: [AnyCancellable] = []
    
    @Published var person: PersonModel
    
    @Published var movieCredits: [MovieModel] = []
    
    @Published var externalID: ExternalID?
    
    @Published var isSocialMediaAvailable: Bool = false
    
    @Published var socialLink: String?
    
    init(person: PersonModel) {
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.peopleRepository = remoteDataSource.peopleRepository()
        self.person = person
        self.fetch()
    }

    func fetch() {
        peopleRepository.getPersonDetail(person.id)
            .ignoreFailure()
            .sink { [weak self] person in
                self?.person = PersonModel(person: person)
            }
            .store(in: &cancellable)
        
        peopleRepository.getMovieCredit(person.id)
            .ignoreFailure()
            .sink { [weak self] movie in
                self?.movieCredits = movie.map(MovieModel.init)
            }
            .store(in: &cancellable)
        
        let externalStream = peopleRepository.getExternalIDs(person.id)
            .ignoreFailure()
            .share()
            
        externalStream
            .sink { [weak self] externalID in
                self?.externalID = externalID
            }
            .store(in: &cancellable)
        
        externalStream
            .sink { [weak self] externalID in
                var isAvailable: Bool = false
                
                if externalID.facebookID?.isEmpty == false {
                    isAvailable = true
                }
                else if externalID.instagramID?.isEmpty == false {
                    isAvailable = true
                }
                else if externalID.twitterID?.isEmpty == false {
                    isAvailable = true
                }
                
                self?.isSocialMediaAvailable = isAvailable
            }
            .store(in: &cancellable)
    }
    
    func showInstagram() {
        self.socialLink = externalID?.instagramID
    }
    
    func showFacebook() {
        self.socialLink = externalID?.facebookID
    }
    
    func showTwitter() {
        self.socialLink = externalID?.twitterID
    }
}
