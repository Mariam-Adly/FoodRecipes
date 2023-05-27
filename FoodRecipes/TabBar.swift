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
           setupVCs()
            setTabBarCornerRadius()
        ChangeHeightOfTabbar()
       
        setupTabBarColors()
       
    
        
    }
    

    fileprivate func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
//           navController.navigationBar.prefersLargeTitles = true
           rootViewController.navigationItem.title = title
           return navController
       }
    
    func setupVCs() {
           viewControllers = [
            createNavController(for: DetailsViewController(nibName: "DetailsViewController", bundle: nil), title: "", image: UIImage(named: "homeSelcted")!),
               createNavController(for: HomeViewController(nibName: "HomeViewController", bundle: nil)  ,title: NSLocalizedString("", comment: ""), image: UIImage(named: "homeSelcted")!),
               createNavController(for: FavoriteViewController(nibName: "FavoriteViewController", bundle: nil) , title: NSLocalizedString("", comment: ""), image: UIImage(named: "favUnSelected" )!),
             
           ]
       }
    func setTabBarCornerRadius(){
      tabBar.layer.masksToBounds = true
       tabBar.isTranslucent = true
      tabBar.layer.cornerRadius = 15
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
    }
    func ChangeHeightOfTabbar(){
  
      if UIDevice().userInterfaceIdiom == .phone {
          var tabFrame = tabBar.frame
          tabFrame.size.height = 300
          tabFrame.origin.y  = view.frame.size.height - 0
          tabBar.frame = tabFrame
      }
  
     }
     
    func setupTabBarColors(){
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.unselectedItemTintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1)
        tabBar.tintColor = UIColor(red: 217/255, green: 150/255, blue: 81/255, alpha: 1)
        
    }
    
}



