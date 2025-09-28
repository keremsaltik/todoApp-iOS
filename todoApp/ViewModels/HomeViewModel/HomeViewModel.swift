//
//  HomeViewModel.swift
//  todoApp
//
//  Created by Kerem Saltık on 26.09.2025.
//

import Foundation

/// A ViewModel that prepares and manages the data for the HomeScreen.
///
/// It is responsible for fetching list of to-dos, handling deletions, toggling completion status, and providing the data to the HomeViewController.


class HomeViewModel{
    
    // MARK: - Variables
    private let todoService = TodoService.shared
    
    var todos: [TodoModel] = []
    
    // MARK: - Functions
    
    /// Fetches all to-dos from the TodoService and updates the local todos array.
    func getTodos(){
        todos = todoService.getTodos()
    }
    
    /// Deletes a to-do at a specific index path.
    ///
    /// - Parameter: indexPath: The index path of the to-do to delete.
    func deleteTodo(at rowIndex: Int){
        let todoToDelete = todos[rowIndex]
        todoService.deleteTodo(id: todoToDelete.id)
        todos.remove(at: rowIndex)
    }
    
    /// The total number of to-dos currently in the list.
    var numberOfTodos: Int{
        return todos.count
    }
    
    /// Toggles the completion status of a to-do at a specific index path.
    /// - Parameter indexPath: The index path of the to-do to toggle.
    func toggleTodoCompletion(at rowIndex: Int) {
        // Safelt check if the index path is valid for the array.
        guard todos.indices.contains(rowIndex) else { return }
        
        // Create a mutable copy to modify.
        var todoToUpdate = todos[rowIndex]
        
        // Flip the boolean value (true -> false, false -> true).
        todoToUpdate.isCompleted.toggle()
        
        // SPersist the change using the service layer.
        _ = todoService.updateTodo(
            id: todoToUpdate.id,
            title: todoToUpdate.title,
            description: todoToUpdate.description,
            startDate: todoToUpdate.startDate,
            endDate: todoToUpdate.endDate ?? Date(),
            isCompleted: todoToUpdate.isCompleted
        )
        
        // Update the local array to keep the UI in sync
        self.todos[rowIndex] = todoToUpdate
    }
    
}
