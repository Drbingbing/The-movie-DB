//
//  AuthPermissionView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/27.
//

import SwiftUI

struct AuthPermissionView: View {
    
    var authPermissionURL: URL?
    
    @Binding var authorized: Bool
    
    var body: some View {
        WebView(url: authPermissionURL)
            .onDisappear {
                authorized = true
            }
    }
}

struct AuthPermissionView_Previews: PreviewProvider {
    static var url: URL? {
        URL(string: "https://google.com")
    }
    
    static var previews: some View {
        AuthPermissionView(authPermissionURL: url, authorized: .constant(false))
    }
}
