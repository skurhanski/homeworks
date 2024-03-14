//
//  Category.swift
//  Recipes
//
//  Created by Sergey Kurgansky on 05.03.2024.
//

import Foundation

struct Category: Codable {
    let categoryID: String
    let name: String
    let description: String
    let thumb: String
    
    enum CodingKeys: String, CodingKey {
         case categoryID = "idCategory"
         case name = "strCategory"
         case description = "strCategoryDescription"
         case thumb = "strCategoryThumb"
     }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categoryID = try values.decode(String.self, forKey: .categoryID)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        thumb = try values.decode(String.self, forKey: .thumb)
    }
}

struct CategoryDataStore: Codable {
    var categories: [Category]
}



