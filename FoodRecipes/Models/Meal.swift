//
//  Meal.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
class Meal: Decodable{
    let name:String?
    let id:Int?
    let num_servings:Int?
    var thumbnail_url: String?
    var video_url : String?
    var sections: [Section]?
    var instructions: [Instruction]?
 
//    enum CodingKeys: String, CodingKey {
//            case name = "name"
//            case show_id = "mealId"
//            case thumbnail_url = "mealImageUrl"
//            case num_servings = "numberServing"
//            case video_url = "VideoUrl"
//        
//       }
    
}





