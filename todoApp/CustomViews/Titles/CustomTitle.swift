//
//  CustomTitle.swift
//  todoApp
//
//  Created by Kerem Saltık on 18.09.2025.
//

import UIKit
/// A reusable, styled `UILabel` for displaying main screen titles (e.g., "Welcome Back!").
///
/// This class standardizes the appearance of all primary titles in the app, ensuring they
/// share a consistent font size, weight, and color.
class CustomTitle: UILabel {
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// A convenience initializer to create a title label directly with its text.
    /// - Parameter text: The title text to be displayed.
    convenience init(text: String?) {
        self.init(frame: .zero)
        setText(text: text)
    }
    
    // MARK: - Configuration
    /// Sets the default visual appearance for the title label.
    private func configureLabel(){

        textColor = .label
        font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private func setText(text: String? = nil){
        attributedText = NSAttributedString(string: text ?? "")
    }
}

