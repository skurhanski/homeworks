//
//  Teachers+CoreDataProperties.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 13.02.2024.
//
//

import Foundation
import CoreData


extension Teachers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teachers> {
        return NSFetchRequest<Teachers>(entityName: "Teachers")
    }

    @NSManaged public var lastname: String?
    @NSManaged public var name: String?
    @NSManaged public var uuid: String?
    @NSManaged public var student: NSSet?

}

// MARK: Generated accessors for student
extension Teachers {

    @objc(addStudentObject:)
    @NSManaged public func addToStudent(_ value: Students)

    @objc(removeStudentObject:)
    @NSManaged public func removeFromStudent(_ value: Students)

    @objc(addStudent:)
    @NSManaged public func addToStudent(_ values: NSSet)

    @objc(removeStudent:)
    @NSManaged public func removeFromStudent(_ values: NSSet)

}

extension Teachers : Identifiable {

}
