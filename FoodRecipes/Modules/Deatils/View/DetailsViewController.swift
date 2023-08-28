//
//  DetailsViewController.swift
//  FoodRecipes
//
//  Created by ME on 27/05/2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var detailsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        self.navigationController?.isNavigationBarHidden = true
        detailsTableView.insetsContentViewsToSafeArea = true
        detailsTableView.contentInsetAdjustmentBehavior = .never
       registerCell()
    }

    func registerCell(){
        detailsTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: Constant.videoCellIdentifier)
        detailsTableView.register(UINib(nibName: "SimmilarMealCell", bundle: nil), forCellReuseIdentifier: "simillarMealsTVCell")
        detailsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
    }
    
   
}

extension DetailsViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3+5
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.videoCellIdentifier, for: indexPath) as! VideoTableViewCell
            cell.insetsLayoutMarginsFromSafeArea = true
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "simillarMealsTVCell", for: indexPath) as! SimmilarMealCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
            cell.imageView?.image = UIImage(named: "ingSection")
            cell.textLabel?.text = "hi ia ing"
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 352
        case 7:
            return 320
        default:
            return 50
            
        }
       
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Ingeridients"
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return ""
        case 7:
            return "Simillar meals"
        case 6:
            return "Instructions"
        default:
            return "name"
        }
    }
}
