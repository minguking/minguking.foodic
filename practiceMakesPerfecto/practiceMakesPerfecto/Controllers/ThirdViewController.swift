//
//  ThirdViewController.swift
//  practiceMakesPerfecto
//
//  Created by Kang Mingu on 11/05/2020.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

var allFood: [AllFood] = []
var currentAllFood = [AllFood]()

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        setUpSearchBar()
        
        tableView.register(UINib(nibName: "ThirdTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "allFoodList") else { return }
        
        do {
            allFood = try decoder.decode([AllFood].self, from: dataAsset.data)
        } catch {
            print("failed decoding AllFood \(error.localizedDescription)")
        }
        
        tableView.reloadData()
        currentAllFood = allFood
        
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
        
        
    }

}

extension ThirdViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            currentAllFood = allFood
            tableView.reloadData()
            return
        }
        currentAllFood = allFood.filter({ (allfood) -> Bool in
            allfood.nameEng.lowercased().contains(searchText.lowercased()) ||
                allfood.nameKor.contains(searchText) ||
                allfood.ingredient.lowercased()
                    .contains(searchText.lowercased()) ||
                allfood.namdThai.contains(searchText) ||
                allfood.recipe.lowercased().contains(searchText.lowercased()) ||
                allfood.recepieKor.contains(searchText) ||
                allfood.description.lowercased().contains(searchText
                    .lowercased()) ||
                allfood.descriptionKor.contains(searchText) ||
                allfood.price.contains(searchText) ||
                allfood.ingredientKor.contains(searchText) ||
                allfood.tag.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
}

extension ThirdViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentAllFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ThirdTableViewCell
        
        let allFoodList = currentAllFood[indexPath.row]
        
        cell.titleLabel.text = allFoodList.nameEng
        cell.infoLabel.text = allFoodList.recipe + "/" + allFoodList.ingredient
        cell.priceLabel.text = allFoodList.price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }
    
}
