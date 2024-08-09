//
//  shopping_list_app_iosApp.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 02/08/2024.
//

import SwiftUI
import SwiftData

@main
struct ShoppingListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ShoppingListModel.self,
            Grocery.self,
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
            ContentView()
        }.modelContainer(sharedModelContainer)
    }
}
