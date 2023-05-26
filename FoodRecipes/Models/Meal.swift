//
//  Meal.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
class Meal:Codable{
    let name:String?
    let show_id:Int?
    let num_servings:Int?
    var  credits : [credit]?
    var thumbnail_url: String?
    var video_url : String?
    var instructions: [Instruction]?
    var tags: [Ingredient]
    enum CodingKeys: String, CodingKey {
            case name
            case show_id = "mealId"
            case thumbnail_url = "mealImageUrl"
            case num_servings = "numberServing"
            case credits
            case video_url = "VideoUrl"
            case instructions
            case tags 
       }
}
