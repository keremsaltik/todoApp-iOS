//
//  SessionManager.swift
//  todoApp
//
//  Created by Kerem Saltık on 27.09.2025.
//

import Foundation

/// A singleton class responsible for managing the user's session state throughout the app.
///
/// This manager acts as the single source of truth for determining who is currently logged in.
/// It holds a reference to the `currentUser` and provides methods to log in and log out.
class SessionManager{
    
    // MARK: - Singleton Instance
    
    /// The shared singleton instance of the session manager.
    static let shared = SessionManager()
    
    // MARK: - Properties
    
    /// The currently authenticated user. This property is `nil` if no user is logged in.
    /// The `private(set)` access control means only the `SessionManager` can change the current user,
    /// but any part of the app can read it.
    private(set) var currentUser: UserModel?
    
    /// The private initializer to enforce the singleton pattern.
    private init(){}
    
    // MARK: - Public Methods
    
    /// Establishes a new session by setting the current user.
    /// This should be called after a successful authentication.
    /// - Parameter user: The `UserModel` of the user who has just logged in.
    func login(user: UserModel) {
        self.currentUser = user
        print("Session started for usre: \(user.mail)") // For debugging purposes
    }
    
    /// Clears the current session by setting the current user to nil.
    /// This should be called when the user logs out.
    func logout() {
        if let user = currentUser {
            print("Session ended for user: \(user.mail)") // For debugging purposes
        }
        self.currentUser = nil
    }
}
