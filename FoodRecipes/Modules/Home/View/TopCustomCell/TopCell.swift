//
//  TopCell.swift
//  FoodRecipes
//
//  Created by Yousra Mamdouh Ali on 26/05/2023.
//

import UIKit

class TopCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.alpha = 1.0
        setImageStyle(image: categoryImage)

    }

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    func configure(category:Category) {
 
    }
    
    func setImageStyle(image:UIImageView) {
  
        image.layer.cornerRadius = image.frame.height/6
      
     }
    func setUpCell(category: Category)
    {
      categoryName.text = category.name
        categoryImage.image = UIImage(named: category.image ?? "")
        if(category.isSelected == true)
        {
            categoryImage.backgroundColor = UIColor(named: "orange")
        }
        else{
            categoryImage.backgroundColor = UIColor(named: "grey")
        }
    }
  
}
