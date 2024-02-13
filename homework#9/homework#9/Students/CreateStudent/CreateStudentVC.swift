//
//  CreateStudentVC.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 06.02.2024.
//

import UIKit

final class CreateStudentVC: UIViewController {
    
    var completion: (() -> Void)?
    private var uuidTeacher: String?

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var ageTextField: UITextField!
    @IBOutlet private weak var chooseTeacherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeStyle()
    }

    @IBAction private func saveAction() {
        guard let name = nameTextField.text, let age = ageTextField.text else { return }
        let uuid = NSUUID().uuidString
        let student = StudentViewModel(name: name, age: age, uuid: uuid, uuid_teacher: uuidTeacher ?? "nil")
        CoreDataService.shared.saveStudent(with: student)
        completion?()
        navigationController?.popViewController(animated: true)
    }
    
    private func makeStyle() {
        chooseTeacherButton.layer.borderWidth = 1
        chooseTeacherButton.layer.cornerRadius = 5
        chooseTeacherButton.layer.borderColor = UIColor.purple.cgColor
    }
    
    @IBAction private func choiceAction() {
        let storyboard = UIStoryboard(name: "TeachersList", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TeachersListVC") as? TeachersListVC {
            vc.createDelegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
        openTeacherInfo = false
    }
}

extension CreateStudentVC: CreateDelegate {
    func updateTeacherButton(teacher: TeachersViewModel) {
        if let name = teacher.name, let lastname = teacher.lastname {
            chooseTeacherButton.setTitle("Selected: \(name) \(lastname)", for: .normal)
        }
        uuidTeacher = teacher.uuid
    }
}

protocol CreateDelegate: AnyObject {
    func updateTeacherButton(teacher: TeachersViewModel)
}
