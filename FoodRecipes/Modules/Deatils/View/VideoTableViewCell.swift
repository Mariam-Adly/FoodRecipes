//
//  VideoTableViewCell.swift
//  FoodRecipes
//
//  Created by ME on 27/05/2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet var favouriteBtn: UIButton!
    @IBOutlet var servingNumber: UILabel!
    @IBOutlet var mealCategory: UILabel!
    @IBOutlet var mealName: UILabel!
    @IBOutlet var videoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        favouriteBtn.layer.cornerRadius = 10
        videoImage.layer.opacity = 100
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func playVideoPressed(_ sender: Any) {
    }
    @IBAction func favouritePressed(_ sender: Any) {
    }
}
