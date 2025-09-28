//
//  FormLabels.swift
//  todoApp
//
//  Created by Kerem Saltık on 19.09.2025.
//

import UIKit

/// A reusable, styled `UILabel` specifically for form field titles (e.g., "Email Address").
///
/// This class ensures that all form labels across the app have a consistent
/// font, color, and appearance. It is initialized with its display text.
class CustomFormLabel: UILabel{
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String? = nil) {
        self.init(frame: .zero)
        setLabelText(text: text)
    }
    
    // MARK: - Private Configuration
    /// Sets the default visual appearance for the form label.
    private func configureLabels(){
        textColor = .black
        // TODO: Replace with custom "SF Pro Display" font when available.
        font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    func setLabelText(text: String? = nil){
        attributedText = NSAttributedString(string: text ?? "")
    }
}
