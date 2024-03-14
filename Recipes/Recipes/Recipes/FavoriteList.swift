//
//  FavoriteList.swift
//  Recipes
//
//  Created by Sergey Kurgansky on 12.03.2024.
//

import UIKit

var isFavorite: Bool = true

final class FavoriteList: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var favorites = [FavoriteViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()
    }
    
    private func fetchData() {
        favorites = CoreDataService.shared.fetchRecipe()
    }
}

extension FavoriteList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favorite = favorites[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = favorite.name
        if let name = favorite.name {
            cell.textLabel?.text = name
        }
        return cell
    }
}

extension FavoriteList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recipeID = favorites[indexPath.row].recipeID!
        let storyboard = UIStoryboard(name: "Recipe", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "RecipeVC") as? RecipeVC {
            isFavorite = true
            navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
