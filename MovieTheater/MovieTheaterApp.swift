//
//  MovieTheaterApp.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/4.
//

import SwiftUI

@main
struct MovieTheaterApp: App {
    
    init() {
        self.boostrap()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
    
    private func boostrap() {
        _ = DIContainer.shared
        let baseConfiguration: BaseConfiguration = PropertyListHelper.decode()
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        remoteDataSource.configure(apiKey: baseConfiguration.keys.apiKey, readAccessToken: baseConfiguration.keys.readAccessToken)
    }
}
