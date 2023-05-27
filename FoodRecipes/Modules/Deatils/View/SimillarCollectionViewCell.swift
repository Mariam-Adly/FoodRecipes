//
//  SimillarCollectionViewCell.swift
//  FoodRecipes
//
//  Created by ME on 27/05/2023.
//

import UIKit

class SimillarCollectionViewCell: UICollectionViewCell {

    @IBOutlet var servingNumber: UILabel!
    @IBOutlet var category: UILabel!
    @IBOutlet var cheefName: UILabel!
    @IBOutlet var mealName: UILabel!
    @IBOutlet var favBtn: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        favBtn.layer.cornerRadius = 30
    }

    @IBAction func favBtnPressed(_ sender: Any) {
    }
}
