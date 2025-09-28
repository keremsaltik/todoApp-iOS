//
//  HomeViewModelTests.swift
//  todoAppTests
//
//  Created by Kerem Saltık on 28.09.2025.
//

import Testing
@testable import todoApp


struct HomeViewModelTests {

    let viewModel = HomeViewModel()
    @Test
        func deleteTodo_whenTodoExists_shouldRemoveItFromList() throws {
            // Given
            // We know that there are 2 demo todos at the beginning.
            viewModel.getTodos()
            let initialCount = viewModel.numberOfTodos
            #expect(initialCount == 2)
            
            // When
            // Let's try deleting the first todo (index 0).
            let indexPathToDelete = 0
            viewModel.deleteTodo(at: indexPathToDelete)
            
            // Then
            // We would expect the number of elements to decrease to 1.
            #expect(viewModel.numberOfTodos == initialCount - 1)
        }

    @Test
        func toggleTodoCompletion_shouldChangeIsCompletedStatus() throws {
            // Given
            viewModel.getTodos()
            let indexPathToToggle = 0
            let initialStatus = viewModel.todos[indexPathToToggle].isCompleted
            
            // When
            viewModel.toggleTodoCompletion(at: indexPathToToggle)
            
            // Then
            let newStatus = viewModel.todos[indexPathToToggle].isCompleted
            // We would expect the new state to be the exact opposite of the previous state.
            #expect(newStatus != initialStatus)
        }
}
