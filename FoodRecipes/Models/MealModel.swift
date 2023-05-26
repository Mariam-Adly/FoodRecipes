//
//  MealModel.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
class MealModel:Codable{
    let count:Int?
    let results:[Meal]?
}
class Meal:Codable{
    let name:String?
    let show_id:Int?
    let num_servings:Int?
    
}
