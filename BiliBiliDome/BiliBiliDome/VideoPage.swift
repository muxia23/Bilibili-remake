//
//  VideoPage.swift
//  BiliBiliDome
//
//  Created by MacBook on 2024/11/5.
//

import SwiftUI

struct VideoPage: View {

    // 追加代码1：声明属性presentationMode
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    let IconColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1);
    @State var number = 0
    @State var followings = 233
    @State var coins = 3333
    @State var coinColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1);
    @State var ifFollowing = false
    @State var ifLike = false
    @State var ifDislike = false
    @State var ifCoin = false
    @State var ifCollect = false
    @State var ifShare = false
    @State var addCollect = false
    @State var deleteCollect = false
    var video: Video

    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                Color.black
                    .frame(height: 300)
                    .ignoresSafeArea()
                    .background(.white)
                    
                    
                VStack{
                    HStack(alignment: .top){
                        Rectangle()
                            
                            .frame(width: .infinity, height: 250)
                            .foregroundStyle(.white)
                            .overlay {
                                Image(video.image)
                                    .resizable()
                                    .scaledToFill()
                            }
                            .overlay(alignment: .topLeading) {
                                Button {
                                    self.presentationMode.wrappedValue.dismiss()
                                    setTabBarVisibility(hidden: false)
                                } label: {
                                    Image(systemName: "chevron.backward")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.white)
                                        .padding()
                                }
                                
                                
                            }
                    }
                    HStack{
                        Rectangle()
                            .foregroundStyle(.white)
                            .frame(height: 40)
                            .overlay {
                                HStack(){
                                    Button {
                                    } label: {
                                        Text("简介")
                                            .font(.callout)
                                            .foregroundColor(Color(IconColor))
                                    }
                                    .padding(.horizontal,30)
                                    Button {
                                        number += 1
                                    } label: {
                                        Text("评论\(number)")
                                            .font(.callout)
                                            .foregroundColor(Color.gray)
                                    }
                                    Spacer()
                                }
                            }
                    }
                    .frame(height: 30)
                    ScrollView(showsIndicators: false){
                        ZStack{
                            VStack(alignment: .leading){
                                Rectangle()
                                    .frame(width: .infinity, height: 200)
                                    .foregroundStyle(.white)
                                    .overlay(content: {
                                        Rectangle()
                                            .stroke(Color.gray, lineWidth: 1)
                                    })
                                    .overlay{
                                        VStack(alignment: .leading){
                                            HStack{
                                                Image("avator")
                                                    .resizable()
                                                    .frame(width: 35, height: 35)
                                                    .scaledToFill()
                                                    .clipShape(.circle)
                                                VStack(alignment: .leading){
                                                    Text("m2xal3u")
                                                        .font(.callout)
                                                        .fontWeight(.light)
                                                    Text("\(followings)粉丝 1视频")
                                                        .font(.footnote)
                                                        .fontWeight(.light)
                                                        .foregroundColor(Color.gray)
                                                }
                                                Spacer()
                                                Button {
                                                    ifFollowing.toggle()
                                                    if ifFollowing{
                                                        followings += 1
                                                    }else{
                                                        followings -= 1
                                                    }
                                                    
                                                } label: {
                                                    RoundedRectangle(cornerRadius: 25)
                                                        .frame(width: 85,height: 30)
                                                        .foregroundStyle(ifFollowing ? .gray : Color(IconColor))
                                                        .overlay(alignment: .center) {
                                                            HStack{
                                                                Image(systemName: ifFollowing ? "line.3.horizontal" : "plus")
                                                                Text(ifFollowing ? "已关注" : "关注")
                                                                    .font(.callout)
                                                                
                                                            }
                                                            .foregroundStyle(ifFollowing ? .black : .white)
                                                        }
                                                }
                                                
                                            }
                                            .padding(.top,3)
                                            HStack{
                                                Text(video.title)
                                            }
                                            .padding(.vertical, 5)
                                            HStack{
                                                Image(systemName: "play.tv")
                                                    .font(.system(size: 12))
                                                Text("233.3万")
                                                    .font(.system(size: 14))
                                                Image(systemName: "list.dash.header.rectangle")
                                                    .font(.system(size: 12))
                                                Text("2233")
                                                    .font(.system(size: 14))
                                                Text("2024年10月1日  20:00")
                                                    .font(.system(size: 14))
                                                Image(systemName: "person.2")
                                                    .font(.system(size: 12))
                                                Text("99")
                                                    .font(.system(size: 14))
                                            }
                                            .foregroundColor(Color.gray)
                                            HStack{
                                                Spacer()
                                                Button {
                                                    ifLike.toggle()
                                                    if ifDislike{
                                                        ifDislike = false
                                                    }
                                                } label: {
                                                    VStack{
                                                        Image(systemName: "hand.thumbsup.fill")
                                                            .font(.system(size: 30))
                                                            .foregroundStyle(ifLike ? Color(IconColor) : .gray)
                                                        Text("1.7万")
                                                            .font(.footnote)
                                                            .fontWeight(.light)
                                                            .foregroundStyle(.gray)
                                                    }
                                                }
                                                Spacer()
                                                Button {
                                                    ifDislike.toggle()
                                                    if ifLike{
                                                        ifLike = false
                                                    }
                                                } label: {
                                                    VStack{
                                                        Image(systemName: "hand.thumbsdown.fill")
                                                            .font(.system(size: 30))
                                                            .foregroundStyle(ifDislike ? Color(IconColor) : .gray)
                                                        Text("不喜欢")
                                                            .font(.footnote)
                                                            .fontWeight(.light)
                                                            .foregroundStyle(.gray)
                                                    }
                                                }
                                                Spacer()
                                                Button {
                                                    if !ifCoin{
                                                        coins += 2
                                                        ifCoin.toggle()
                                                        coinColor = IconColor
                                                    }
                                                } label: {
                                                    VStack{
                                                        Image(systemName: "bitcoinsign.circle.fill")
                                                            .font(.system(size: 30))
                                                            .foregroundStyle(Color(coinColor))
                                                        Text("\(coins)")
                                                            .font(.footnote)
                                                            .fontWeight(.light)
                                                            .foregroundStyle(.gray)
                                                    }
                                                }
                                                Spacer()
                                                Button {
                                                    ifCollect.toggle()
                                                    withAnimation(.easeInOut) {
                                                        if ifCollect{
                                                            addCollect = true
                                                            deleteCollect = false
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                                addCollect = false
                                                            }
                                                        }else{
                                                            deleteCollect = true
                                                            addCollect = false
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                                deleteCollect = false
                                                            }
                                                        }
                                                    }
                                                } label: {
                                                    VStack{
                                                        Image(systemName: "star.fill")
                                                            .font(.system(size: 30))
                                                            .foregroundStyle(ifCollect ? Color(IconColor) : .gray)
                                                        Text("1.1万")
                                                            .font(.footnote)
                                                            .fontWeight(.light)
                                                            .foregroundStyle(.gray)
                                                    }
                                                }
                                                Spacer()
                                                Button {
                                                    withAnimation(.easeInOut) {
                                                        ifShare.toggle()
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                            ifShare.toggle()
                                                        }
                                                    }
                                                } label: {
                                                    VStack{
                                                        Image(systemName: "arrowshape.turn.up.right.fill")
                                                            .font(.system(size: 30))
                                                            .foregroundStyle(.gray)
                                                        Text("1.3万")
                                                            .font(.footnote)
                                                            .fontWeight(.light)
                                                            .foregroundStyle(.gray)
                                                    }
                                                }
                                                Spacer()
                                            }
                                            .padding(.vertical, 6)
                                            
                                        }
                                        .padding(.horizontal, 8)
                                        
                                    }
                                ForEach(videos.filter { $0.id != video.id }){video in
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
                                                                .font(.callout)
                                                                .foregroundColor(Color.black)
                                                        }
                                                    Spacer()
                                                    HStack{
                                                        Image(systemName: "play.tv")
                                                            .font(.system(size: 15))
                                                        Text("128.3万")
                                                            .font(.caption)
                                                            .fontWeight(.light)
                                                        Image(systemName: "heart")
                                                            .font(.system(size: 15))
                                                        Text("23.5万")
                                                            .font(.caption)
                                                            .fontWeight(.light)
                                                        Spacer()
                                                        Image(systemName: "ellipsis")
                                                            .font(.system(size: 15))
                                                    }
                                                    .foregroundStyle(.gray)
                                                }
                                            }
                                            .padding(.horizontal,8)
                                            .padding(.vertical,3)
                                    
                                    }
                                }
                                
                            }
                        }
                    }
                }
                if ifShare {
                    GeometryReader { geometry in
                        Color.black.opacity(0.75)
                            .frame(width: 100, height: 50)
                            .cornerRadius(15)
                            .overlay(
                                Text("分享成功")
                                    .foregroundColor(.white)
                                    .font(.body)
                            )
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // 定位到屏幕中心
                            .transition(.scale) // 放大缩小弹窗
                    }
                }
                if addCollect {
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.white)
                            .frame(width: .infinity, height: 50)
                            .padding(.horizontal, 5)
                        
                            .overlay(
                                HStack {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(Color(IconColor))
                                    Text("已加入默认收藏夹")
                                        .foregroundColor(.black)
                                        .font(.body)
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        Text("修改收藏夹")
                                            .foregroundStyle(Color(IconColor))
                                    }
                                }
                                    .padding(.horizontal)
                            )
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 39 / 40) //
                            .transition(.scale) // 放大缩小弹窗
                    }
                }
                if deleteCollect {
                    GeometryReader { geometry in
                        Color.black.opacity(0.75)
                            .frame(width: 100, height: 50)
                            .cornerRadius(15)
                            .overlay(
                                Text("已取消收藏")
                                    .foregroundColor(.white)
                                    .font(.body)
                            )
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // 定位到屏幕中心
                            .transition(.scale) // 放大缩小弹窗
                    }
                }
            }
        }
        .navigationBarHidden(true) // 追加后destination不再出现标题栏
        .onAppear {
            setTabBarVisibility(hidden: true)
        }
//        .onDisappear {
//            setTabBarVisibility(hidden: false)
//        }
    }
    

    private func findTabBarController(from rootViewController: UIViewController?) -> UITabBarController? {
        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController
        }

        for child in rootViewController?.children ?? [] {
            if let tabBarController = findTabBarController(from: child) {
                return tabBarController
            }
        }

        return nil
    }
    private func setTabBarVisibility(hidden: Bool) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }

        if let tabBarController = findTabBarController(from: rootViewController) {
            tabBarController.setTabBarHidden(hidden, animated: false)
        } else {
        }
    }


}

#Preview {
    VideoPage(video: Video(id: 3, image: "travel0", title: "洛克之路 ｜ 我伸了一个懒腰，穿越了甘南秘境",like: false,dislike: false,coins: false,collect: true))
}
