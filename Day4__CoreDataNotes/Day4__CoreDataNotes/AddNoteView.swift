//
//  AddNoteView.swift
//  Day4__CoreDataNotes
//
//  Created by cs_ios on 31/07/25.
//
// AddNoteView.swift
import SwiftUI

struct AddNoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var noteBody = ""

    var noteToEdit: NotesEntity?

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

                Button(noteToEdit == nil ? "Save Note" : "Update Note") {
                    if let note = noteToEdit {
                        note.title = title
                        note.body = noteBody
                    } else {
                        let newNote = NotesEntity(context: viewContext)
                        newNote.title = title
                        newNote.body = noteBody
                    }

                    do {
                        try viewContext.save()
                        dismiss()
                    } catch {
                        print("Error saving note: \(error.localizedDescription)")
                    }
                }
                .disabled(title.isEmpty || noteBody.isEmpty)
            }
            .navigationTitle(noteToEdit == nil ? "New Note" : "Edit Note")
            .navigationBarItems(trailing: Button("Cancel") {
                dismiss()
            })
            .onAppear {
                if let note = noteToEdit {
                    title = note.title ?? ""
                    noteBody = note.body ?? ""
                }
            }
        }
    }
}

