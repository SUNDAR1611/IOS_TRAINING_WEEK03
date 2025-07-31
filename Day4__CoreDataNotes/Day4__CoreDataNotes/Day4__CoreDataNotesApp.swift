//
//  Day4__CoreDataNotesApp.swift
//  Day4__CoreDataNotes
//
//  Created by cs_ios on 31/07/25.
//

import SwiftUI

@main
struct Day4__CoreDataNotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NotesListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
#Preview {
    
}
