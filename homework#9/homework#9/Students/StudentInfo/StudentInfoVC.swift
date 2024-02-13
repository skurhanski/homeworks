//
//  StudentInfoVC.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 12.02.2024.
//

import UIKit

final class StudentInfoVC: UIViewController {
    private var teacher = [TeachersViewModel]()
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var teacherLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getInfoAboutStudent()
    }
    
    private func getInfoAboutStudent() {
        fetchDataForTeacher(studentInfo.uuid_teacher ?? "nil")
        nameLabel.text = studentInfo.name
        ageLabel.text = studentInfo.age
        if let name = teacher.first?.name, let lastname = teacher.first?.lastname {
            teacherLabel.text = "\(name)  \(lastname)"
        }
    }
    
    private func fetchDataForTeacher(_ uuidTeacher: String) {
        teacher = CoreDataService.shared.fetchTeacherForStudent(uuidTeacher)
    }
}
