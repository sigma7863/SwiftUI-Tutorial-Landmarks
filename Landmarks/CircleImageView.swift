//
//  CircleImageView.swift
//  Landmarks
//
//  Created by Sigma7863 on 2026/01/11.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
        // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Image("東京タワー")
            .clipShape(Circle()) // 画像を円形に切り抜く
            .overlay(
                alignment: .center,
                content: { Circle().stroke(Color.white, lineWidth: 4) }
            ) // 円を白色の4pxのせんで縁取る
            .shadow(radius: 7) // 半径7pxの影をつける
    }
}

#Preview {
    CircleImageView()
}
