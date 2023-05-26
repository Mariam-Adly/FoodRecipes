//
//  Ingredients.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
class Ingredient : Codable{
    var display_name: String?
    var type: String?
    enum CodingKeys: String, CodingKey {
        case display_name = "displayName"
        case type
    }
}
