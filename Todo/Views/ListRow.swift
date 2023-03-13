//
//  ListRow.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-09.
//

import SwiftUI

struct ListRow: View {
    @Binding var todo: Todo
    
    var body: some View {
        HStack {
            Button {
                todo.isCompleted.toggle()
            } label: {
                todo.isCompleted ? Image("Checked") : Image("Unchecked")
            }
            Text(todo.title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ListRow_Previews: PreviewProvider {
    struct ListRowWrapper: View {
        @State var todo = Todo(title: "Coffee", isCompleted: false)
        var body: some View {
            ListRow(todo: $todo)
        }
    }
    static var previews: some View {
        ListRowWrapper()
    }
}
