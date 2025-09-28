//
//  CustomTextField.swift
//  todoApp
//
//  Created by Kerem Saltık on 17.09.2025.
//

import UIKit

/// A reusable, styled `UITextField` for consistent form inputs throughout the app.
///
/// This class provides a standardized appearance for text fields, including border style
/// and text color. It offers a convenience initializer to easily set a placeholder,

/// secure text entry status, and an initial text value.
class CustomTextField: UITextField {
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// A convenience initializer to create and configure the text field in a single line.
    /// - Parameters:
    ///   - placeHolderText: The placeholder text to display when the field is empty.
    ///   - isSecureText: A boolean indicating whether the text should be obscured (for passwords). Defaults to `false`.
    ///   - text: An optional initial text value for the field.
    convenience init(placeHolderText: String? = nil,isSecureText: Bool? = nil, text: String? = nil) {
        self.init(frame: .zero)
        set(placeHolderText: placeHolderText,isSecureText: isSecureText ?? false, text: text)
        
    }
    
    // MARK: - Configuration
    /// Sets the default visual appearance and properties for the text field.
    private func configure(){
        textColor = .lightGray
        borderStyle = .roundedRect
        keyboardType = .emailAddress
    }
    
    private func set(placeHolderText: String? = nil,isSecureText: Bool, text: String? = nil){
        placeholder = placeHolderText
        isSecureTextEntry = isSecureText
        self.text = text ?? ""
    }
}
