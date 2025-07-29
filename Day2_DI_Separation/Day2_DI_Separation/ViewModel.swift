//
//  ViewModel.swift
//  Day2_DI_Separation
//
//  Created by cs_ios on 29/07/25.
//

import Combine

class ViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var age: String = ""

    private let settings: SettingsManager

    init(settings: SettingsManager) {
        self.settings = settings
    }

    func submit() {
        guard let ageInt = Int(age) else { return }
        settings.logUser(name: name, email: email, age: ageInt)
    }

    func toggleTheme() {
        settings.toggleDarkMode()
    }
}
