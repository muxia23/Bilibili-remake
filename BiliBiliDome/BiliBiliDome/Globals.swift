//
//  Globals.swift
//  BiliBiliDome
//
//  Created by MacBook on 2024/11/18.
//

import Foundation


struct Video: Identifiable {
    let id: Int
    let image: String
    let title: String
    let like: Bool
    let dislike: Bool
    let coins: Bool
    let collect: Bool
}
let videos = [
    Video(id: 0, image: "3stars", title: "【才浅】15天花20万元用500克黄金敲数万锤纯手工打造三星堆黄金面具",like: false,dislike: false,coins: false,collect: true),
    Video(id: 1, image: "math", title: "火柴人 VS 数学(Math)",like: false,dislike: false,coins: false,collect: false),
    Video(id: 2, image: "swiftUI", title: "iOS&MacOS 开发 SwiftUI 62集入门教程（中英字幕）",like: false,dislike: false,coins: false,collect: false),
    Video(id: 3, image: "travel0", title: "洛克之路 ｜ 我伸了一个懒腰，穿越了甘南秘境",like: false,dislike: false,coins: false,collect: false),
    Video(id: 4, image: "lumin", title: "【直播录像】夏日时光放映中",like: false,dislike: false,coins: false,collect: false),
    Video(id: 5, image: "sing", title: "【彩虹合唱】《如果明天就是下一生》，我会永远铭记那些离别",like: false,dislike: false,coins: false,collect: false),
    Video(id: 6, image: "travel1", title: "嘉倩｜世界最北首都｜星际穿越的取景地｜和爸爸谈心",like: false,dislike: false,coins: false,collect: false),
    Video(id: 7, image: "doubleTower", title: "《Come Play》｜《英雄联盟｜双城之战》动画第二季｜拳头游戏音乐",like: false,dislike: false,coins: false,collect: false),
]
