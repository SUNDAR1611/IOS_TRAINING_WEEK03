//
//  AddNoteView.swift
//  Day4__CoreDataNotes
//
//  Created by cs_ios on 31/07/25.
//
import SwiftUI

struct AddNoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var noteBody = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }
                Section(header: Text("Body")) {
                    TextEditor(text: $noteBody)
                        .frame(height: 150)
                }
                Button("Save Note") {
                    let newNote = NotesEntity(context: viewContext)
                    newNote.title = title
                    newNote.body = noteBody

                    do {
                        try viewContext.save()
                        dismiss()
                    } catch {
                        print("Error saving note: \(error.localizedDescription)")
                    }
                }
                .disabled(title.isEmpty || noteBody.isEmpty)
            }
            .navigationTitle("New Note")
            .navigationBarItems(trailing: Button("Cancel") {
                dismiss()
            })
        }
    }
}
