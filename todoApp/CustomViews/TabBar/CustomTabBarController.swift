//
//  CustomTabBarController.swift
//  todoApp
//
//  Created by Kerem Saltık on 25.09.2025.
//

import UIKit
/// The main TabBarController for the application.
///
/// This class is set as the `rootViewController` after a successful login and is responsible
/// for creating and managing the main screens (tabs) of the app, such as the home screen and the new to-do screen.
class CustomTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
    
    // MARK: - Configuration
        
    /// Creates and configures all the view controllers that will be displayed in the tab bar.
    private func configureTabs(){
        let firstVC = UINavigationController(rootViewController: HomeViewController())
        firstVC.viewControllers.first?.title = "Home"
        
        let secondVC = UINavigationController(rootViewController: NewTodoViewController())
        secondVC.viewControllers.first?.title = "New Todo"
        
        // Boş sayfalar (şimdilik işlevsiz)
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .white
        
        let fourthVC = UIViewController()
        fourthVC.view.backgroundColor = .white
        
        let fifthVC = UIViewController()
        fifthVC.view.backgroundColor = .white
        
        firstVC.tabBarItem = UITabBarItem(title: nil, image: .home, tag: 0)
        thirdVC.tabBarItem = UITabBarItem(title: nil, image: .inbox, tag: 1)
        fourthVC.tabBarItem = UITabBarItem(title: nil, image: .calendar, tag: 2)
        fifthVC.tabBarItem = UITabBarItem(title: nil, image: .category, tag: 3)
        secondVC.tabBarItem = UITabBarItem(title: nil, image: .paperPlus, tag: 4)
        
        
        viewControllers = [firstVC, thirdVC, fourthVC, fifthVC, secondVC]
        
        tabBar.tintColor = UIColor(red: 36/255.0, green: 161/255.0, blue: 156/255.0, alpha: 1.0)
        
        
    }
    
}
