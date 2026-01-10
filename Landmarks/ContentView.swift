//
//  ContentView.swift
//  Landmarks
//
//  Created by Sigma7863 on 2026/01/10.
//

import SwiftUI

struct ContentView: View { // View: SwiftUI のビューを表すプロトコル
    var body: some View { // SwiftUI のビューを表すプロトコル
        VStack(alignment: .leading) { // VStack: サブビューを垂直に並べるスタックビュー, alignment: 照準, 整列, .leadingで左寄せにする
            // Image(systemName: "globe")
                // .imageScale(.large)
                // .foregroundStyle(.tint)
            Text("東京タワー")
                .font(.title)
                // .foregroundStyle(.green) // 文字の色を緑色にする
            HStack { // HStackで横並びにする
                Text("東京都港区")
                    .font(.subheadline)
                Spacer() // 間隔を空ける
                Text("東京都")
                    .font(.subheadline)
            }
        }
        .padding() // 左端と右端に少し間隔を空ける
    }
}

#Preview {
    ContentView()
}
