//
//  TodoListViewModel.swift
//  SUnitTestAutomation
//
//  Created by YML on 31/07/23.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published private(set) var todos: [TodoModel] = []
    @Published var newTodoTitle = ""
    
    private let provider = TodosProvider()
    
    init() {
        todos = provider.fetchTodos()
    }

    func addTodo() {
        let newTodo = TodoModel(title: newTodoTitle)
        todos.append(newTodo)
        provider.saveTodos(todos)
        newTodoTitle = ""
    }
    
    func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        provider.saveTodos(todos)
    }
    
    func updateCompletedStatus(for todo: TodoModel) {
        if let index = todos.firstIndex(of: todo) {
            let currentStatus = todos[index].completed
            todos[index].completed = !currentStatus
            provider.saveTodos(todos)
        }
    }
}
