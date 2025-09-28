//
//  CustomTableViewCell.swift
//  todoApp
//
//  Created by Kerem Saltık on 22.09.2025.
//

import UIKit


/// A `UITableViewCell` that acts as a container for a `TaskItemView`.
///
/// This cell's primary responsibility is to host the `TaskItemView` and to bridge the communication
/// between the `TaskItemView` and the `HomeViewController`. It forwards the tap event from the
/// view's button up to the view controller via its own `onCompleteButtonTap` closure.
class TaskTableViewCell: UITableViewCell {
    
    // MARK: - Static Properties
    static let reuseID = "TaskTableViewCell"
    
    // MARK: - Properties
    var onCompleteButtonTap: (() -> Void)?
    // MARK: - UI Elements
    private let taskItemView = TaskItemView()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
        // 2. ZİNCİRİ KUR: TaskItemView'dan gelen haberi dinle.
        taskItemView.onStatusButtonTap = { [weak self] in
            // TaskItemView'daki butona basıldığında, bu hücre de kendi
            // "geri arama" kodunu tetikler. Böylece haber bir üst katmana iletilir.
            self?.onCompleteButtonTap?()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        // Hücrenin kendisiyle ilgili ayarlar
        selectionStyle = .none
        backgroundColor = .clear
        
        // TaskItemView'ı hücrenin contentView'ına ekliyoruz
        contentView.addSubview(taskItemView)
        taskItemView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskItemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            taskItemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            taskItemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            taskItemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    /// Configures the cell by passing the `TodoModel` data down to the `taskItemView`.
    /// - Parameter task: The `TodoModel` to be displayed.
    public func configure(with task: TodoModel) {
        taskItemView.configure(with: task)
    }
    
}
