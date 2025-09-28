//
//  UserViewModel.swift
//  todoApp
//
//  Created by Kerem Saltık on 17.09.2025.
//

import Foundation


/// A viewModel that manages the logic for the user login process.
///
/// This class, authenticates the user via UserService and starts a usre session upon a successfull login.


class LoginViewModel{
    
    // MARK: - Variables
    private let userService = UserService.shared
    
    // MARK: - Functions
    
    /// Verifies the user with a given email and password.
    ///
    /// If process is succesful, it saves the user to the 'SessionManager' and returns a 'UserModel' object.
    /// If process is unsuccessful or parameters are nill, it returns 'nil'.
    /// - Parameters:
    ///     - mail: The email address entered by the user.
    ///     - password: The password entered by the user.
    /// - Returns: The 'UserModel' object on a successful login; otherwise, 'nil'
    func loginUser(mail: String?, password: String?) -> UserModel? {
           guard let mail = mail, let password = password else { return nil }
           
        // If the user is successfully authorized, register them with the SssionManager to start a session for the entire app.
            if let user = userService.login(mail: mail, password: password) {
                SessionManager.shared.login(user: user)
                return user
        }
           
     return nil
       }
}
