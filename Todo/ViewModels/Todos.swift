//
//  Todos.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-10.
//

import Foundation

@MainActor
class Todos: ObservableObject {
    @Published var todos = [Todo]()
    
    var incompleteCount: Int {
        return self.todos.filter { !$0.isCompleted }.count
    }
    
    var completeCount: Int {
        return self.todos.filter { $0.isCompleted }.count
    }
    
    func fetchTodos() {
        Task {
            do {
                todos = try await TodosRepository.fetchTodos()
            } catch {
                print("[Todos] Error while fetching todos: \(error)")
            }
        }
    }
    
    func addTodo(todo: Todo) {
        Task {
            do {
                try await TodosRepository.setData(todo)
            } catch {
                print("[Todos] Error while adding todo: \(error)")
            }
        }
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
