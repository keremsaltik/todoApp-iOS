//
//  SubTitles.swift
//  todoApp
//
//  Created by Kerem Saltık on 19.09.2025.
//

import UIKit

/// A reusable, styled `UILabel` for displaying subtitles or secondary information text.
///
/// This class standardizes the appearance of all subtitles in the app, ensuring they
/// share a consistent font, color, and style.
class CustomSubTitle: UILabel {
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String? = nil) {
        self.init(frame: .zero)
        setText(text: text)
    }
    
    // MARK: - Configuration
    private func configureSubTitle(text: String? = nil){
        textColor = .gray
        font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    private func setText(text: String? = nil){
        attributedText = NSAttributedString(string: text ?? "")
    }
}
