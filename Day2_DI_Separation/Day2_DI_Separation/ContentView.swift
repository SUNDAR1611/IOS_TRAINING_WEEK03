//
//  ContentView.swift
//  Day2_DI_Separation
//
//  Created by cs_ios on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel
    @State private var showSuccessAlert = false
    
    init() {
        let settings = SettingsManager()
        _viewModel = StateObject(wrappedValue: ViewModel(settings: settings))
    }
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
            
            TextField("Age", text: $viewModel.age)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            
            Button("Submit") {
                viewModel.submit()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Toggle ") {
                viewModel.toggleTheme()
            }
            .padding()
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .alert("Login Successful", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}
