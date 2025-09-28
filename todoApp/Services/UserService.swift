//
//  UserService.swift
//  todoApp
//
//  Created by Kerem Saltık on 27.09.2025.
//

import Foundation

/// A singleton service class that manages all data operations related to users.
///
/// This class is responsible for user authentication.
/// It currently uses a hardcoded, in-memory array for user data.
class UserService{
    
    // MARK: - Singleton Instance
        
    /// The shared singleton instance of the service.
    static let shared = UserService()
    
    // MARK: - Properties
        
    /// The in-memory array acting as the user database.
    /// It is initialized with a single demo user.
    private var users: [UserModel] = [UserModel(id: 0, mail: "keremsaltikbusiness@gmail.com", password: "1234")]
    
    /// The private initializer to enforce the singleton pattern.
    private init() {}
    
    // MARK: - Public Methods
        
    /// Attempts to authenticate a user with a given email and password.
    ///
    /// It searches the `users` array for a matching record. This is a simple, insecure
    /// method intended for demonstration purposes only.
    ///
    /// - Parameters:
    ///   - mail: The user's email to check.
    ///   - password: The user's password to check.
    /// - Returns: The authenticated `UserModel` if a match is found; otherwise, `nil`.
    func login(mail: String, password: String) -> UserModel?{
        let foundUser = users.first(where: { $0.mail == mail && $0.password == password})
        return foundUser
    }
}
