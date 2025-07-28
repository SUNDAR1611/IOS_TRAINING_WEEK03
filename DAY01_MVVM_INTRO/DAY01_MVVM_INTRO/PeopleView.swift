//
//  ContentView.swift
//  DAY01_MVVM_INTRO
//
//  Created by cs_ios on 28/07/25.
//

import SwiftUI

struct PeopleView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.people) { person in
                    HStack {
                        Image(systemName: "crown")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        VStack(alignment: .leading) {
                            Text(person.name)
                                .font(.headline)
                            Text("Age: \(person.age)")
                            Text("Gender: \(person.gender)")
                            Text("Category: \(person.generalCategory)")
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    .padding(.horizontal)
                }
            }

            Menu("MENU") {
                Button("Sort", action: { viewModel.reverseOrder() })
                Button("Shuffle", action: { viewModel.shuffle() })
                Button("Remove Last", action: { viewModel.removeLastPerson() })
                Button("Remove First", action: { viewModel.removeFirstPerson() })
            }
            .padding()
        }
        .navigationTitle("People")
    }
}

#Preview {
    PeopleView()
}
