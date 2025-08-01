//
//  ContentView.swift
//  FavoritesApp
//
//  Created by cs_ios on 01/08/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        sortDescriptors: [],
        animation: .default
    )
    private var favorites: FetchedResults<FavoriteItem>

    @StateObject private var viewModel = FavoriteViewModel()
    @State private var showAdd = false

    var body: some View {
        NavigationView {
            List {
                ForEach(favorites) { item in
                    Text(item.name ?? "")
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let item = favorites[index]
                        viewModel.delete(item, context: context)
                    }
                }
            }
            .navigationTitle("Favorites")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAdd = true
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAdd) {
                AddFavoriteView(viewModel: viewModel)
                    .environment(\.managedObjectContext, context)
            }
        }
    }
}
