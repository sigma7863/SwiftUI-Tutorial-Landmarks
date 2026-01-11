//
//  Landmark.swift
//  Landmarks
//
//  Created by Sigma7863 on 2026/01/11.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var prefecture: String
    var area: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var
}
