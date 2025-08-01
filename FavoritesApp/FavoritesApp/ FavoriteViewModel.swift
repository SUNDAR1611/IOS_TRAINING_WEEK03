//
//   FavoriteViewModel.swift
//  FavoritesApp
//
//  Created by cs_ios on 01/08/25.
//

import Foundation
import CoreData

class FavoriteViewModel: ObservableObject {
    @Published var name: String = ""

  
    func addFavorite(context: NSManagedObjectContext) {
        let newItem = FavoriteItem(context: context)
        newItem.name = name
        save(context)
        name = ""
    }


    func delete(_ item: FavoriteItem, context: NSManagedObjectContext) {
        context.delete(item)
        save(context)
    }

  
    private func save(_ context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(" CoreData Save Error: \(error.localizedDescription)")
            }
        }
    }
}
