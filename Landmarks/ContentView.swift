//
//  ContentView.swift
//  Landmarks
//
//  Created by Sigma7863 on 2026/01/10.
//

import SwiftUI

struct ContentView: View { // View: SwiftUI のビューを表すプロトコル
    var body: some View { // SwiftUI のビューを表すプロトコル
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top) // MapView を画面の上部いっぱいまで表示させる
                .frame(height: 300)
            
            CircleImageView()
                .offset(y: -130) // 円形の東京タワー(CircleImageView)を130px上に上げる
                .padding(.bottom, -130) // 下のVStackのテキスト集合を130px上に上げる
            
            VStack(alignment: .leading) { // VStack: サブビューを垂直に並べるスタックビュー, alignment: 照準, 整列, .leadingで左寄せにする
                // Image(systemName: "globe")
                    // .imageScale(.large)
                    // .foregroundStyle(.tint)
                Text("東京タワー")
                    .font(.title)
                    // .foregroundStyle(.green) // 文字の色を緑色にする
                HStack { // HStackで横並びにする
                    Text("東京都港区")
                    Spacer() // 間隔を空ける
                    Text("東京都")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary) // 東京都港区の行の文字を薄く(灰色)にする
                
                Divider() // 区切り線を入れる
                
                Text("東京タワーについて")
                    .font(.title2)
                Text("説明をここに追加する。")
            }
            .padding() // 左端と右端に少し間隔を空ける
            
            Spacer() // 一番下に余白を作る
        }

    }
}

#Preview {
    ContentView()
}
