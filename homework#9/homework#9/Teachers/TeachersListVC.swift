//
//  TeachersListVC.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 06.02.2024.
//

import UIKit

var openTeacherInfo: Bool = true
var teacherInfo = TeachersViewModel()

struct TeachersViewModel {
    var name: String?
    var lastname: String?
    var uuid: String?
    var uuid_student: String?
}

final class TeachersListVC: UIViewController {
    
    var createDelegate: CreateDelegate?

    @IBOutlet private weak var tableView: UITableView!
    
    private var teachers = [TeachersViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        teachers = CoreDataService.shared.fetchTeachers()
    }
    
    @IBAction private func plusDidTap() {
        let storyboard = UIStoryboard(name: "CreateTeacher", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "CreateTeacherVC") as? CreateTeacherVC {
            vc.completion = { [weak self] in
              self?.fetchData()
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension TeachersListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teachers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teacher = teachers[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = teacher.name
        if let name = teacher.name, let lastname = teacher.lastname {
            cell.textLabel?.text = "\(name) \(lastname)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if openTeacherInfo {
            let storyboard = UIStoryboard(name: "TeacherInfo", bundle: nil)
            teacherInfo.uuid = teachers[indexPath.row].uuid
            teacherInfo.name = teachers[indexPath.row].name
            teacherInfo.lastname = teachers[indexPath.row].lastname
            if let vc = storyboard.instantiateViewController(withIdentifier: "TeacherInfoVC") as? TeacherInfoVC {
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            createDelegate?.updateTeacherButton(teacher: teachers[indexPath.row])
            navigationController?.popViewController(animated: true)
        }
    }
}
