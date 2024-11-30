//
//  SearchPage.swift
//  BiliBiliDome
//
//  Created by MacBook on 2024/11/17.
//

import SwiftUI
import Foundation

struct SearchPage: View {
    let Iconcolor = #colorLiteral(red: 0.9590343833, green: 0.4967672825, blue: 0.6626609564, alpha: 1);
    @Environment(\.dismiss) var dismiss
    @State var searchText: String = ""
    @State private var filteredVideos = videos  // 默认显示所有视频
    @FocusState private var isTextFieldFocused: Bool
    @State var ifSearching : Bool = false
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                    }
                    
                    
                    
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: .infinity, height: 30)
                        .foregroundStyle(.white)
                    
                        .overlay (
                            RoundedRectangle(cornerRadius: 30)
                            
                                .stroke(Color.black, lineWidth: 1)
                                .overlay(alignment: .leading, content: {
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundStyle(.gray)
                                        TextField("亮小亮小亮小亮", text: $searchText)
                                            .font(.callout)
                                            .foregroundColor(Color.gray)
                                            .focused($isTextFieldFocused) // 设置焦点
                                            .onAppear {
                                                isTextFieldFocused = true // 自动获取焦点
                                            }
                                        Spacer()
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundStyle(.gray)
                                            .padding() //增大按钮识别位置
                                            .offset(x:10)
                                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                                            .onTapGesture {
                                                searchText = ""
                                                isTextFieldFocused=false
                                            }
                                    }
                                    .padding(.horizontal, 9)
                                })
                        )
                    
                    
                    
                    Button {
                        print(searchText)
                        filterVideo()
                        isTextFieldFocused=false
                        ifSearching=true
                    } label: {
                        Text("搜索")
                            .foregroundStyle(Color(Iconcolor))
                    }
                    
                }
                .padding(.bottom,5)
                if !ifSearching{
                    HStack{
                        Text("bilibili热搜")
                            .font(.callout)
                        Spacer()
                    }
                    Spacer()
                }else{
                    HStack{
                        Text("综合")
                            .font(.callout)
                            .fontWeight(.light)
                            .padding(.trailing,20)
                            .foregroundStyle(.pink)
                        Text("番剧")
                            .font(.callout)
                            .fontWeight(.light)
                            .padding(.trailing,20)
                        Text("直播")
                            .font(.callout)
                            .fontWeight(.light)
                            .padding(.trailing,20)
                        Text("用户")
                            .font(.callout)
                            .fontWeight(.light)
                            .padding(.trailing,20)
                        Text("影视")
                            .font(.callout)
                            .fontWeight(.light)
                            .padding(.trailing,20)
                        Text("图文")
                            .font(.callout)
                            .fontWeight(.light)
                        Spacer()
                    }
                    .padding(.vertical,5)
                    .padding(.leading,5)
                    ScrollView(showsIndicators: false){
                        ForEach(filteredVideos){video in
                            NavigationLink {
                                VideoPage(video: video)
                            } label: {
                                
                                HStack(alignment: .top){
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 150, height: 80)
                                        .overlay {
                                            Image(video.image)
                                                .resizable()
                                        }
                                        .padding(.trailing, 5)
                                    VStack(alignment: .leading){
                                        Rectangle()
                                            .foregroundStyle(.white)
                                            .overlay(alignment:.topLeading) {
                                                Text(video.title)
                                                    .font(.footnote)
                                                    .foregroundColor(Color.black)
                                            }
                                        Spacer()
                                        HStack{
                                            Image(systemName: "u.square")
                                                .font(.system(size: 13))
                                            Text("M2xal3u")
                                                .font(.system(size: 12))
                                            Spacer()
                                        }
                                        .foregroundStyle(.gray)
                                        HStack{
                                            Image(systemName: "play.tv")
                                                .font(.system(size: 12))
                                            Text("128.3万 · 2024年11月28日")
                                                .font(.caption)
                                                .fontWeight(.light)
                                            Spacer()
                                            Image(systemName: "ellipsis")
                                                .font(.system(size: 12))
                                        }
                                        .foregroundStyle(.gray)
                                    }
                                }
                                
                            }
                            
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
    /// 筛选视频列表
        private func filterVideo() {
            if searchText.isEmpty {
                filteredVideos = videos  // 搜索框为空时显示所有视频
            } else {
                filteredVideos = videos.filter { video in
                    video.title.lowercased().contains(searchText.lowercased())
                }
            }
        }
}

#Preview {
    SearchPage()
}
