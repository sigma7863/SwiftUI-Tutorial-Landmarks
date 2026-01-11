//
//  MapView.swift
//  Landmarks
//
//  Created by Sigma7863 on 2026/01/11.
//

import SwiftUI
import MapKit

struct MapView: View {
    // Xcode 15, ios 17 以前のコード
    // @State private var region = MKCoordinateRegion(
        // center: CLLocationCoordinate2D(latitude: 35.658_584, longitude: 139.745_431), // 緯度、経度を指定
        // span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009) // 表示領域の縮尺を指定、単位は度（°)、地球は中心角が 1 度につき距離（円周）は約111kmなので、今回は縮尺を 1km にしたいので緯度、経度ともに 0.009 度にする
    // )
    // Xcode 15, ios 17 以降のコード
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.658_584, longitude: 139.745_431),
        span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
    ))
    
    var body: some View {
        // Text("Hello, World!")
        Map(position: $cameraPosition) // $ をつけることで、ユーザがスマホを操作したときの値を代入できるようになり、地図を指で動かすことができる
    }
}

#Preview {
    MapView()
}
