//
//  CategoriesCellTableViewCell.swift
//  FoodRecipes
//
//  Created by mariam adly on 26/05/2023.
//

import UIKit

class CategoriesCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var foodRate: UILabel!
    @IBOutlet weak var foodType: UILabel!
    @IBOutlet weak var chefName: UILabel!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         cellView.layer.cornerRadius = 20
         cellView.layer.masksToBounds = true
        favBtn.layer.cornerRadius = 20
        favBtn.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    @IBAction func favBtnAction(_ sender: Any) {
    }
    

    func configCell(meal:Meal)
    {
        mealName.text = meal.name
        foodRate.text = String("servings:\(meal.num_servings)")
    }
}
