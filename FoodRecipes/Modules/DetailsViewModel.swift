//
//  DetailsViewModel.swift
//  FoodRecipes
//
//  Created by Yousra Mamdouh Ali on 27/05/2023.
//

import UIKit

class DetailsViewModel{
   let network = Network()
    var meal:Meal?
    
    var similarMeals: [Meal] = []
    

    
    
    func getMealById(mealId:Int,complitionHandler: @escaping ()-> Void)
    {
        network.getMealDetails(mealId: mealId) {
            meal , error in
            if let meal  = meal
            {
                self.meal = meal
                complitionHandler()
            }
        }
    }
    
    func getSimillarMeals(mealId:Int,complitionHandler: @escaping ()-> Void)
    {
        network.getSimillarMeals(mealId: mealId)
        {
            meals , error in
            if let similarMeals  = meals
            {
                self.similarMeals = similarMeals
                complitionHandler()
            }
        }
    }
    
    func getSimilarMealsCount()-> Int
    {
        similarMeals.count
    }
}
