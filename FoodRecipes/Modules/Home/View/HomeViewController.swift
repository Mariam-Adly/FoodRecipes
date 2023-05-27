//
//  HomeViewController.swift
//  FoodRecipes
//
//  Created by Yousra Mamdouh Ali on 26/05/2023.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = HomeVieModel()
    var networkIndicator = UIActivityIndicatorView(style: .large)
    let no = DetailsViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setUpNetworkIndicator()
        setUpTableView()
        setupCollectionView()
        fetchMeals()
        startAnimation()
    }
    
    func setUpNetworkIndicator() {
        networkIndicator.color = UIColor.red
        networkIndicator.center = view.center
        networkIndicator.startAnimating()
        view.addSubview(networkIndicator)
    }

    func fetchMeals(){
        viewModel.getHomeMealsByCategory(category: "middle_eastern") {
        
            DispatchQueue.main.async {
                self.animationView.isHidden = true
                self.animationView.stop()
                
               // self.networkIndicator.stopAnimating()
        }
            self.tableView.reloadData()
        }
    }

    func setupCollectionView() {
        collectionView.register(UINib(nibName: "TopCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func setUpTableView(){
         tableView.register(UINib(nibName: "CategoriesCellTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesCellTableViewCell")
         tableView.delegate = self
         tableView.dataSource = self
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMealsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCellTableViewCell") as! CategoriesCellTableViewCell
        
        let meal = viewModel.getMealByIndex(index: indexPath.row)
        cell.configCell(meal: meal)
      //  checkIfItemSelected(index: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCategoriesCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopCell
        cell.setUpCell(category: viewModel.getCategory(index: indexPath.row))
      //  cell.configure(category: viewModel.getCategory(index: indexPath.row))
       
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/6 + (0.01 * collectionView.frame.size.width), height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.checkIfItemSelected(index: indexPath.row)
        resetTableView()
        startAnimation()
        switch(indexPath.row) {
        case 1:
        
           fetchMeals(categoryName: "breakfast")
     
        case 2:
      
            fetchMeals(categoryName: "lunch")
    
        case 3:
   
            fetchMeals(categoryName: "dinner")
      
        case 4:
      
            fetchMeals(categoryName: "desserts")
     
        default:
      
            fetchMeals(categoryName: "middle_eastern")
       
        }
        collectionView.reloadData()
    }
    
 func resetTableView()
    {
      //  setUpNetworkIndicator()
        viewModel.resetTableView()
        tableView.reloadData()
    }
   
    func fetchMeals(categoryName:String)
    {
        viewModel.getHomeMealsByCategory(category: categoryName)
        {
            self.animationView.isHidden = true
            self.animationView.stop()
           // self.networkIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    func startAnimation()
    {
        animationView.isHidden = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }
    enum  CategoryName{
    
    }
}
