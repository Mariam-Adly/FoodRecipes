//
//  FavouriteViewModdel.swift
//  FoodRecipes
//
//  Created by mariam adly on 27/05/2023.
//

import Foundation
class FavouriteViewModdel{
    var bindfavListToFavouriteTableViewController : (()->()) = {}
    var favList : [Meal]?{
        didSet{
            bindfavListToFavouriteTableViewController()
        }
    }
    func getFavoriteMeals(){
        self.favList = DataBase.coreData.fetchMeals()
        
    }
    
    func deleteMeal(meal:Meal){
        DataBase.coreData.deleteMeal(meal: meal)
    }
    
    func isFavouriteMeal(meal:Meal) -> Bool {
        return DataBase.coreData.mealIsFav(meal: meal)
    }
}
