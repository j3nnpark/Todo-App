//
//  Todos.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-10.
//

import Foundation

class Todos: ObservableObject {
    @Published var todos: [Todo]
    
    init(todos: [Todo]) {
        self.todos = todos
    }
    
    var incompleteCount: Int {
        return self.todos.filter { !$0.isCompleted }.count
    }
    
    var completeCount: Int {
        return self.todos.filter { $0.isCompleted }.count
    }
    
    func addTodo(todo: Todo) {
        self.todos.append(todo)
    }
    
    func removeTodo(todo: Todo) {
        let index = self.todos.firstIndex(of: todo)
        self.todos.remove(at: index!)
    }
}

enum Filter: String {
    case incomplete = "Incomplete"
    case complete = "Complete"
}
