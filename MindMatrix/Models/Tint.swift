//
//  Tint.swift
//  MindMatrix
//
//  Created by Joseph DeWeese on 12/4/24.
//

import SwiftData
import SwiftUI


struct TintColor: Identifiable {
    let id: UUID = .init( )
    var color: String
    var value: Color
}
    
var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Purple", value: .purple),
    .init(color: "Orange", value: .orange),
    .init(color: "Cyan", value: .cyan),
    .init(color: "Indigo", value: .indigo),
    .init(color: "Yellow", value: .yellow),
    .init(color: "Green", value: .green),
    .init(color: "Gray", value: .gray)
]


