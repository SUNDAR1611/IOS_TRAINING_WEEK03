//
//  ViewModel.swift
//  DAY01_MVVM_INTRO
//
//  Created by cs_ios on 28/07/25.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var people: [Model] = []

    init() {
        addPeople()
    }

    func shuffle() {
        people.shuffle()
    }

    func reverseOrder() {
        people.reverse()
    }

    func removeLastPerson() {
        if !people.isEmpty {
            people.removeLast()
        }
    }

    func removeFirstPerson() {
        if !people.isEmpty {
            people.removeFirst()
        }
    }

    func addPeople() {
        people = [
            Model(name: "John Snow", age: 28, gender: "Male", generalCategory: "King"),
            Model(name: "Daenerys Targaryen", age: 25, gender: "Female", generalCategory: "Queen"),
            Model(name: "Tyrion Lannister", age: 30, gender: "Male", generalCategory: "Boss"),
            Model(name: "Cersei Lannister", age: 35, gender: "Female", generalCategory: "Boss"),
            Model(name: "Joffrey Baratheon", age: 12, gender: "Male", generalCategory: "Prince"),
            Model(name: "Jaime Lannister", age: 40, gender: "Male", generalCategory: "Boss"),
            Model(name: "Arya Stark", age: 18, gender: "Female", generalCategory: "Princess"),
            Model(name: "Sansa Stark", age: 16, gender: "Female", generalCategory: "Princess"),
            Model(name: "Bran Stark", age: 11, gender: "Male", generalCategory: "Prince"),
            Model(name: "Robb Stark", age: 14, gender: "Male", generalCategory: "Prince")
        ]
    }
}
