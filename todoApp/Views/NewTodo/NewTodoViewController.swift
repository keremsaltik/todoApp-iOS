//
//  NewTodoViewController.swift
//  todoApp
//
//  Created by Kerem Saltık on 23.09.2025.
//

import UIKit

/// A screen that provides a form for the user to create a new to-do item.
///
/// This ViewController collects user input for a new task, uses the `NewTodoViewModel`
/// to validate and save the data, and then navigates back to the home screen on success.
class NewTodoViewController: UIViewController {
    
    // MARK: - Properties
        
    // The ViewModel is the single point of contact for any business logic.
    let newToDoViewModel = NewTodoViewModel()
    
    // MARK: - UI Elements
    lazy var titleTextField = CustomTextField(placeHolderText: "eg: Meeting with client")
    lazy var descriptionTextField = CustomTextField(placeHolderText: "Description")
    lazy var dateAndTimeText = CustomTitle(text: "Date&Time")
    lazy var startDateText = CustomSubTitle(text: "Start Date")
    lazy var startDatePicker = CustomDatePicker(date: .now)
    lazy var endDateText = CustomSubTitle(text: "End Date")
    lazy var endDatePicker = CustomDatePicker(date: .now)
    lazy var saveButton = CustomButton(text: "Save")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupUI()
        setupDismissKeyboardGesture()
        saveButtonTapped()
    }
    
    // MARK: - UI Setup
    func setupUI(){
        view.backgroundColor = .systemBackground
        configureUIElements()
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
    func saveButtonTapped(){
        saveButton.onTap = { [weak self] in
                   guard let self = self else { return }
                   
                   // Pass the user input to the ViewModel for validation and creation.
                   let isSuccess = self.newToDoViewModel.createToDo(
                       title: self.titleTextField.text,
                       description: self.descriptionTextField.text,
                       startDate: self.startDatePicker.date,
                       endDate: self.endDatePicker.date
                   )
                   
                   // 2. Handle the result from the ViewModel.
                   if isSuccess {
                       // On success, navigate back to the home tab.
                       self.tabBarController?.selectedIndex = 0
                   } else {
                       // On failure, present an alert to the user.
                       let alert = UIAlertController(title: "Hata", message: "Lütfen tüm alanları doldurun.", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "Tamam", style: .default))
                       self.present(alert, animated: true)
                   }
               }
    }
    
    // MARK: - Private Methods
       
       /// Sets up a tap gesture to dismiss the keyboard when tapping outside the text fields.
       private func setupDismissKeyboardGesture() {
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
           self.view.addGestureRecognizer(tapGesture)
       }
       
       /// The target action for the tap gesture, which ends editing and dismisses the keyboard.
       @objc private func dismissKeyboard() {
           view.endEditing(true)
       }
    
}


