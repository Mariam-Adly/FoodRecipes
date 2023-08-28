//
//  Instruction.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
class Instruction : Codable{
    var displayText: String?
    enum CodingKeys: String, CodingKey {
        case displayText =  "display_text"
    }
}
