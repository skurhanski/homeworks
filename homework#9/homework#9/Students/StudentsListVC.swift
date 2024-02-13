//
//  StudentsListVC.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 06.02.2024.
//

import UIKit

struct StudentViewModel {
    var name: String?
    var age: String?
    var uuid: String?
    var uuid_teacher: String?
}

var studentInfo = StudentViewModel()

final class StudentsListVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var students = [StudentViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        students = CoreDataService.shared.fetchStudents()
    }
    
    @IBAction private func plusDidTap() {
        let storyboard = UIStoryboard(name: "CreateStudent", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "CreateStudentVC") as? CreateStudentVC {
            vc.completion = { [weak self] in
              self?.fetchData()
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension StudentsListVC: UITableViewDataSource, UITableViewDelegate {
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
        let storyboard = UIStoryboard(name: "StudentInfo", bundle: nil)
        studentInfo.name = students[indexPath.row].name
        studentInfo.age = students[indexPath.row].age
        studentInfo.uuid_teacher = students[indexPath.row].uuid_teacher
        if let vc = storyboard.instantiateViewController(withIdentifier: "StudentInfoVC") as? StudentInfoVC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
