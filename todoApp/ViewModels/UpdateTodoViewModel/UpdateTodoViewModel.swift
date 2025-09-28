//
//  UpdateTodoViewModel.swift
//  todoApp
//
//  Created by Kerem Saltık on 27.09.2025.
//

import Foundation

/// An enumeration representing the possible outcomes of a to-do update operation.
enum UpdateResult {
    
    /// The update was successful.
    case success
    
    /// The update failed because user input was invalid.
    /// - Parameter reason: A string explaining why the validation failed.
    case validationFailure(reason: String)
    
    /// The update failed at the service layer (e.g., the item could not be found).
    /// - Parameter reason: A string explaining why the update failed.
    case updateFailure(reason: String)
}

/// A ViewModel that handles the logic for updating an existing to-do item.
///
/// It is initialized with a specific `TodoModel` and is responsible for validating the new data
/// and communicating with the `TodoService` to persist the changes.
class UpdateTodoViewModel{
    
    // MARK: - Properties
    private let todoService = TodoService.shared
    
    /// The to-do item that this ViewModel is responsible for updating. This is the single source of truth.
    let todo: TodoModel
    
    // MARK: -  Initializer
    
    /// Initializes the ViewModel with the to-do item that needs to be updated.
    /// - Parameter todo: The `TodoModel` to be updated.
    init(todo: TodoModel){
        self.todo = todo
    }
    
    // MARK: - Functions
    
    /// Attempts to update the to-do item with new data after validation.
        ///
        /// This method first validates that the new title and description are not empty.
        /// If validation passes, it calls the `TodoService` to perform the update.
        /// The result of the entire operation is communicated back via the completion handler.
        ///
        /// - Parameters:
        ///   - newTitle: The updated title for the to-do.
        ///   - newDescription: The updated description for the to-do.
        ///   - newStartDate: The updated start date for the to-do.
        ///   - newEndDate: The updated end date for the to-do.
        ///   - completion: A closure that is called when the operation is complete, returning an `UpdateResult`.
    func update(newTitle: String? = nil, newDescription: String? = nil, newStartDate: Date, newEndDate: Date, completion: (UpdateResult) -> Void){
        // Ensure that essential fields are not empty before proceeding.
        guard let title = newTitle, !title.isEmpty,
              let description = newDescription, !description.isEmpty else {
            completion(.validationFailure(reason: "Please fill all blanks."))
            return
        }

        // Use the service layer to apply the changes to the data source.
        let isSuccess = todoService.updateTodo(id: self.todo.id, title: title, description: description, startDate: newStartDate, endDate: newEndDate, isCompleted: todo.isCompleted)
        
        // Report back whether the service layer confirmed the update.
        if isSuccess{
            completion(.success)
            print("\(todo.id)")
        }else{
            completion(.updateFailure(reason: "Todo couldn't be updated. Please try again later."))
        }
    }
}

