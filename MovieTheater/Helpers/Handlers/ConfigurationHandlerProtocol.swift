//
//  ConfigurationHandlerProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

protocol ConfigurationHandlerProtocol {
    
    var regularImageBaseURLString: String { get }
    var backdropImageBaseURLString: String { get }
    
    func setConfiguration(_ configuraion: Configuration?)
}
