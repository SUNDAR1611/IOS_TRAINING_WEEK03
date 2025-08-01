//
//  FavoritesAppApp.swift
//  FavoritesApp
//
//  Created by cs_ios on 01/08/25.
//

import SwiftUI

@main
struct FavoritesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
              .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
