//
//  Network.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
import Alamofire

class Network{
    let headers:HTTPHeaders = [
        "X-RapidAPI-Key": "f4e14f0c71msh56b275f47a33083p1bf7d4jsn2d94b368718d",
        "X-RapidAPI-Host": "tasty.p.rapidapi.com"
    ]
    func getMealsFromApi(url:String,completionHandler:@escaping([Meal]? , Error?)-> Void){
        AF.request("https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=breakfast",method: .get,headers: headers)
            .validate().response { resp in
                switch resp.result{
                case .success(let data):
                    do{
                        if let data = data{
                            let jsonData =  try JSONDecoder().decode(MealModel.self, from: data)
                            if let results = jsonData.results{
                                completionHandler(results,nil)
                            }
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(nil,error)
                }
            }
    }
}

