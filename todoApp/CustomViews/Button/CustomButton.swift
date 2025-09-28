//
//  CustomButton.swift
//  todoApp
//
//  Created by Kerem Saltık on 22.09.2025.
//

import UIKit


/// A reusable, styled button used consistently throughout the application.
///
/// This class standardizes the appearance of primary action buttons, providing a
/// consistent background color, corner radius, and font style. It uses a closure (`onTap`)
/// for handling tap events, simplifying its use in ViewControllers.
class CustomButton: UIButton {
    
    // MARK: - Properties
    
    /// A closure to be executed when the button is tapped.
    /// Assign a block of code to this property to handle tap events.
    var onTap: (() -> Void)?
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Initializes a new custom button with the specified text.
    /// - Parameter text: The text to be displayed on the button.
    convenience init(text: String? = nil) {
        self.init(frame: .zero)
        setText(text: text)
    }
    
    /// Sets up the button's visual appearance, properties, and internal actions.
    func configureButton(){
        layer.cornerRadius = 16.0
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(red: 36/255.0, green: 161/255.0, blue: 156/255.0, alpha: 1)
        // Wire up the tap event to our internal action method.
        addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func setText(text: String? = nil) {
        setTitle(text, for: .normal)
    }
    
    /// The internal target action that is triggered by a tap, which in turn executes the `onTap` closure.
    @objc private func buttonTapped(_ sender: UIButton) {
        onTap?()
    }
}

