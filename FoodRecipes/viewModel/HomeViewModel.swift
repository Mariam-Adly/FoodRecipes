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
    
    func getHomeMealsByCategory(category:String){
        network.getMealsFromApi(url: "\(Constant.baseUrl)\(category)") { meals, error in
            if let meals = meals{
                self.mealsForCtegory = meals
                DispatchQueue.main.async {
                    self.bindedMealResult()
                }
            }
        }
    }
    
    func getMealByIndex(index:Int)->Meal{
        
        return mealsForCtegory[index]
        
    }
    func getMealsCount()->Int
    {
        return mealsForCtegory.count
    }
}
