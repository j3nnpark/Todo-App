//
//  TodoApp.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-09.
//

import SwiftUI
import Firebase

@main
struct TodoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}
