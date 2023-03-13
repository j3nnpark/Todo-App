//
//  addTodoSheet.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-11.
//

import SwiftUI

struct addTodoSheet: View {
    @ObservedObject var viewmodel: Todos
    @Binding var sheetPresented: Bool
    @State var todoTitle = ""
    
    var body: some View {
        NavigationView {
            TextField("Add todo", text: $todoTitle)
//                .onSubmit {
//                    viewmodel.addTodo(
//                        todo: Todo(title: todoTitle, isCompleted: false)
//                    )
//                }
                .toolbar {
                    ToolbarItem {
                        Button("Add") {
                            sheetPresented.toggle()
                            viewmodel.addTodo(
                                todo: Todo(title: todoTitle, isCompleted: false))
                        }
                    }
                }
        }
    }
}

struct addTodoSheet_Previews: PreviewProvider {
    static var previews: some View {
        addTodoSheet(viewmodel: Todos(todos: TestData().testData), sheetPresented: .constant(true))
    }
}
