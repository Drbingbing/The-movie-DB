//
//  AccountClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/27.
//

import Foundation
import Combine

protocol AccountClientProtocol {
    
    func getAccountDetail(with sessionId: String) -> AnyPublisher<User, Error>
}
