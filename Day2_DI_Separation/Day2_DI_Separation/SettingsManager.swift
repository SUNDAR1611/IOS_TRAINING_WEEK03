//
//  SettingsManager.swift
//  Day2_DI_Separation
//
//  Created by cs_ios on 29/07/25.
//

import Foundation

class SettingsManager {
    private(set) var isDarkModeEnabled = false

    func toggleDarkMode() {
        isDarkModeEnabled.toggle()
        print(" Dark Mode is now \(isDarkModeEnabled ? "ON" : "OFF")")
    }

    func logUser(name: String, email: String, age: Int) {
        let timestamp = Date().formatted(date: .abbreviated, time: .standard)
        print("""
        [LOG - \(timestamp)]
        Name: \(name)
        Email: \(email)
        Age: \(age)
        """)
    }
}
