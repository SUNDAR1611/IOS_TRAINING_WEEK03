//
//  ContentView.swift
//  Day4__CoreDataNotes
//
//  Created by cs_ios on 31/07/25.
//

import SwiftUI

struct NotesListView: View {
    @Environment(\.managedObjectContext) private var viewContext

  
    @FetchRequest(entity: NotesEntity.entity(), sortDescriptors: [])
    private var notes: FetchedResults<NotesEntity>
    
    @State private var showingAddNote = false

    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(note.title ?? "")
                            .font(.headline)
                        Text(note.body ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                .onDelete(perform: deleteNotes)
            }
            .navigationTitle("My Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddNote = true
                    }) {
                        Label("Add Note", systemImage: "plus")
                    }
                }

               
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddNote) {
                AddNoteView()
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }

    
    private func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            let note = notes[index]
            viewContext.delete(note)
        }

        do {
            try viewContext.save()
        } catch {
            print("Failed to delete note: \(error.localizedDescription)")
        }
    }
}
