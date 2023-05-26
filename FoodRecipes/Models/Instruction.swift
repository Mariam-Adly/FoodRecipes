//
//  Instruction.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
class Instruction : Codable{
    var display_text: String?
    enum CodingKeys: String, CodingKey {
        case display_text = "displayText"
    }
}
