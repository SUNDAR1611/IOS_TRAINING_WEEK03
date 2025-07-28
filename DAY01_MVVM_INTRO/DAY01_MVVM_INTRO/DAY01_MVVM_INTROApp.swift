//
//  DAY01_MVVM_INTROApp.swift
//  DAY01_MVVM_INTRO
//
//  Created by cs_ios on 28/07/25.
//

import SwiftUI

@main
struct DAY01_MVVM_INTROApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                PeopleView()
            }
        }
    }
}
