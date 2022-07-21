//
//  ImageConfigurationHandler.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

struct ImageConfigurationHandler {
    
    private let configuration: Configuration?
    
    init(configuration: Configuration?) {
        self.configuration = configuration
    }
    
    private var baseURLString: String {
        return configuration?.imageConfiguration.baseURLString ?? Constants.defaultBaseURLString
    }

    var regularImageBaseURLString: String {
        let posterSize = configuration?.imageConfiguration.posterSizes.mid ?? Constants.defaultRegularSize
        return baseURLString + posterSize
    }

    var backdropImageBaseURLString: String {
        let backdropSize = configuration?.imageConfiguration.backdropSizes.mid ?? Constants.defaultBackdropSize
        return baseURLString + backdropSize
    }
}

extension ImageConfigurationHandler {

    struct Constants {

        static let defaultRegularSize = "w185"
        static let defaultBackdropSize = "w500"

        static let defaultRegularImageBaseURLString: String = "https://image.tmdb.org/t/p/w185"
        static let defaultBackdropImageBaseURLString: String = "https://image.tmdb.org/t/p/w500"
        
        static let defaultBaseURLString = "https://image.tmdb.org/t/p/"
    }

}
