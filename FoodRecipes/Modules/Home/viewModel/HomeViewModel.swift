//
//  HomeViewModel.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
class HomeVieModel{
    var mealsForCtegory = [Meal]()
    var bindedMealResult : (()->()) = {}
    let network = Network()
    let categories: [Category] = [Category(name: "Popular", image: "fire",isSelected: true),Category(name: "Breakfast", image: "breakfast"),Category(name: "Lunch", image: "lunch-box"),Category(name: "Dinner", image: "dinner"),Category(name: "Dessert", image: "cake")]
    
    func getHomeMealsByCategory(category:String,complitionHandler: @escaping ()-> Void){
        network.getMealsFromApi(url: "\(Constant.baseUrl)\(category)") { meals, error in
            if let meals = meals{
                self.mealsForCtegory = meals
         
                complitionHandler()
                DispatchQueue.main.async {
                    self.bindedMealResult()
                }
            }
        }
    }
    //
    func getMealByIndex(index:Int) -> Meal{
         mealsForCtegory[index]
    }

    // MARK:
    func getMealsCount()->Int {
         mealsForCtegory.count
    }

    // MARK: - Get categories count
    func getCategoriesCount() -> Int {
        categories.count
    }

    // MARK: - Returns category
    func getCategory(index:Int) -> Category {
     categories[index]
    }
    
    func checkIfItemSelected(index:Int)
    {
       for category in categories
        {
           category.isSelected = false
       
       }
        categories[index].isSelected = true
    }
    
    
    func resetTableView()
    {
        mealsForCtegory = []
    }
}
