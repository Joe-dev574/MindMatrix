//
//  SniperScope.swift
//  MindMatrix
//
//  Created by Joseph DeWeese on 11/30/24.
//

import SwiftUI
import SwiftData

@Model
class SniperScopeTag {
    var name: String = ""
    var color: String = "FF0000"
    var items: [Item]?
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}


