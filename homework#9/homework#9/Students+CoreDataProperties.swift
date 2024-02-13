//
//  Students+CoreDataProperties.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 12.02.2024.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?
    @NSManaged public var uuid: String?
    @NSManaged public var uuid_teacher: String?
    @NSManaged public var teacher: Teachers?

}

extension Students : Identifiable {

}
