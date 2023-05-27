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
        tabBar.layer.borderWidth = 2
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        setupTabBarColors()
       
    
        
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
          var tabFrame            = tabBar.frame
          tabFrame.size.height    = 150
          tabFrame.origin.y       = view.frame.size.height - 100
          tabBar.frame            = tabFrame
      }
  
     }
     // 217, 150, 81
    func setupTabBarColors(){
        tabBar.layer.borderWidth = 2
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.unselectedItemTintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1)
        /*tabBar.selectedItem?.standardAppearance?.selectionIndicatorTintColor = UIColor(red:217/255 , green: 150/255, blue: 81/255, alpha: 1)
        tabBar.selectedItem?.scrollEdgeAppearance?.selectionIndicatorTintColor = UIColor(red:217/255 , green: 150/255, blue: 81/255, alpha: 1)*/
       /* let tabBarItemSize = CGSize(width: tabBar.frame.width / 2, height: tabBar.frame.height)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color:UIColor(red:217/255 , green: 150/255, blue: 81/255, alpha: 1) ,size:  tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero))
        UIImage.imageW*/
        
    }
    func HandleActionWhenSelectItem(_ item: UITabBarItem){
       
           if item == (self.tabBar.items!)[0]{
            
           }
           else if item == (self.tabBar.items!)[1]{
         
           }
          
          }
}
