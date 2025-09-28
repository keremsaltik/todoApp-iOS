# TodoApp - An iOS Application

This is a simple to-do list application for iOS, built to practice and demonstrate key concepts in modern iOS development. The app allows users to log in, manage their tasks, and track their to-dos in a clean, programmatic UI.

## Features

-   **User Login:** A basic login system to authenticate the user.
-   **Create To-dos:** Users can add new tasks with a title, description, and dates.
-   **Update To-dos:** Users can edit the details of an existing task.
-   **Delete To-dos:** Users can delete tasks by swiping them from the list.
-   **Complete To-dos:** Users can mark a task as complete by tapping a button, which updates the UI with a strikethrough style.

## Architecture and Technologies Used

This project is built using the **MVVM (Model-View-ViewModel)** architecture to ensure a clean separation of concerns between the user interface (View), the data (Model), and the business logic (ViewModel).

-   **MVVM Architecture:** The project is organized into Models, Views, and ViewModels, making the code cleaner, easier to manage, and highly testable.
-   **Singleton Pattern:** Used for `TodoService`, `UserService`, and `SessionManager` to provide a single, globally accessible instance for managing data and session state.
-   **Delegate Pattern:** Used to communicate from the `UpdateTodoViewController` back to the `HomeViewController` after a task is successfully updated.
-   **Closures (Callbacks):** Used for handling button taps in custom UI elements like `CustomButton` and `TaskItemViewCell`, creating a clean and decoupled way to handle UI events.
-   **Unit Testing (Swift Testing):** Unit tests were written for the `LoginViewModel` and `HomeViewModel` to verify the business logic. This was done using Apple's new **Swift Testing** framework (`@Test`, `#expect`).
-   **Programmatic UI:** The entire user interface is built with code using Auto Layout constraints. No Storyboards or XIB files were used.
-   **Custom UI Components:** Reusable UI elements like `CustomButton`, `CustomTextField`, and `TaskItemView` were created to ensure a consistent design system across the app.

## Screenshots

*(You can add screenshots of your Login screen, Home screen, and New To-do screen here. This makes your project look very professional!)*

| Login Screen                                       | Home Screen                                      | New Task Screen                                      |
| :-------------------------------------------------: | :-------------------------------------------------: | :-------------------------------------------------: |
| *(ogin_screen.png)* | *(home_screen.png)* | *(new_task_screen.png)* |

## How to Run

1.  Clone the repository to your local machine.
2.  Open the `.xcodeproj` file in Xcode.
3.  Run the project on an iOS simulator or a physical device.
