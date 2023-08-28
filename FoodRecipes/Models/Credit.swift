//
//  Credit.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
class credit : Codable{
    var name: String?
    var type: String?
    init(name: String? = nil, type: String? = nil) {
        self.name = name
        self.type = type
    }
}
