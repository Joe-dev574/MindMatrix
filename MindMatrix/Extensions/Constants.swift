//
//  Constants.swift
//  MindMatrix
//
//  Created by Joseph DeWeese on 12/4/24.
//

import SwiftUI

@Observable
class Constants {
    static let shared = Constants()
    
    var appTint: String = UserDefaults.standard.string(forKey: "appTint") ?? "Blue"
    
    var tintColor: Color {
        return tints.first { $0.color == appTint }?.value ?? .red
    }
}


