//
//  AddFavoriteView.swift
//  FavoritesApp
//
//  Created by cs_ios on 01/08/25.
//

import SwiftUI

struct AddFavoriteView: View {
    @Environment(\.managedObjectContext) private var context
    @ObservedObject var viewModel: FavoriteViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            Form {
                TextField("Favorite name", text: $viewModel.name)

                Button("Save") {
                    viewModel.addFavorite(context: context)
                    dismiss()
                }
                .disabled(viewModel.name.isEmpty)
            }
            .navigationTitle("Add Favorite")
        }
    }
}
