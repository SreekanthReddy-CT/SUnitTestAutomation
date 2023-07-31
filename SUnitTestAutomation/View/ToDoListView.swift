//
//  ToDoListView.swift
//  SUnitTestAutomation
//
//  Created by YML on 31/07/23.
//

import SwiftUI

struct ToDoListView: View {
    @ObservedObject private var viewModel = TodoListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.todos) { todo in
                    HStack {
                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(todo.completed ? .green : .gray)
                            .onTapGesture {
                                viewModel.updateCompletedStatus(for: todo)
                            }
                        Text(todo.title)
                    }
                }
                .onDelete(perform: viewModel.deleteTodo)
            }
            .padding(.vertical)
            
            HStack {
                TextField("New Todo", text: $viewModel.newTodoTitle)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                
                Button("Add") {
                    viewModel.addTodo()
                }
                .padding()
            }
            .padding()
            .background(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
