//
//  Todo.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-09.
//

import Foundation

struct Todo: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}

struct TestData {
    var testData = [
    Todo(title: "Make coffee", isCompleted: false),
    Todo(title: "Groceries", isCompleted: false),
    Todo(title: "Buy cake", isCompleted: true)
    ]
}
