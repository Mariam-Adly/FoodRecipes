//
//  TabBar.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .white
           tabBar.tintColor = .label
           setupVCs()
            setTabBarCornerRadius()
        tabBar.layer.borderWidth = 2
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
      
       
    
        
    }
    

    fileprivate func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = true
           rootViewController.navigationItem.title = title
           return navController
       }
    
    func setupVCs() {
           viewControllers = [
              // createNavController(for:  , title: NSLocalizedString("", comment: ""), image: UIImage(named: "homeSelected" )!),
              // createNavController(for:   title: NSLocalizedString("", comment: ""), image: UIImage(named: "favUnSelected")!),
             //
           ]
       }
    func setTabBarCornerRadius(){
      tabBar.layer.masksToBounds = true
       tabBar.isTranslucent = true
      tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
    }
  
}
