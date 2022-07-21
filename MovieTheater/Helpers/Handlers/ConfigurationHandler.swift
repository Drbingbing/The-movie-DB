//
//  ConfigurationHandler.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

final class ConfigurationHandler: ConfigurationHandlerProtocol {
    
    private var imageConfiguration: ImageConfigurationHandler?
    
    var regularImageBaseURLString: String {
        return imageConfiguration?.regularImageBaseURLString ?? ImageConfigurationHandler.Constants.defaultRegularImageBaseURLString
    }
    
    var backdropImageBaseURLString: String {
        return imageConfiguration?.backdropImageBaseURLString ?? ImageConfigurationHandler.Constants.defaultBackdropImageBaseURLString
    }
    
    func setConfiguration(_ configuraion: Configuration?) {
        imageConfiguration = ImageConfigurationHandler(configuration: configuraion)
    }
}
