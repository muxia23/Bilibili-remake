//
//  BottonTab.swift
//  BiliBiliDome
//
//  Created by MacBook on 2024/11/3.
//

import SwiftUI

struct BottonTab: View {

    @State private var selectedTab = 0
    let Iconcolor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1);
    
    var body: some View {
        TabView(selection: $selectedTab) {
                HomePage()
            .tabItem {
                
                    Image(systemName: "house")
                    Text("首页")
                        
                }
                .tag(0)
            Text("这里是动态")
                .tabItem {
                    Image(systemName: "minus.rectangle")
                    Text("动态")
                }
                .tag(1)
            Text("这里发视频")
                .tabItem {
                    Image(systemName: "plus.app.fill")
                }
                .tag(3)
            Text("叔叔在这里骗你花钱")
                .tabItem {
                    Image(systemName: "bag")
                    Text("会员购")
                }
                .tag(4)
            Personal_Homepage()
                .tabItem {
                    Image(systemName: "minus.plus.batteryblock")
                    Text("我的")
                }
                .tag(5)
        }
        .accentColor(Color(Iconcolor))
        }
    }

#Preview {
    BottonTab()
}
