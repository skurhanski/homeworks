//
//  Meal.swift
//  Recipes
//
//  Created by Sergey Kurgansky on 06.03.2024.
//

import Foundation

struct Meal: Codable {
    let mealID: String
    let name: String
    let thumb: String
    
    enum CodingKeys: String, CodingKey {
         case mealID = "idMeal"
         case name = "strMeal"
         case thumb = "strMealThumb"
     }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mealID = try values.decode(String.self, forKey: .mealID)
        name = try values.decode(String.self, forKey: .name)
        thumb = try values.decode(String.self, forKey: .thumb)
    }
}

struct MealDataStore: Codable {
    var meals: [Meal]
}
