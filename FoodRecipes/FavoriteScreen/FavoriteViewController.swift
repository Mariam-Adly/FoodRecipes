//
//  FavoriteViewController.swift
//  FoodRecipes
//
//  Created by mariam adly on 26/05/2023.
//

import UIKit

class FavoriteViewController: UIViewController{

    @IBOutlet weak var favoriteTableView: UITableView!
    var favoritesMeals : [Meal]?
    var viewModel : FavouriteViewModdel?
    var data : Meal?
    override func viewDidLoad() {
        super.viewDidLoad()
      
        favoriteTableView.dataSource = self
        favoriteTableView.dataSource = self
        viewModel = FavouriteViewModdel()
        
        favoriteTableView.register(UINib(nibName: "CategoriesCellTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
        
       
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.favoritesMeals = self.viewModel?.favList
            self.favoriteTableView.reloadData()
        }
        viewModel?.getFavoriteMeals()
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
         data = favoritesMeals![indexPath.row]
        cell.favBtn.tag = indexPath.row
        cell.favBtn.addTarget(self, action: #selector(removeFromFav), for: .touchUpInside)
        cell.configCell(meal: data!, isFav: true)
        return cell
    }

    @objc func removeFromFav(sender:UIButton){
        let index = IndexPath(row: sender.tag, section: 0)
        let cell = favoriteTableView.cellForRow(at: NSIndexPath(row: sender.tag, section: 0) as IndexPath) as! CategoriesCellTableViewCell
        
        if let favMeal = data {
            if viewModel?.isFavouriteMeal(meal: favMeal) == false {
                viewModel?.deleteMeal(meal: favMeal)
                cell.configCell(meal: favMeal, isFav: false)
                viewModel?.getFavoriteMeals()
                DispatchQueue.main.async {
                    self.favoritesMeals = self.viewModel?.favList
                    self.favoriteTableView.reloadData()
                }
               // cell.favBtn.setImage(UIImage(named: "Vector3"), for: UIControl.State.normal)
            }else{
                
               // cell.favBtn.setImage(UIImage(named: "Vector2"), for: UIControl.State.normal)
            }
        }
        
    }
}

