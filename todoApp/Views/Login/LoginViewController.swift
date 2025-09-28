//
//  LoginView.swift
//  todoApp
//
//  Created by Kerem Saltık on 17.09.2025.
//

import Foundation
import UIKit

/// The initial screen of the application, responsible for handling user authentication.
///
/// This ViewController collects user credentials, passes them to the `LoginViewModel` for validation,
/// and on a successful login, transitions the user to the main part of the app (`CustomTabBarController`).
class LoginViewController: UIViewController{
    
    // MARK: - Properties
    private let loginViewModel = LoginViewModel()
    
    // MARK: - UI Elements
    lazy var mailTextField = CustomTextField(placeHolderText: "name@example.com")
    lazy var passwordTextField = CustomTextField(placeHolderText: "Password",isSecureText: true)
    lazy var welcomeBackTitle = CustomTitle(text: "Welcome Back!")
    lazy var subTitleText = CustomSubTitle(text: "Your work faster and structured with Todyapp")
    lazy var mailAddressLabel = CustomFormLabel(text: "Email Address")
    
    lazy var loginButton = CustomButton(text: "Login")
    
    // Note: This stack view is defined but not currently used in the layout.
    // It could be used in the future to simplify the layout code.
    lazy var welcomeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [welcomeBackTitle,subTitleText, mailAddressLabel,mailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 30.0
        return stackView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        wireActions()
    }
    
    // MARK: - UI Setup
    func setupUI(){
        configureWithExtension()
        view.backgroundColor = .systemBackground
    }
    
    /// Sets up the layout constraints for all UI elements.
    func configureWithExtension(){
        view.addSubviewsFromExt(welcomeBackTitle,subTitleText, mailAddressLabel,mailTextField, passwordTextField, loginButton)
        let standartPadding: CGFloat = 20
        welcomeBackTitle.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 105, paddingRight: 105)
        subTitleText.anchor(top: welcomeBackTitle.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 56, paddingRight: standartPadding)
        mailAddressLabel.anchor(top: subTitleText.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 48, paddingLeft: 24, paddingRight: 253)
        mailTextField.anchor(top: mailAddressLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 24, paddingRight: 24, height: 56)
        passwordTextField.anchor(top: mailTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: standartPadding, paddingLeft: 24, paddingRight: standartPadding, height: 56)
        loginButton.anchor(top: passwordTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 375, paddingLeft: standartPadding, paddingRight: standartPadding, height: 50)
    }
    
    // MARK: - Actions
    /// Wires up the actions for the UI elements, such as button taps.
    private func wireActions() {
        loginButton.onTap = { [weak self] in
            guard let self = self else { return }
            
            // Pass the credentials to the ViewModel for authentication.
            let user = self.loginViewModel.loginUser(
                mail: self.mailTextField.text,
                password: self.passwordTextField.text
            )
            
            // Based on the result, either transition to the main app or show an error.
            if user != nil {
                self.transitionToMainApp()
            } else {
                // On failure, inform the user.
                // TODO: Implement a user-facing alert for login failure.
                print("Başarısız: Kullanıcı adı veya şifre hatalı.")
                
            }
        }
        
    }
    
    // MARK: - Navigation
        
        /// Transitions the root view controller of the window to the `CustomTabBarController`.
        private func transitionToMainApp() {
            print("Login Successful!")
            let tabBarController = CustomTabBarController()
            
            // Find the current window and replace its rootViewController.
            // This provides a clean transition without stacking view controllers.
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate,
               let window = sceneDelegate.window {
                
                window.rootViewController = tabBarController
                UIView.transition(with: window,
                                  duration: 0.3,
                                  options: .transitionCrossDissolve,
                                  animations: nil,
                                  completion: nil)
            }
        }
}
#Preview{
    let view = LoginViewController()
    view.title = "Login"
    return view
}

