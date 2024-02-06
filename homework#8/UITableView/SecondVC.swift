//
//  SecondVC.swift
//  UITableView
//
//  Created by Sergey Kurgansky on 20.01.2024.
//

import UIKit

final class SecondVC: UIViewController {
    
    var saveDataDelegate: SaveDataDelegate?
    
    @IBOutlet private var nameLabel: UITextField!
    @IBOutlet private var surnameLabel: UITextField!
    @IBOutlet private var cancelButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeStyle()
    }
    
    func makeStyle() {
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    @IBAction private func cancelDidTap() {
        dismiss(animated: true)
    }
    
    @IBAction private func saveDidTap() {
        guard let name = nameLabel.text, let surname = surnameLabel.text else { return }
        saveDataDelegate?.addPersonToArray(name: name, surname: surname)
        dismiss(animated: true)
        
    }
}
