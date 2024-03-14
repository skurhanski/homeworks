//
//  RecipeVC.swift
//  Recipes
//
//  Created by Sergey Kurgansky on 06.03.2024.
//

import UIKit

final class RecipeVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var mealNameLabel: UILabel!
    @IBOutlet private weak var instructionsLabel: UILabel!
    @IBOutlet private weak var addToFavoriteButton: UIButton!
    @IBOutlet private weak var spiner: UIActivityIndicatorView!
    @IBOutlet private weak var recipeImage: UIImageView!
    
    
    var updateFavoriteBtnDelegate: UpdateFavoriteBtnDelegate?

    @IBAction private func addToFavorite() {
        
        if !isFavorite {
            addToFavoriteButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            isFavorite = true
        } else {
            addToFavoriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            isFavorite = false
        }

        let recipe = self.recipes.first
        favorite.name = recipe?.name
        favorite.recipeID = recipe?.mealID
        CoreDataService.shared.saveRecipe(with: favorite)
        favorites = CoreDataService.shared.fetchRecipe()
        updateFavoriteBtnDelegate?.updateFavoriteButton(favorite: favorites)
        
    }
    
    private var recipes: [Recipe] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var ingredients: [String] = []
    private var measures: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        spiner.startAnimating()
        loadRecipe()
        checkIsFavorite()
    }
    
    func checkIsFavorite() {
        if isFavorite {
            addToFavoriteButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }
    }
}



extension RecipeVC: UITableViewDataSource {
    private func loadRecipe() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeID)")
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = responseData {
                let recipeDataStore = try? JSONDecoder().decode(RecipeDataStore.self, from: jsonData)
                DispatchQueue.main.async {
                    self.recipes = recipeDataStore!.meals
                    let recipe = self.recipes.first
                    self.instructionsLabel.text = recipe?.instructions
                    self.mealNameLabel.text = recipe?.name
                    self.addToFavoriteButton.isHidden = false
                    self.spiner.isHidden = true
                    if let image = getImage(from: recipe?.thumb) {
                        self.recipeImage.image = image
                    }
                }
            }
        }.resume()
    }
    
    private func getIngredients() {
        let recipe = self.recipes.first
        var allIngredients: [String?] = []
        var allMeasures: [String?] = []
        allIngredients.append(recipe?.ingredient1)
        allIngredients.append(recipe?.ingredient2)
        allIngredients.append(recipe?.ingredient3)
        allIngredients.append(recipe?.ingredient4)
        allIngredients.append(recipe?.ingredient5)
        allIngredients.append(recipe?.ingredient6)
        allIngredients.append(recipe?.ingredient7)
        allIngredients.append(recipe?.ingredient8)
        allIngredients.append(recipe?.ingredient9)
        allIngredients.append(recipe?.ingredient10)
        allIngredients.append(recipe?.ingredient11)
        allIngredients.append(recipe?.ingredient12)
        allIngredients.append(recipe?.ingredient13)
        allIngredients.append(recipe?.ingredient14)
        allIngredients.append(recipe?.ingredient15)
        allIngredients.append(recipe?.ingredient16)
        allIngredients.append(recipe?.ingredient17)
        allIngredients.append(recipe?.ingredient18)
        allIngredients.append(recipe?.ingredient19)
        allIngredients.append(recipe?.ingredient20)
        allMeasures.append(recipe?.measure1)
        allMeasures.append(recipe?.measure2)
        allMeasures.append(recipe?.measure3)
        allMeasures.append(recipe?.measure4)
        allMeasures.append(recipe?.measure5)
        allMeasures.append(recipe?.measure6)
        allMeasures.append(recipe?.measure7)
        allMeasures.append(recipe?.measure8)
        allMeasures.append(recipe?.measure9)
        allMeasures.append(recipe?.measure10)
        allMeasures.append(recipe?.measure11)
        allMeasures.append(recipe?.measure12)
        allMeasures.append(recipe?.measure13)
        allMeasures.append(recipe?.measure14)
        allMeasures.append(recipe?.measure15)
        allMeasures.append(recipe?.measure16)
        allMeasures.append(recipe?.measure17)
        allMeasures.append(recipe?.measure18)
        allMeasures.append(recipe?.measure19)
        allMeasures.append(recipe?.measure20)

        self.ingredients = allIngredients.compactMap { $0 }
        self.measures = allMeasures.compactMap { $0 }
        self.ingredients = self.ingredients.filter { !$0.isEmpty && !$0.hasPrefix(" ") }
        self.measures = self.measures.filter { !$0.isEmpty && !$0.hasPrefix(" ") }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getIngredients()
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ingredient = ingredients[indexPath.row]
        let measure = measures[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsTableViewCell", for: indexPath) as? IngredientsTableViewCell
        cell?.ingredientLabel.text = ingredient
        cell?.measureLabel.text = measure
        return cell ?? UITableViewCell()
    }
}
