//
//  HomePage.swift
//  BiliBiliDome
//
//  Created by MacBook on 2024/11/3.
//

import SwiftUI

struct HomePage: View {
    
    @State private var selectedTab1 = 1
    @State var Living = false
    @State var Recommend = true
    @State var Hot = false
    @State var Cartoon = false
    @State var Movie = false
    @State var New = false
    @State var ifSearch = false
    @State var whichPage = 1
    let Iconcolor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1);
    
    var body: some View {
        ZStack{
            NavigationStack{
                VStack(){
                    //头部组件
                    HStack(alignment: .center){
                        
                        Image("avator")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .clipShape(.circle)
                        //搜素框
                        Button {
                            ifSearch.toggle()
                        } label: {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 210, height: 30)
                                .foregroundStyle(.white)
                            
                                .overlay (
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.black, lineWidth: 1)
                                        .overlay(alignment: .leading, content: {
                                            HStack {
                                                Image(systemName: "magnifyingglass")
                                                    .foregroundStyle(.gray)
                                                Text("s14")
                                                    .font(.footnote)
                                                    .fontWeight(.light)
                                                    .foregroundColor(Color.gray)
                                            }
                                            .padding(.horizontal, 5)
                                        })
                                )
                        }
                        .fullScreenCover(isPresented: $ifSearch) {
                            SearchPage()
                    }
                        NavigationLink(destination: Text("S14")) {
                            Image("s14_icon")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .scaledToFill()
                                .clipShape(.circle)
                        }
                        .padding(.horizontal, 12)
                        Button {
                            
                        } label: {
                            
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "gamecontroller")
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "envelope")
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.black)
                        }
                        
                    }
                    //次级导航栏
                    HStack{
                        Button(action: {
                            if !Living{
                                Living.toggle()
                                judge()
                                whichPage=0
                            }
                        }, label: {
                            Text("直播")
                                .font(Living ? .title3 : .callout)
                                .foregroundColor(Living ? Color(Iconcolor) : Color.gray)
                                .fontWeight(Living ? .semibold : .regular)
                                .underline(Living)
                        })
                    Spacer()
                        Button(action: {
                            if !Recommend{
                                Recommend.toggle()
                                judge()
                                whichPage=1
                            }
                        }, label: {
                            Text("推荐")
                                .font(Recommend ? .title3 : .callout)
                                .foregroundColor(Recommend ? Color(Iconcolor) : Color.gray)
                                .fontWeight(Recommend ? .semibold : .regular)
                                .underline(Recommend)
                        })
                        
                    Spacer()
                        Button(action: {
                            if !Hot{
                                Hot.toggle()
                                judge()
                                whichPage=2
                            }
                        }, label: {
                            Text("热门")
                                .font(Hot ? .title3 : .callout)
                                .foregroundColor(Hot ? Color(Iconcolor) : Color.gray)
                                .fontWeight(Hot ? .semibold : .regular)
                                .underline(Hot)
                        })
                    Spacer()
                        Button(action: {
                            if !Cartoon{
                                Cartoon.toggle()
                                judge()
                                whichPage=3
                            }
                        }, label: {
                            Text("动漫")
                                .font(Cartoon ? .title3 : .callout)
                                .foregroundColor(Cartoon ? Color(Iconcolor) : Color.gray)
                                .fontWeight(Cartoon ? .semibold : .regular)
                                .underline(Cartoon)
                        })
                    Spacer()
                        Button(action: {
                            if !Movie{
                                Movie.toggle()
                                judge()
                                whichPage=4
                            }
                        }, label: {
                            Text("影视")
                                .font(Movie ? .title3 : .callout)
                                .foregroundColor(Movie ? Color(Iconcolor) : Color.gray)
                                .fontWeight(Movie ? .semibold : .regular)
                                .underline(Movie)
                        })
                    Spacer()
                        Button(action: {
                            if !New{
                                New.toggle()
                                judge()
                                whichPage=5
                            }
                        }, label: {
                            Text("新征程")
                                .font(New ? .title3 : .callout)
                                .foregroundColor(New ? Color(Iconcolor) : Color.gray)
                                .fontWeight(New ? .semibold : .regular)
                                .underline(New)
                        })
                    Spacer()
                    NavigationLink(destination: Text("")) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color.black)
                        
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.leading, 35)
                    if Recommend{
                        RecommendPage()
                    }else{
                        Spacer()
                    }
                    }
                
            }
            //if 
        }
        
    }
    //方法更改图标变化
    func judge(){
        if whichPage==0{
            Living = false
        }else if whichPage==1{
            Recommend = false
        }else if whichPage==2{
            Hot = false
        }else if whichPage==3{
            Cartoon = false
        }else if whichPage==4{
            Movie = false
        }else {
            New = false
        }
        
    }
}

#Preview {
    HomePage()
}
