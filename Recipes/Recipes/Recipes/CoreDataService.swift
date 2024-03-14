//
//  CoreDataService.swift
//  Recipes
//
//  Created by Sergey Kurgansky on 12.03.2024.
//

import CoreData

final class CoreDataService {
    static var shared = CoreDataService()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Recipes")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private init() {}
    
    func saveRecipe(with favorite: FavoriteViewModel) {
            let newFavorite = Favorite_recipe(context: self.context)
            //guard let age = favorite.age else { return }//
            newFavorite.name = favorite.name
            newFavorite.recipeID = favorite.recipeID
            saveContext()
    }
    
    func deleteTodo(with favorite: FavoriteViewModel){

    }
    
    func fetchRecipe() -> [FavoriteViewModel] {
        let request = Favorite_recipe.fetchRequest()
        guard let favorite = try? CoreDataService.shared.context.fetch(request) else { return [] }
        let fetchedRecipes = favorite.compactMap { return FavoriteViewModel(recipeID: $0.recipeID, name: $0.name)}
        return fetchedRecipes
    }
    
    private func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
