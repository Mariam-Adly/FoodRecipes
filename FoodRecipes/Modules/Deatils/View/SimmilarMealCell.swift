//
//  SimmilarMealCell.swift
//  FoodRecipes
//
//  Created by ME on 27/05/2023.
//

import UIKit

class SimmilarMealCell: UITableViewCell {

    @IBOutlet var simillarMealCollectionView: UICollectionView!
    @IBOutlet var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCellToCollectionView()
        simillarMealCollectionView.dataSource = self
        simillarMealCollectionView.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func registerCellToCollectionView(){
        simillarMealCollectionView.register(UINib(nibName: "SimillarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "simiilarMealCVCell")
    }
}
extension SimmilarMealCell : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "simiilarMealCVCell", for: indexPath) as! SimillarCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width*0.7 , height: self.view.frame.width*0.5)
    }
}
