//
//  TodosProviderTests.swift
//  SUnitTestAutomationTests
//
//  Created by YML on 31/07/23.
//

import XCTest
@testable import SUnitTestAutomation

final class TodosProviderTests: XCTestCase {
    var sut: TodosProvider!
    
    
    override func setUpWithError() throws {
        sut = TodosProvider()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testFetchTodos() throws {
        /*
         Possible outputs:
         1. Empty ToDo
         2. ToDo List
         */
        
        // Case 1: Empty ToDo
        validateFetchTodosWithEmptyList()
        
        // Case 2: ToDo List
        validateFetchTodosWithToDoList()
        
    }
    
    private func validateFetchTodosWithEmptyList() {
        // Arrange
        sut?.clearTodos()
        
        // Act
        let todoList = sut.fetchTodos()
        
        // Assert
        XCTAssertTrue(todoList.isEmpty)
    }
    
    private func validateFetchTodosWithToDoList() {
        // Arrange
        // Clear ToDos
        sut?.clearTodos()
        
        // Add an object to ToDos
        let todo = TodoModel(title: "First")
        sut?.saveTodos([todo])
        
        // Act
        let todoList = sut.fetchTodos()
        
        // Assert
        XCTAssertTrue(!todoList.isEmpty)
        XCTAssertEqual(todoList.first?.title, "First")
    }
    
    func testSaveTodos() throws {
        validateFetchTodosWithToDoList()
    }
    
    func testClearTodos() throws {
        // Arrange
        let todo = TodoModel(title: "First")
        sut?.saveTodos([todo])
        var todoList = sut.fetchTodos()
        XCTAssertTrue(!todoList.isEmpty)
        
        // Act
        sut?.clearTodos()
        
        // Assert
        todoList = sut.fetchTodos()
        XCTAssertTrue(todoList.isEmpty)
    }
}

