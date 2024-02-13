//
//  CoreDataService.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 07.02.2024.
//

import CoreData

final class CoreDataService {
    
    static var shared = CoreDataService()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "homework_9")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private init() {}
    
    func saveStudent(with student: StudentViewModel) {
            let newStudent = Students(context: self.context)
            guard let age = student.age else { return }
            newStudent.age = Int16(age) ?? 0
            newStudent.name = student.name
            newStudent.uuid = student.uuid
            newStudent.uuid_teacher = student.uuid_teacher
            saveContext()
    }
    
    func fetchStudents() -> [StudentViewModel] {
        let request = Students.fetchRequest()
        guard let students = try? CoreDataService.shared.context.fetch(request) else { return [] }
        let fetchedStudents = students.compactMap { return StudentViewModel(name: $0.name ?? "nil", age: String($0.age), uuid: $0.uuid ?? "nil", uuid_teacher: $0.uuid_teacher )}
        return fetchedStudents
    }
    
    func fetchAllStudentsForTeacher(_ uuidTeacher: String) -> [StudentViewModel] {
        let request = Students.fetchRequest()
        request.predicate = NSPredicate(format: "uuid_teacher CONTAINS %@", uuidTeacher)
        guard let students = try? CoreDataService.shared.context.fetch(request) else { return [] }
        let fetchedStudentsForTeacher = students.compactMap { return StudentViewModel(name: $0.name ?? "nil", age: String($0.age), uuid: $0.uuid ?? "nil", uuid_teacher: $0.uuid_teacher )}
        return fetchedStudentsForTeacher
    }
    
    func saveTeacher(with teacher: TeachersViewModel) {
            let newTeacher = Teachers(context: self.context)
            newTeacher.name = teacher.name
            newTeacher.lastname = teacher.lastname
            newTeacher.uuid = teacher.uuid
            saveContext()
    }
    
    func fetchTeachers() -> [TeachersViewModel] {
        let request = Teachers.fetchRequest()
        guard let teachers = try? CoreDataService.shared.context.fetch(request) else { return [] }
        let fetchedTeachers = teachers.compactMap { return TeachersViewModel(name: $0.name ?? "nil", lastname: $0.lastname ?? "nil", uuid: $0.uuid ?? "nil" )}
        return fetchedTeachers
    }
    
    func fetchTeacherForStudent(_ uuidTeacher: String) -> [TeachersViewModel] {
        let request = Teachers.fetchRequest()
        request.predicate = NSPredicate(format: "uuid CONTAINS %@", uuidTeacher)
        guard let teachers = try? CoreDataService.shared.context.fetch(request) else { return [] }
        let fetchedTeacherForStudent = teachers.compactMap { return TeachersViewModel(name: $0.name ?? "nil", lastname: $0.lastname ?? "nil", uuid: $0.uuid ?? "nil" )}
        return fetchedTeacherForStudent
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
