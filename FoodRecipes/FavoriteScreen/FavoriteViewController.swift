//
//  FavoriteViewController.swift
//  FoodRecipes
//
//  Created by mariam adly on 26/05/2023.
//

import UIKit

class FavoriteViewController: UIViewController{

    @IBOutlet weak var favoriteTableView: UITableView!
    var favoritesMeals : [cell]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        favoriteTableView.dataSource = self
        favoriteTableView.dataSource = self
        
        
        favoriteTableView.register(UINib(nibName: "CategoriesCellTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
        
        favoritesMeals = [cell(mealName: "chicken meal", mealChef: "by ahmed ali", foodType: "food french", rate: 4),cell(mealName: "meat meal", mealChef: "by ahmed hassan", foodType: "test food", rate: 5)]
        
    }
    
}




extension FavoriteViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
//        
//    }
}

extension FavoriteViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesMeals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! CategoriesCellTableViewCell
        let data = favoritesMeals![indexPath.row]
//        cell.setUpCell(mealName: data.mealName, chefName: data.mealChef, foodType: data.foodType, foodRate: data.rate, data)
        return cell
    }

}

struct cell{
    var mealName : String
    var mealChef : String
    var foodType : String
    var rate : Int
}
