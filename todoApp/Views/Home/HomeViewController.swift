//
//  HomeView.swift
//  todoApp
//
//  Created by Kerem Saltık on 21.09.2025.
//

import UIKit

/// The main screen of the application that displays the list of to-do items.
///
/// This ViewController is responsible for setting up the UI, interacting with the `HomeViewModel`
/// to get data, and handling user interactions like tapping on a task or deleting one.
class HomeViewController: UIViewController{
    
    // MARK: - Properties
    let homeViewModel = HomeViewModel()
    
    
    let todayText = CustomTitle(text: "Today")
    let bestplatformText = CustomSubTitle(text: "Best platform for creating to-do lists")
    lazy var tableView = UITableView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Fetches the latest data and reloads the table view every time the screen appears.
            // This ensures the list is always up-to-date after adding or updating a task.
        homeViewModel.getTodos()
        tableView.reloadData()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        configureTableView()
        configureWithExtension() // Renamed for clarity
    }
    
    private func configureWithExtension(){
        view.addSubviewsFromExt(todayText, bestplatformText, tableView)
        todayText.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 24, paddingRight: 24)
        bestplatformText.anchor(top: todayText.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 24, paddingRight: 24)
        tableView.anchor(top: bestplatformText.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 16, paddingRight: 16)
        
    }
    
    /// Configures the table view's properties and registers the custom cell.
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register the custom cell for use.
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseID)
        
        // Visual adjustments for the table view.
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfTodos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as? TaskTableViewCell else {
            fatalError("Could not dequeue TaskItemViewCell")
        }
        
        let task = homeViewModel.todos[indexPath.row]
        cell.configure(with: task)
        
        // Handle the tap event on the completion button inside the cell.
        cell.onCompleteButtonTap = { [weak self] in
            guard let self = self else { return }
            
            // Tell the ViewModel to toggle the task's completion status.
            self.homeViewModel.toggleTodoCompletion(at: indexPath.row)
            
            // Reload only the affected row with an animation for a better user experience.
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // When a row is tapped, navigate to the update screen with the selected task.
        let selectedTask = homeViewModel.todos[indexPath.row]
        let updateVC = UpdateTodoViewController(todo: selectedTask)
        navigationController?.pushViewController(updateVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            // Use begin/end updates for smooth deletion animation.
            tableView.beginUpdates()
            homeViewModel.deleteTodo(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

#Preview{
    let view = HomeViewController()
    return view
}
