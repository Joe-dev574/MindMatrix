//
//  MindMatrixApp.swift
//  MindMatrix
//
//  Created by Joseph DeWeese on 11/30/24.
//

import SwiftUI
import SwiftData

@main
struct MindMatrixApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ItemListScreen()
        }
        .modelContainer(sharedModelContainer)
    }
}
