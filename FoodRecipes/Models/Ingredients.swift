//
//  Ingredients.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
class Ingredient : Codable{
    var displayName: String?
    var type: String?
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case type
    }
}
