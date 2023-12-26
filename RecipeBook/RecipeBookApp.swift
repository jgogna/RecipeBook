//
//  RecipeBookApp.swift
//  RecipeBook
//
//  Created by Jatinder Gogna on 5/10/22.
//

import SwiftUI

@main
struct RecipeBookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
