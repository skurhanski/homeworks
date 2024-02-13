//
//  TeacherInfoVC.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 13.02.2024.
//

import UIKit

final class TeacherInfoVC: UIViewController {
    
    private var students = [StudentViewModel]()
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var lastnameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getInfoAboutTeacher()
    }
    
    private func getInfoAboutTeacher() {
        fetchStudentsForTeacher(teacherInfo.uuid ?? "nil")
        nameLabel.text = teacherInfo.name
        lastnameLabel.text = teacherInfo.lastname
    }
    
    private func fetchStudentsForTeacher(_ uuidTeacher: String) {
        students = CoreDataService.shared.fetchAllStudentsForTeacher(uuidTeacher)
    }
}

extension TeacherInfoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let student = students[indexPath.row]
        let cell = UITableViewCell()
        if let name = student.name, let age = student.age {
            cell.textLabel?.text = "\(name) \(age)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentInfo.name = students[indexPath.row].name
        studentInfo.age = students[indexPath.row].age
        studentInfo.uuid_teacher = students[indexPath.row].uuid_teacher
        let storyboard = UIStoryboard(name: "StudentInfo", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "StudentInfoVC") as? StudentInfoVC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
