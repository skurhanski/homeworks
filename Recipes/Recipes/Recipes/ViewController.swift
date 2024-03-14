//
//  ViewController.swift
//  Recipes
//
//  Created by Sergey Kurgansky on 05.03.2024.
//

import UIKit
var categoryName = String()

final class ViewController: UIViewController {
    
    private var categories: [Category] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    @IBOutlet private weak var addedToFavoriteButton: UIBarButtonItem!
    @IBAction private func searchDidTap() {
        searchScreenAppear()
    }
    
    @IBAction private func favoriteDidTap() {
        favoriteScreenAppear()
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategory()
        tableView.dataSource = self
        tableView.delegate =  self
        fetchFavorite()
    }
    
    func searchScreenAppear() {
        let storyboard = UIStoryboard(name: "SearchVC", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SearchVC") as? SearchVC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func favoriteScreenAppear() {
        let storyboard = UIStoryboard(name: "FavoriteList", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "FavoriteList") as? FavoriteList {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func fetchFavorite() {
        favorites = CoreDataService.shared.fetchRecipe()
        

        
        if !favorites.isEmpty {
            addedToFavoriteButton.image = UIImage(systemName: "bookmark.fill")
        } else {
            addedToFavoriteButton.image = UIImage(systemName: "bookmark")
        }
    }
    

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = category.name
            if let image = getImage(from: category.thumb) {
                cell.imageView?.image = image
            }
//        let urlImg = URL(string: category.thumb)!
//        cell.imageView?.downloaded(from: urlImg)
        return cell
    }
    
    private func loadCategory() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = responseData {
                let categoryDataStore = try? JSONDecoder().decode(CategoryDataStore.self, from: jsonData)
                DispatchQueue.main.async {
                    self.categories = categoryDataStore!.categories
                }
            }
        }.resume()
    }
}



extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryName = categories[indexPath.row].name
        let storyboard = UIStoryboard(name: "MealsByCategory", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MealsByCategoryViewController") as? MealsByCategoryViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: false)

    }
}

func getImage(from string: String?) -> UIImage? {
    guard let url = URL(string: string!)
        else {
            print("Unable to create URL")
            return nil
    }
    var image: UIImage? = nil
    do {
        let data = try Data(contentsOf: url, options: [])
        image = UIImage(data: data)
    }
    catch {
        print(error.localizedDescription)
    }
    return image
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                //let mimeType = response?.mimeType, mimeType.hasSuffix("png"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}










