//
//  RecommendPage.swift
//  BiliBiliDome
//
//  Created by MacBook on 2024/11/3.
//

import SwiftUI

struct RecommendPage:View {
    
    @State private var loopView = 0
    @State var timer: Timer? = nil
    
    let myColor = #colorLiteral(red: 0.9442471591, green: 0.9442471591, blue: 0.9442471591, alpha: 1);
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    
    var body: some View {
        NavigationView {
        ScrollView(showsIndicators: false){
            ZStack{
                //细节b站视频后背景略灰
                Color(myColor)
                
                VStack {
                    //轮播图用使TabView组件搭建，配合timer实现制动轮播，若需实现无线滚动要使用第三方库SwiftUIPager
                    TabView(selection: $loopView){
                        RoundedRectangle(cornerRadius: 5)
                            .tag(0)
                            .overlay {
                                Image("s8")
                                    .resizable()
                                    .scaledToFill()
                            }
                        RoundedRectangle(cornerRadius: 5)
                            .tag(1)
                            .overlay {
                                Image("s9")
                                    .resizable()
                                    .scaledToFill()
                            }
                        RoundedRectangle(cornerRadius: 5)
                            .tag(2)
                            .overlay {
                                Image("s11")
                                    .resizable()
                                    .scaledToFill()
                            }
                    }
                    .animation(.spring, value: loopView)
                    .frame(width: 395, height: 250)
                    .tabViewStyle(PageTabViewStyle())
                    .padding(.top, 5)
                    .onAppear{
                        startTimer()
                    }
                    .onDisappear{
                        stopTimer()
                    }
                    //视频流
                    LazyVGrid(columns: columns, alignment: .center, spacing: 5){
                        ForEach(videos){video in
                            NavigationLink {
                                VideoPage(video: video)
                            } label: {
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.white)
                                    .frame(width: 195, height: 180)
                                    .overlay (
                                        VStack {
                                            RoundedRectangle(cornerRadius: 5)
                                                .overlay(content: {
                                                    Image(video.image)
                                                        .resizable()
                                                })
                                                .frame(width: 195, height: 120)
                                            Text(video.title)
                                                .foregroundStyle(.black)
                                                .font(.callout)
                                                .fontWeight(.light)
                                                .frame(alignment: .leading)
                                                .padding(.vertical,1)
                                                .padding(.horizontal,3)
                                        },
                                        alignment: .top
                                    )
                                
                            }

                        }                    
                    }
                    .padding(.horizontal, 6)
                    .padding(.top, 0)
                    
                }
            }

                
            }
            .ignoresSafeArea()
//            .frame(width: .infinity, height: .infinity)
        }
//        .frame(width: .infinity, height: .infinity)
        .padding(.bottom, 15)
    }
    //轮播图时间
    private func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            if (loopView==2){
                loopView = 0
            }else{
                loopView += 1
            }
        }
    }
    private func stopTimer() {
        if timer != nil {
                    timer?.invalidate()
                    timer = nil
                }
        }
}


#Preview {
    RecommendPage()
}
