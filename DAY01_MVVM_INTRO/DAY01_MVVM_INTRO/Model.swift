//
//  Model.swift
//  DAY01_MVVM_INTRO
//
//  Created by cs_ios on 28/07/25.
//
import SwiftUI

struct Model: Identifiable {
    var id: UUID = UUID()
    var name: String
    var age: Int
    var gender: String
    var generalCategory: String
}

