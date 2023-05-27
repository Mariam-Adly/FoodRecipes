//
//  CategoriesCellTableViewCell.swift
//  FoodRecipes
//
//  Created by mariam adly on 26/05/2023.
//

import UIKit
import SDWebImage

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
        favBtn.layer.cornerRadius = favBtn.frame.width*0.3
        favBtn.layer.masksToBounds = true
    }
    @IBOutlet weak var mealImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func setUpCell(mealName:String,chefName:String,foodType:String,foodRate:Int,image:String){
        self.mealName.text = mealName
        self.chefName.text = chefName
        self.foodType.text = foodType
        self.foodRate.text = String("servings:\(foodRate)")
    }
    

    func configCell(meal:Meal)
    {
        mealName.text = meal.name
        foodRate.text = String("servings:\(meal.num_servings)")
        mealImage.sd_setImage(with: URL(string: meal.thumbnail_url ?? "Placeholder" ), placeholderImage: UIImage(named: "Placeholder.png"))
    }
    @IBAction func favBtnAction(_ sender: Any) {
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        contentView.bounds = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
//    }
    
}
