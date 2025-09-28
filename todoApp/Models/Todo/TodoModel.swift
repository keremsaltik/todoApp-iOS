//
//  To-DoModel.swift
//  todoApp
//
//  Created by Kerem Saltık on 17.09.2025.
//

import Foundation

/// Represents a single to-do item within the application.
struct TodoModel{
    var id: Int
    var title: String
    var description: String
    var startDate: Date
    var endDate: Date?
    var isCompleted: Bool
    let user: UserModel
}

