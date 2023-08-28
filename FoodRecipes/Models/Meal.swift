//
//  Meal.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
import SDWebImage

class Meal:Codable{
    let name:String?
    let mealId:Int?
    let numberServing:Int?
    var credits : [credit]?
    var mealImageUrl: String?
    var videoUrl : String?
    var instructions: [Instruction]?
    var tags: [Ingredient]?
   // var isFav: Bool?
    enum CodingKeys: String, CodingKey {
            case name
            case mealId = "id"
            case mealImageUrl = "thumbnail_url"
            case numberServing = "num_servings"
            case credits
            case videoUrl = "video_url"
            case instructions
            case tags 
       }
    
    init(name: String?, mealId: Int?, numberServing: Int?, credits: [credit]? = nil, mealImageUrl: String? = nil, videoUrl: String? = nil, instructions: [Instruction]? = nil, tags: [Ingredient]? = nil) {
        self.name = name
        self.mealId = mealId
        self.numberServing = numberServing
        self.credits = credits
        self.mealImageUrl = mealImageUrl
        self.videoUrl = videoUrl
        self.instructions = instructions
        self.tags = tags
        
    }
}
