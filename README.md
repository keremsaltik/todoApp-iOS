TodoApp - An iOS Application
This is a simple to-do list application for iOS. I created this project to practice and learn important concepts in modern iOS development. The app allows users to log in, manage their tasks, and track their to-dos.

Features
User Login: A basic login system to authenticate the user.
Create To-dos: Users can add new tasks with a title, description, and dates.
Update To-dos: Users can edit the details of an existing task.
Delete To-dos: Users can delete tasks by swiping them from the list.
Complete To-dos: Users can mark a task as complete by tapping a button, which updates the UI.
Architecture and Technologies Used
This project is built using the MVVM (Model-View-ViewModel) architecture to separate the user interface from the business logic.

MVVM Architecture: The project is organized into Models, Views, and ViewModels. This makes the code cleaner, easier to manage, and testable.
Singleton Pattern: Used for TodoService, UserService, and SessionManager to ensure there is only one instance of these managers in the app.
Delegate Pattern: Used to communicate from the UpdateTodoViewController back to the HomeViewController after a task is updated.
Closures (Callbacks): Used for handling button taps in custom UI elements like CustomButton and TaskItemViewCell, creating a clean way to communicate events.
Unit Testing (Swift Testing): I wrote unit tests for the LoginViewModel and HomeViewModel to check if the logic works correctly. This was done using Apple's new Swift Testing framework.
Programmatic UI: The entire user interface is built with code using Auto Layout. No Storyboards or XIB files were used.
Custom UI Components: I created reusable UI elements like CustomButton, CustomTextField, and TaskItemView to have a consistent design across the app.
Screenshots
(Here you can add screenshots of your Login screen, Home screen, and New To-do screen. This makes your project look very professional!)

Login Screen	Home Screen	New Task Screen
(Add your login_screen.png here)	(Add your home_screen.png here)	(Add your new_task_screen.png here)
How to Run
Clone the repository to your local machine.
Open the .xcodeproj file in Xcode.
Run the project on an iOS simulator or a physical device.
