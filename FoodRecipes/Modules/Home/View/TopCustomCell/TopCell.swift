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
      //  setCellStyle(view: backView)
    }

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
}
