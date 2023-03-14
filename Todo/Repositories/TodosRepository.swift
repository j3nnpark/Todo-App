//
//  TodosRepository.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-14.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct TodosRepository {
    // code reference: Codecademy iOS dev path
    static let todosReference = Firestore.firestore().collection("todos")
    
    static func setData(_ todo: Todo) async throws {
        let document = todosReference.document(todo.id.uuidString)
        try await document.setData(from: todo)
    }
    
    static func fetchTodos() async throws -> [Todo] {
        let snapshot = try await todosReference.getDocuments()
        let todos = snapshot.documents.map { document in
            try! document.data(as: Todo.self)
        }
        return todos
    }
}

private extension FirebaseFirestore.DocumentReference {
    // reference: github.com/firebase/firebase-ios-sdk/issues/9157
    func setData<T: Encodable>(from: T, merge: Bool = false) async throws {
        let encoder = Firestore.Encoder()
        let data = try encoder.encode(from)
        try await setData(data, merge: merge)
    }
}
