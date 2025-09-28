//
//  TodoService.swift
//  todoApp
//
//  Created by Kerem Saltık on 24.09.2025.
//

import Foundation

/// A singleton service class that manages all data operations for to-do items.
///
/// This class acts as the single source of truth for the `TodoModel` data.
/// It currently uses an in-memory array for storage, meaning data is reset when the app closes.

class TodoService{
    
    // MARK: - Singleton Instance
       
    /// The shared singleton instance of the service.
    static let shared = TodoService()
    
    // MARK: - Properties
        
    /// The in-memory array acting as the data source for to-do items.
    /// It is initialized with some demo data.
    private var todos: [TodoModel] = [
        TodoModel(id: 0,title: "Demo", description: "It is a demo to do", startDate: Date(), isCompleted: false, user: UserModel(id: 0,mail: "keremsaltikbusiness@gmail.com", password: "1234")),
        TodoModel(id: 1,title: "Demo", description: "It is a demo to do", startDate: Date(), isCompleted: false, user: UserModel(id: 0,mail: "keremsaltikbusiness@gmail.com", password: "1234"))]
    
    /// The private initializer to enforce the singleton pattern.
    private init() {}
    
    // MARK: - Public CRUD Methods
        
    /// Fetches all to-do items from the data source.
    /// - Returns: An array of `TodoModel` objects.
    func getTodos() -> [TodoModel]{
        return todos
    }
    
    /// Finds a specific to-do item by its unique ID.
    /// - Parameter id: The ID of the to-do to find.
    /// - Returns: The found `TodoModel` or `nil` if it doesn't exist.
    func getTodobyId(id: Int) -> TodoModel?{
        return todos.first(where: { $0.id == id})
    }
    
    /// Creates and adds a new to-do item to the data source for the currently logged-in user.
    /// - Parameters:
    ///   - title: The title of the new to-do.
    ///   - description: The description of the new to-do.
    ///   - startDate: The start date of the new to-do.
    ///   - endDate: The end date of the new to-do.
    func addTodo(title: String, description: String, startDate: Date, endDate: Date){
        guard let currentUser = SessionManager.shared.currentUser else {
                    print("HATA: Todo eklemek için bir kullanıcı giriş yapmalıdır!")
                    return
                }
        // Generate a new unique ID.
        let newId = (todos.last?.id ?? -1) + 1
        let newTodo = TodoModel(id: newId,title: title, description: description, startDate: startDate, endDate: endDate, isCompleted: false, user: currentUser)
        todos.append(newTodo)
    }
    
    /// Updates an existing to-do item with new data.
    /// - Parameters:
    ///   - id: The ID of the to-do to update.
    ///   - title: The new title.
    ///   - description: The new description.
    ///   - startDate: The new start date.
    ///   - endDate: The new end date.
    ///   - isCompleted: The new completion status.
    /// - Returns: `true` if the update was successful, `false` if the to-do was not found.
    func updateTodo(id: Int,title: String, description: String, startDate: Date, endDate: Date, isCompleted: Bool) -> Bool{
        if let index = todos.firstIndex(where: {$0.id == id}){
            todos[index].title = title
            todos[index].description = description
            todos[index].startDate = startDate
            todos[index].endDate = endDate
            todos[index].isCompleted = isCompleted
            return true
        }else{
            return false
        }
    }
    
    /// Deletes a to-do item from the data source based on its ID.
    /// - Parameter id: The ID of the to-do to delete.
    func deleteTodo(id: Int){
        todos.removeAll {$0.id == id}
    }
}
