//
//  ContentView.swift
//  Day3_UserDefaults
//
//  Created by cs_ios on 30/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var savedName: String = ""
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .bold()

                if !savedName.isEmpty {
                    Text("HI! \(savedName)")
                        .font(.title2)
                        .bold()
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Enter Your Name:")
                        .font(.headline)

                    TextField("Enter Name", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                }

                Button(action: {
                    saveName()
                }) {
                    Text("Submit")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)

                Divider()

                Text("Dark Mode: \(isDarkMode ? "ON" : "OFF")")
                Text("Login Status: \(isLoggedIn ? "ON" : "OFF")")

                NavigationLink(destination: SettingsView()) {
                    Text("Go to Settings")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .navigationTitle("Home")
            .onAppear {
                loadName()
            }
        }
    }

    func saveName() {
        UserDefaults.standard.set(username, forKey: "savedName")
        loadName()
        username = ""
    }

    func loadName() {
        savedName = UserDefaults.standard.string(forKey: "savedName") ?? ""
    }
}
