//
//  ViewController.swift
//  FoodRecipes
//
//  Created by mariam adly on 26/05/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let n = Network()
        n.getMealsFromApi(url: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=breakfast") { meals, error in
            if let meals = meals{
                print(meals[0].name ?? "no meal")
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }


}

