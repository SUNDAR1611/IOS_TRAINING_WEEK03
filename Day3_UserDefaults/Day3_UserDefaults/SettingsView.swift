//
//  SettingsView.swift
//  Day3_UserDefaults
//
//  Created by cs_ios on 30/07/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        Form {
            Section(header: Text("Preferences")) {
                Toggle("Enable Dark Mode", isOn: $isDarkMode)
                Toggle("Login Status", isOn: $isLoggedIn)
            }
        }
        .navigationTitle("Settings")
    }
}

