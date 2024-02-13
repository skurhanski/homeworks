//
//  ViewController.swift
//  homework#9
//
//  Created by Sergey Kurgansky on 06.02.2024.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func stutentsDidTap() {
        let storyboard = UIStoryboard(name: "StudentsList", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "StudentsListVC") as? StudentsListVC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction private func teachersDidTap() {
        openTeacherInfo = true
        let storyboard = UIStoryboard(name: "TeachersList", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TeachersListVC") as? TeachersListVC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
