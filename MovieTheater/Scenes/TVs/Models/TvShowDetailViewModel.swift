//
//  TvShowDetailViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/9/1.
//

import Foundation
import Combine

final class TvShowDetailViewModel: ObservableObject {
    
    @Published var tvShow: TvShowModel
    
    private let tvsRepository: TVsRepositoryProtocol
    private var cancellables: [AnyCancellable] = []
    
    init(tvshow: TvShowModel) {
        self.tvShow = tvshow
        
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        self.tvsRepository = remoteDataSource.tvsRepository()
    }
}
