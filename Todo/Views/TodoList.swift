//
//  TodoList.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-10.
//

import SwiftUI

struct TodoList: View {
    var filter: Filter
    @Binding var todos: [Todo]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(filter.rawValue)
                .fontWeight(.semibold)
            
            List($todos, editActions: .all) { $todo in
                switch filter {
                case .incomplete:
                    if !todo.isCompleted {
                        ListRow(todo: $todo)
                            .listRowSeparator(.hidden)
                    }
                case .complete:
                    if todo.isCompleted {
                        ListRow(todo: $todo)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    struct TodoListWrapper: View {
        @State var todos = [
            Todo(title: "Make coffee", isCompleted: false),
            Todo(title: "Groceries", isCompleted: false)
         ]
        
        var body: some View {
            TodoList(filter: .incomplete,
                     todos: $todos)
        }
    }
    static var previews: some View {
        TodoListWrapper()
    }
}
