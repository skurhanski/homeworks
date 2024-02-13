//
//  CreateTeacherVC.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 07.02.2024.
//

import UIKit

final class CreateTeacherVC: UIViewController {
    
    var completion: (() -> Void)?
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var lastnameTextField: UITextField!

    @IBAction private func saveAction() {
        guard let name = nameTextField.text, let lastname = lastnameTextField.text else { return }
        let uuid = NSUUID().uuidString
        let teacher = TeachersViewModel(name: name, lastname: lastname, uuid: uuid)
        CoreDataService.shared.saveTeacher(with: teacher)
        completion?()
        navigationController?.popViewController(animated: true)
    }
}
