//
//  MapView.swift
//  Landmarks
//
//  Created by Sigma7863 on 2026/01/11.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.658_584, longitude: 139.745_431),
        span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
    }
                       
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MapView()
}
