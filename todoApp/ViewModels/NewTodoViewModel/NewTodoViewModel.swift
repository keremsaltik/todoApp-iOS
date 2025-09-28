//
//  NewTodoViewModel.swift
//  todoApp
//
//  Created by Kerem Saltık on 26.09.2025.
//

import Foundation

/// A ViewModel that handles the logic for creating a new to-do item.
///
/// It is responsible for validating user input and communicating with the TodoService to persist the new item.

class NewTodoViewModel{
    
    // MARK: - Variables
    private let todoService = TodoService.shared
    
    
    // MARK: - Functions
    
    /// Creates and saves a new to-do item after validating the input.
    ///
    /// It returns true if the input is valid and the to-do is successfully created, otherwise returns false
    /// If title and description parameters are filled, todo saved.
    /// - Parameters:
    ///     - title: The title for the new to-do, entered by user.
    ///     - description: The description for the new to-do, entered by user.
    ///     - startDate: The startDate  for the new to-do,selected by user.
    ///     - endDate: The endDate for the new to-do, selected by user
    /// - Returns: True on success, false if validation fails.
    func createToDo(title: String?, description: String?, startDate: Date, endDate: Date) -> Bool {
        guard let title = title, !title.isEmpty,
              let description = description, !description.isEmpty else {
            
            // Validate the input. The ViewModel's job is to return the result,
            return false
        }
        
        // If validation passes, create the to-do via the service and return success.
        todoService.addTodo(title: title, description: description, startDate: startDate, endDate: endDate)
        return true
    }
}
