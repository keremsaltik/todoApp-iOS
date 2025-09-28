//
//  CustomTableView.swift
//  todoApp
//
//  Created by Kerem Saltık on 22.09.2025.
//

import UIKit


/// A custom `UIView` that displays the content for a single to-do item.
///
/// This view is designed to be embedded within a `UITableViewCell` (`TaskItemViewCell`).
/// It handles all the layout and presentation logic for a task's title, date, and completion status.
/// It also provides a closure (`onStatusButtonTap`) to notify its parent when the status button is tapped.
class TaskItemView: UIView {
    
    // MARK: - UI Elements
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        button.setImage(UIImage(systemName: "circle", withConfiguration: config), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        // button.isUserInteractionEnabled = false // Sadece gösterim amaçlı
        return button
        
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    /// A closure that is executed when the `statusButton` is tapped.
    /// The parent view (e.g., the containing cell) is responsible for assigning a block of code to this property.
    var onStatusButtonTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        /// target-action for the status button.
        statusButton.addTarget(self, action: #selector(statusButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// The internal action method that is triggered by a tap on the status button.
        /// It executes the `onStatusButtonTap` closure.
    @objc private func statusButtonTapped() {
        // Sadece bize verilen "geri arama" kodunu çalıştır.
        onStatusButtonTap?()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(statusButton)
        containerView.addSubview(titleLabel)
        containerView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            statusButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            statusButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            statusButton.widthAnchor.constraint(equalToConstant: 30),
            statusButton.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.leadingAnchor.constraint(equalTo: statusButton.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Configuration
    /// Configures the view's UI elements with data from a `TodoModel`.
    /// - Parameter task: The `TodoModel` to be displayed.
    public func configure(with task: TodoModel) {
        let startDate = task.startDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        titleLabel.text = task.title
        dateLabel.text = dateFormatter.string(from: startDate)
        updateStatus(isCompleted: task.isCompleted)
    }
    
    /// Updates the appearance of the view based on the task's completion status.
    /// This includes changing the button icon, colors, and applying a strikethrough to the title.
    /// - Parameter isCompleted: A boolean indicating if the task is complete.
    private func updateStatus(isCompleted: Bool) {
        let symbolName = isCompleted ? "checkmark.circle.fill" : "circle"
        let symbolColor: UIColor = isCompleted ? .systemGreen : .systemGray
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        
        statusButton.setImage(UIImage(systemName: symbolName, withConfiguration: config), for: .normal)
        statusButton.tintColor = symbolColor
        
        let attributes: [NSAttributedString.Key: Any]
        if isCompleted {
            attributes = [
                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: UIColor.systemGray
            ]
            titleLabel.textColor = .systemGray
        } else {
            attributes = [:]
            titleLabel.textColor = .darkText
        }
        
        titleLabel.attributedText = NSAttributedString(string: titleLabel.text ?? "", attributes: attributes)
        containerView.backgroundColor = isCompleted ? UIColor(white: 0.98, alpha: 1.0) : .white
    }
    
}
