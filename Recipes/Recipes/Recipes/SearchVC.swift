//
//  SearchVC.swift
//  Recipes
//
//  Created by Sergey Kurgansky on 06.03.2024.
//

import UIKit

final class SearchVC: UIViewController, UISearchBarDelegate {
    
    private var meals: [Meal] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private var searchField: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchField.delegate = self
        searchField.becomeFirstResponder()
        searchField.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchField.showsCancelButton = true
        }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchField.text!)
        searchField.resignFirstResponder()
        searchBar.showsCancelButton = false
        loadSearchResult()
    }
    
    private func loadSearchResult() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(searchField.text!)")
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = responseData {
                let mealDataStore = try? JSONDecoder().decode(MealDataStore.self, from: jsonData)
                DispatchQueue.main.async {
                    self.meals = mealDataStore!.meals
                }
            }
        }.resume()
    }
}

extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = meal.name
        return cell
    }
}

extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recipeID = meals[indexPath.row].mealID
        let storyboard = UIStoryboard(name: "Recipe", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "RecipeVC") as? RecipeVC {
            navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
