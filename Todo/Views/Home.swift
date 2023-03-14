//
//  ContentView.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-09.
//

import SwiftUI

struct Home: View {
    @StateObject var viewmodel = Todos()
    @State var addingSheetPresented = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack {
                    Header(viewmodel: viewmodel)
                        .padding(.bottom, 15)
                    
                    TodoList(filter: Filter.incomplete,
                             todos: $viewmodel.todos)
                    Spacer()
                        .frame(height: 30)

                    TodoList(filter: Filter.complete,
                             todos: $viewmodel.todos)

                    Spacer()
                }
                .padding()
                
                HStack {
                    Spacer()
                    
                    Button(action: { addingSheetPresented = true },
                           label: { Image("Plus") })
                    .sheet(isPresented: $addingSheetPresented) {
                        print("Sheet dismissed")
                    } content: {
                        addTodoSheet(viewmodel: viewmodel, sheetPresented: $addingSheetPresented)
                    }
                    .padding([.bottom, .trailing])
                }
            }
        }
        .onAppear {
            viewmodel.fetchTodos()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
