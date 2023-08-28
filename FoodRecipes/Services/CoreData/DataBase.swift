//
//  DataBase.swift
//  FoodRecipes
//
//  Created by ME on 26/05/2023.
//

import Foundation
import CoreData
import UIKit

class DataBase{
    var context : NSManagedObjectContext?
    let appDelegate : AppDelegate?
    static var coreData = DataBase()
    let entity: NSEntityDescription?
    private init(){
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate?.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "FavouriteMeal", in: context!)
    }
    
    func saveMeal(meal:Meal){
    
     let mealEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        //meal.isFav = true
        mealEntity.setValue(meal.credits?[0].name, forKey: "creditName")
        mealEntity.setValue(meal.mealId, forKey: "id")
        //let image = meal.mealImageUrl?.data(using: .utf8)
        mealEntity.setValue(meal.mealImageUrl , forKey: "image")
        mealEntity.setValue(true, forKey: "isFav")
        mealEntity.setValue(meal.name, forKey: "name")
        mealEntity.setValue(meal.numberServing, forKey: "servingNumber")
        mealEntity.setValue(meal.credits?[0].type, forKey: "type")
        do{
            try context?.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    func fetchMeals()->[Meal]?{
//        let fetchReq : NSFetchRequest<FavouriteMeal> = FavouriteMeal.fetchRequest()
//        do{
//            return try context?.fetch(fetchReq)
//        }catch{
//            return nil
//        }
       var mealsArr = [Meal]()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavouriteMeal")
        do{
            let meals = try self.context?.fetch(fetchReq)
            if let meals = meals {
                meals.forEach { meal in
                    let creditName = meal.value(forKey: "creditName")
                    let creditType = meal.value(forKey: "type")
                   // let image =  UIImage(data:((meal.value(forKey: "image") as! NSData) as Data))
                    let fetchedMeal = Meal(name: meal.value(forKey: "name") as! String,
                                           mealId: meal.value(forKey: "id") as! Int,
                                           numberServing: meal.value(forKey: "servingNumber") as? Int,
                                           credits:[credit(name: creditName as! String,type: creditType as! String)],
                                           mealImageUrl: meal.value(forKey: "image")as! String)
                    
                   // let imageData = UIImage(data: meal.value(forKey: "image") as! Data)

                     mealsArr.append(fetchedMeal)
                }
            }
          }catch let error as NSError{
              print(error.localizedDescription)
        }
        return mealsArr
    }
    
    func mealIsFav(meal:Meal) -> Bool{
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteMeal")
        fetchReq.predicate = NSPredicate(format: "id == %i", meal.mealId ?? 0)
        do{
            let meal = try self.context?.fetch(fetchReq) as! [NSManagedObject]
            if let meal = meal.first{
                return meal.value(forKey: "isFav") as? Bool ?? false
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        return false
    }
    
    func deleteMeal(meal:Meal){
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavouriteMeal")
        let predicate = NSPredicate(format: "id==%i", meal.mealId ?? 0)
        fetchReq.predicate = predicate
        do{
            let meal = try self.context?.fetch(fetchReq)
            context?.delete(meal![0])
            try context?.save()
            
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
}
