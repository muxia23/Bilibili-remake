//
//  Personal_Homepage.swift
//  BiliBiliDome
//
//  Created by MacBook on 2024/11/3.
//

import SwiftUI

struct Personal_Homepage:View {
    @State var collect0 = false
    @State var collect1 = true
    @State var collect2 = false
    @State var angle0 : Double = -180.0
    @State var angle1 : Double = 0
    @State var angle2 : Double = -180.0
    let Color0 = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1);
    let Color1 = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1);
//    @State var tem : Double = 0
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Text("我的收藏")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                    }
                    
                }
                .padding(.horizontal,20)
                
                HStack{
                    Text("视频")
                        .font(.callout)
                        .fontWeight(.light)
                        .padding(.trailing,20)
                        .foregroundStyle(.pink)
                    Text("追番")
                        .font(.callout)
                        .fontWeight(.light)
                        .padding(.trailing,20)
                    Text("追剧")
                        .font(.callout)
                        .fontWeight(.light)
                        .padding(.trailing,20)
                    Text("视频")
                        .font(.callout)
                        .fontWeight(.light)
                        .padding(.trailing,20)
                    Text("视频")
                        .font(.callout)
                        .fontWeight(.light)
                    
                    Spacer()
                }
                .padding(.horizontal,13)
                .padding(.vertical,5)
                Rectangle()
                    .frame(width: .infinity, height: 1)
                    .foregroundStyle(.gray)
                    .padding(.bottom,10)
                HStack{
                    Button {
                        withAnimation(.easeInOut) {
                            
                            collect0.toggle()
                            angle0 += 180
                        }
                        
                    } label: {
                        HStack {
                            Image(systemName: "chevron.up")
                                                .foregroundStyle(.gray)
                                                .rotationEffect(.degrees(angle0))
                            Text("默认收藏夹")
                                .foregroundStyle(.black)
                            Text("· 1")
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        .padding(.leading,10)
                        .overlay {
                            HStack{
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.pink)
                                    Text("播放全部")
                                        .fontWeight(.light)
                                        .foregroundStyle(.pink)
                                }
                                .padding(.trailing,8)
                                Button {
                                    
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundStyle(.gray)
                                }
                                .padding(.trailing,8)
                                Button {
                                    
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(.gray)
                                }
                                
                            }
                        }
                        .padding(.trailing)
                    }
                    
                }
                .padding(.bottom)
                if collect0{
                HStack(alignment: .top){
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 140, height: 80)
                        .overlay {
                            Image("travel0")
                                .resizable()
                        }
                    VStack{
                        HStack(alignment: .top){
                            Rectangle()
                                .frame(width: .infinity, height: 34)
                                .foregroundStyle(.white)
                                .overlay {
                                    Text("洛克之路 ｜ 我伸了一个懒腰，穿越了甘南秘境")
                                        .font(.system(size: 14))
                                }
                            
                        }
                        .padding(.bottom,11)
                        HStack{
                            Image(systemName: "u.square")
                                .font(.system(size: 13))
                            Text("M2xal3u")
                                .font(.system(size: 13))
                            Spacer()
                        }
                        .foregroundStyle(.gray)
                        HStack{
                            Image(systemName: "play.tv")
                                .font(.system(size: 12))
                            Text("233.3万")
                                .font(.system(size: 14))
                            Image(systemName: "list.dash.header.rectangle")
                                .font(.system(size: 12))
                            Text("2233")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        .foregroundStyle(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal,8)
                .padding(.bottom)
            }
                VStack{
                    HStack{
                        Button {
                            collect1.toggle()
                            angle1 += 180
                        } label: {
                            HStack {
                                Image(systemName: "chevron.up")
                                    .foregroundStyle(.gray)
                                    .rotationEffect(.degrees(angle1))
                                Text("我创建的收藏夹")
                                    .foregroundStyle(.black)
                                Text("· 1")
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                        }
                        
                    }
                    
                    if collect1{
                        HStack(alignment: .top){
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 140, height: 80)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 120, height: 80)
                                        .foregroundStyle(Color(Color1))
                                        .offset(y: -14)
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 130, height: 80)
                                        .foregroundStyle(Color(Color0))
                                        .offset(y: -7)
                                    Image("travel0")
                                        .resizable()
                                }
                            Rectangle()
                                .frame(width: .infinity, height: 80)
                                .foregroundStyle(.white)
                                .overlay (
                                    VStack(alignment:.leading){
                                        HStack{
                                            Text("旅游")
                                                .font(.system(size: 15))
                                        }
                                        Spacer()
                                        HStack{
                                            Text("创建者：M2xal3u")
                                                .font(.system(size: 14))
                                                .foregroundStyle(.gray)
                                        }
                                        HStack{
                                            Text("收藏夹 · 公开")
                                                .font(.system(size: 14))
                                                .foregroundStyle(.gray)
                                            Spacer()
                                            Image(systemName: "ellipsis")
                                                .foregroundStyle(.gray)
                                        }
                                    },alignment: .topLeading
                                )
                            
                            Spacer()
                        }
                        .padding(.leading,10)
                        .padding(.top)
                    }
                }
                .padding(.bottom)
                VStack{
                    HStack{
                        Button {
                            collect2.toggle()
                            angle2 += 180
                        } label: {
                            HStack {
                                Image(systemName: "chevron.up")
                                    .foregroundStyle(.gray)
                                    .rotationEffect(.degrees(angle2))
                                Text("我的收藏和订阅")
                                    .foregroundStyle(.black)
                                Text("· 1")
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                            .padding(.leading,10)
                        }
                    }
                    if collect2{
                        HStack(alignment: .top){
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 140, height: 80)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 120, height: 80)
                                        .foregroundStyle(Color(Color1))
                                        .offset(y: -14)
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 130, height: 80)
                                        .foregroundStyle(Color(Color0))
                                        .offset(y: -7)
                                    Image("s8")
                                        .resizable()
                                }
                            Rectangle()
                                .frame(width: .infinity, height: 80)
                                .foregroundStyle(.white)
                                .overlay (
                                    VStack(alignment:.leading){
                                        HStack{
                                            Text("s赛")
                                                .font(.system(size: 15))
                                        }
                                        Spacer()
                                        HStack{
                                            Text("创建者：M2xal3u")
                                                .font(.system(size: 14))
                                                .foregroundStyle(.gray)
                                        }
                                        HStack{
                                            Text("合集 · 1557万播放")
                                                .font(.system(size: 14))
                                                .foregroundStyle(.gray)
                                            Spacer()
                                            Image(systemName: "ellipsis")
                                                .foregroundStyle(.gray)
                                        }
                                    },alignment: .topLeading
                                )
                            
                            Spacer()
                        }
                        .padding(.top)
                        .padding(.leading,10)
                        
                    }
                }
                .padding(.bottom)
                HStack{
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "play.circle")
                                .foregroundStyle(.gray)
                            Text("稍后再看")
                                .foregroundStyle(.black)
                            Text("· 88")
                                .foregroundStyle(.gray)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal,10)
                    }

                }
                Spacer()
                    
            }
        }
    }
}

#Preview {
    Personal_Homepage()
}
