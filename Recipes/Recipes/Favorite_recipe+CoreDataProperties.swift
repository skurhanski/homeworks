//
//  Favorite_recipe+CoreDataProperties.swift
//  Recipes
//
//  Created by Sergey Kurgansky on 14.03.2024.
//
//

import Foundation
import CoreData


extension Favorite_recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite_recipe> {
        return NSFetchRequest<Favorite_recipe>(entityName: "Favorite_recipe")
    }

    @NSManaged public var recipeID: String?
    @NSManaged public var name: String?

}

extension Favorite_recipe : Identifiable {

}
