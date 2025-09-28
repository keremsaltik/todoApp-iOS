//
//  UpdateTodoViewController.swift
//  todoApp
//
//  Created by Kerem Saltık on 24.09.2025.
//

import UIKit

/// A delegate protocol to notify a listener (e.g., `HomeViewController`) that a to-do item
/// has been successfully updated, so the list can be refreshed.
protocol UpdateTodoDelegate: AnyObject{
    /// Notifies the delegate that the data was updated.
    func didUpdateData()
}

/// A screen that allows the user to edit the details of an existing to-do item.
///
/// It is initialized with a specific `TodoModel`, populates its fields with the existing data,
/// and uses the `UpdateTodoViewModel` to validate and persist the changes.
class UpdateTodoViewController: UIViewController {
    
    // MARK: - Properties
    weak var delegate: UpdateTodoDelegate?
    
    /// The ViewModel responsible for handling the update logic.
    let updateToDoViewmodel: UpdateTodoViewModel
    
    // MARK: - UI Elements
    lazy var titleTextField = CustomTextField(placeHolderText: "eg: Meeting with client")
    lazy var descriptionTextField = CustomTextField(placeHolderText: "Description")
    lazy var dateAndTimeText = CustomTitle(text: "Date&Time")
    lazy var startDateText = CustomSubTitle(text: "Start Date")
    lazy var startDatePicker = CustomDatePicker()
    lazy var endDateText = CustomSubTitle(text: "End Date")
    lazy var endDatePicker = CustomDatePicker()
    lazy var saveButton = CustomButton(text: "Save")
    
    // MARK: - Initializer
    
    /// Creates and initializes the view controller with a specific to-do item to be edited.
    /// This is the designated initializer for this class.
    /// - Parameter todo: The `TodoModel` that will be edited.
    init(todo: TodoModel) {
        self.updateToDoViewmodel = UpdateTodoViewModel(todo: todo)
        super.init(nibName: nil, bundle: nil)
    }
    
    /// This initializer is required by UIKit but is not supported for this view controller.
    /// Attempting to use it will result in a fatal error.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        saveButtonTapped()
        
    }
    
    // MARK: - UI Setup
    func setupUI(){
        view.backgroundColor = .systemBackground
        configureUIElements()
        populateFieldsWithInitialData()
        
    }
    
    /// Populates the text fields and date pickers with the data from the ViewModel's `todo` property.
    private func populateFieldsWithInitialData(){
        titleTextField.text = updateToDoViewmodel.todo.title
        descriptionTextField.text = updateToDoViewmodel.todo.description
        startDatePicker.date = updateToDoViewmodel.todo.startDate
        endDatePicker.date = updateToDoViewmodel.todo.endDate ?? .now
    }
    
    func configureUIElements(){
        view.addSubviewsFromExt(titleTextField,descriptionTextField, dateAndTimeText, startDateText,startDatePicker, endDateText, endDatePicker, saveButton)
        titleTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30)
        descriptionTextField.anchor(top: titleTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingRight: 30)
        dateAndTimeText.anchor(top: descriptionTextField.bottomAnchor ,left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 30, paddingRight: 30, height: 50)
        startDateText.anchor(top: dateAndTimeText.bottomAnchor, left: view.leftAnchor, paddingLeft: 30)
        startDatePicker.anchor(top: startDateText.bottomAnchor, left: view.leftAnchor, paddingTop: 10 ,paddingLeft: 30)
        endDateText.anchor(top: startDatePicker.bottomAnchor,left: view.leftAnchor, paddingTop: 15, paddingLeft: 30 )
        endDatePicker.anchor(top: endDateText.bottomAnchor, left: view.leftAnchor, paddingTop: 10 ,paddingLeft: 30)
        saveButton.anchor(left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 30, paddingRight: 30,height: 55)
    }
    
    
    // MARK: - Actions
    
    /// Wires up the tap action for the save button.
    func saveButtonTapped() {
        // Bu fonksiyonun tek görevi, butona basıldığında ne olacağını tanımlamaktır.
        saveButton.onTap = { [weak self] in
            guard let self = self else { return }
            
            // Pass the current UI values to the ViewModel to perform the update.
            self.updateToDoViewmodel.update(
                newTitle: self.titleTextField.text,
                newDescription: self.descriptionTextField.text,
                newStartDate: self.startDatePicker.date,
                newEndDate: self.endDatePicker.date
            ) { result in
                // Handle the result from the ViewModel on the main thread.
                DispatchQueue.main.async {
                    switch result {
                    case .success:
                        // On success, notify the delegate and pop back to the previous screen.
                        self.delegate?.didUpdateData()
                        self.navigationController?.popViewController(animated: true)
                        
                    case .validationFailure(let reason), .updateFailure(let reason):
                        // On any failure, show an alert with the reason provided by the ViewModel.
                        let alert = UIAlertController(title: "Hata", message: reason, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Tamam", style: .default))
                        self.present(alert, animated: true)
                    }
                }
            }
        }
    }
    
    
}

#Preview{
    let screen = NewTodoViewController()
    return screen
}
