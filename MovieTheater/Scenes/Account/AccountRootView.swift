//
//  AccountRootView.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import SwiftUI

struct AccountRootView: View {
    
    @StateObject var accountViewModel = AccountViewModel()
    
    var body: some View {
        ScrollView {
            avator
            recordSection
            
            Divider()
                .padding(.horizontal, 12)
            
            functionalSection
            
            Divider()
                .padding(.horizontal, 12)
            
            profileSection
            
            Divider()
                .padding(.horizontal, 12)
            
            Button(action: {}) {
                HStack(spacing: 12) {
                    Image(systemName: "hand.point.up.left")
                    Text("登出")
                    Spacer()
                }
                .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
        }
        .navigationTitle(Text("個人資訊"))
    }
    
    var avator: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 32, height: 32)
                    .overlay {
                        Text("B")
                            .foregroundColor(.white)
                    }
                Text("BingBing5487")
                    .font(.title2.bold())
                Spacer()
            }
            .alignmentGuide(.leading) { d in
                44
            }
            
            Text("會員加入於2022六月")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
    }
    
    var recordSection: some View {
        HStack {
            HStack {
                CircularProgressView(value: 0, base: 100)
                    .frame(width: 40, height: 40)
                Text("電影\n平均分數")
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            
            RoundedRectangle(cornerRadius: 1)
                .fill(.gray)
                .frame(width: 2, height: 36)
            
            HStack {
                CircularProgressView(value: 0, base: 100)
                    .frame(width: 40, height: 40)
                Text("節目\n平均分數")
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 12)
    }
    
    var functionalSection: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            Button(action: {}) {
                HStack(spacing: 12) {
                    Image(systemName: "quote.bubble")
                    Text("討論")
                    Spacer()
                }
                .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.vertical, 8)
            
            Button(action: {}) {
                HStack(spacing: 12) {
                    Image(systemName: "text.alignleft")
                    Text("清單")
                    Spacer()
                }
                .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.vertical, 8)
            
            Button(action: {}) {
                HStack(spacing: 12) {
                    Image(systemName: "hand.thumbsup")
                    Text("評分")
                    Spacer()
                }
                .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.vertical, 8)
            
            Button(action: {}) {
                HStack(spacing: 12) {
                    Image(systemName: "tag")
                    Text("待看清單")
                    Spacer()
                }
                .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.vertical, 8)
            
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }
    
    var profileSection: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            Button(action: {}) {
                HStack(spacing: 12) {
                    Image(systemName: "gearshape")
                    Text("編輯個人檔案")
                    Spacer()
                }
                .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.vertical, 8)
            
            Button(action: {}) {
                HStack(spacing: 12) {
                    Image(systemName: "wrench")
                    Text("帳戶設定")
                    Spacer()
                }
                .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.vertical, 8)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }
}

struct AccountRootView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
//            AccountRootView()
//                .navigationBarTitleDisplayMode(.inline)
//        }
        AccountRootView()
    }
}
