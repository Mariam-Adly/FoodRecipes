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
    func getMealsFromApi(url:String, completionHandler:@escaping([Meal]? , Error?)-> Void){
        print(url, "URL")
        AF.request(url,method: .get,headers: headers)
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
    
    func getMealDetails(mealId:Int, completionHandler:@escaping(Meal? , Error?)-> Void)
    {
        let url = "https://tasty.p.rapidapi.com/recipes/get-more-info?id=\(mealId)"
    
        AF.request(url,method: .get,headers: headers)
            .validate().response { resp in
                switch resp.result{
                case .success(let data):
                    do{
                        if let data = data{
                            let jsonData =  try JSONDecoder().decode(Meal.self, from: data)
                       
                                completionHandler(jsonData,nil)
                            
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
    
    func getSimillarMeals (mealId:Int, completionHandler:@escaping([Meal]? , Error?)-> Void)
    {
        print("ro7t")
        let url = "https://tasty.p.rapidapi.com/recipes/list-similarities?recipe_id=\(mealId)"
    
        AF.request(url,method: .get,headers: headers)
            .validate().response { resp in
                switch resp.result{
                case .success(let data):
                    do{
                        if let data = data{
                            let jsonData =  try JSONDecoder().decode(MealModel.self, from: data)
            
                            completionHandler(jsonData.results,nil)
                            
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

