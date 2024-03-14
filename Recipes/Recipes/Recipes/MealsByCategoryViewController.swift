//
//  MealsByCategoryViewController.swift
//  Recipes
//
//  Created by Sergey Kurgansky on 06.03.2024.
//

import UIKit

var recipeID = String()

final class MealsByCategoryViewController: UIViewController {

    private var meals: [Meal] = [] {
        didSet {
            tableView.reloadData()
        }
    }
  private var images: [Int: UIImage] = [:]
    @IBOutlet private weak var addedToFavoriteButton: UIBarButtonItem!
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate =  self
        loadMeal()
//        fetchFavorite()
    }
}

extension MealsByCategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return meals.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let meal = meals[indexPath.row]
    let cell = UITableViewCell()
    //        if let image = getImage(from: meal.thumb) {
    //            cell.imageView?.image = image
    //        }
//    let urlImg = URL(string: meal.thumb)!
//    guard cell.imageView?.image == nil else { return cell}
//    cell.imageView?.downloaded(from: urlImg) {
//      self.updateImageForCell(at: indexPath.row)
//
//    }
    cell.textLabel?.text = meal.name
    cell.imageView?.image = images[indexPath.row]
    return cell
  }

  private func updateImageForCell(at index: Int) {
    DispatchQueue.main.async { [self] in
      let indexPath = IndexPath(row: index, section: 0)
      if tableView.indexPathsForVisibleRows?.contains(indexPath) == true {
        tableView.reloadRows(at: [indexPath], with: .fade)
      }
    }
  }


  private func loadMeal() {
    guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(categoryName)")
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

  private func downloadImages(at index: Int) {
    var meal = meals[index]
    URLSession.shared.dataTask(with: URL(string: meal.thumb)!) { data, response, error in
      guard  let data = data,
        let image = UIImage(data: data)
      else { return }
      self.images[index] = image
      self.updateImageForCell(at: index)
    }.resume()
  }
}

extension MealsByCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recipeID = meals[indexPath.row].mealID
        let storyboard = UIStoryboard(name: "Recipe", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "RecipeVC") as? RecipeVC {
            vc.updateFavoriteBtnDelegate = self
            isFavorite = false
            navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }

  func tableView(_ tableView: UITableView,
                 willDisplay cell: UITableViewCell,
                 forRowAt indexPath: IndexPath) {
    guard images[indexPath.row] == nil else { return }
    downloadImages(at: indexPath.row)
  }
}

extension MealsByCategoryViewController: UpdateFavoriteBtnDelegate {
    func updateFavoriteButton(favorite: [FavoriteViewModel]) {

        if !favorite.isEmpty {
            addedToFavoriteButton.image = UIImage(systemName: "bookmark.fill")
        } else {
            addedToFavoriteButton.image = UIImage(systemName: "bookmark")
        }
        print(favorite.count)
    }
}

protocol UpdateFavoriteBtnDelegate: AnyObject {
    func updateFavoriteButton(favorite: [FavoriteViewModel])
}
