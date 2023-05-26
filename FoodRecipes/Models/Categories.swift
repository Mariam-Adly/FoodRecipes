//
//  Categories.swift
//  FoodRecipes
//
//  Created by Yousra Mamdouh Ali on 26/05/2023.
//

import UIKit

class Category {
    var name:String?
    var image:String?
    var isSelected:Bool?
    
    init(name:String, image:String, isSelected:Bool=false)
      {
          self.image = image
          self.isSelected = false
          self.name = name
      }
}
