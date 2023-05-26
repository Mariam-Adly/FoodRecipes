//
//  HomeViewController.swift
//  FoodRecipes
//
//  Created by Yousra Mamdouh Ali on 26/05/2023.
//

import UIKit

class HomeViewController: UIViewController {
    let viewModel = HomeVieModel()
    let categories: [Category] = [Category(name: "Popular", image: "fire"),Category(name: "Breakfast", image: "breakfast"),Category(name: "Lunch", image: "lunch-box"),Category(name: "Dinner", image: "dinner"),Category(name: "Dessert", image: "cake")]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "TopCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "CategoriesCellTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesCellTableViewCell")
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel.bindedMealResult = {
            self.tableView.reloadData()
        }
        viewModel.getHomeMealsByCategory(category: "middle_eastern")
    
        print("loded")
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCellTableViewCell") as! CategoriesCellTableViewCell
        
        let meal = viewModel.getMealByIndex(index: indexPath.row)
        cell.configCell(meal: meal)
        return cell
    }
    

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopCell
        cell.categoryName.text = categories[indexPath.row].name
        cell.categoryImage.image = UIImage(named: categories[indexPath.row].image ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/6, height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    func changeImageBackground(cell:TopCell)
    {
        cell.categoryImage.backgroundColor = UIColor(named: "orange")
    }
}
