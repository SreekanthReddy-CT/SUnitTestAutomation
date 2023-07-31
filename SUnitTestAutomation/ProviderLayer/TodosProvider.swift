//
//  TodosProvider.swift
//  SUnitTestAutomation
//
//  Created by YML on 31/07/23.
//

import Foundation

struct TodosProvider {
    
    private let userDefaultsKey = "todos"
    
    func fetchTodos() -> [TodoModel] {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey),
              let todos = try? JSONDecoder().decode([TodoModel].self, from: data) else {
            return []
        }
        return todos
    }
    
    func saveTodos(_ todos: [TodoModel]) {
        if let encodedData = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
        }
    }
    
    func clearTodos() {
        UserDefaults.standard.set(nil, forKey: userDefaultsKey)
    }
}
