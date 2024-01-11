//
//  SecondVC.swift
//  homework#7
//
//  Created by Sergey Kurgansky on 10.01.2024.
//

import UIKit

public struct EditUser {
    var editName: String?
    var editAvatar: UIImage?
}

public var editUser = EditUser()

class SecondVC: UIViewController {
    
    var saveDataDelegate: SaveDataDelegate?
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeStyle()
        nameLabel.text = user.name ?? "No Name"
        avatarImage.image = user.avatar ?? UIImage.noAvatar
    }
    
    public func makeStyle() {
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.purple.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.clipsToBounds = true
        
        editButton.layer.borderWidth = 1
        editButton.layer.cornerRadius = 10
        editButton.layer.borderColor = UIColor.purple.cgColor
        
        saveButton.layer.borderWidth = 1
        saveButton.layer.cornerRadius = 10
        saveButton.layer.borderColor = UIColor.purple.cgColor
        saveButton.layer.backgroundColor = UIColor.purple.cgColor
    }
    
    @IBAction private func saveButtonDidTap() {
        saveDataDelegate?.setName(name: nameLabel.text!)
        saveDataDelegate?.setAvatar(avatar: avatarImage.image!)
        user.name = nameLabel.text
        user.avatar = avatarImage.image
        dismiss(animated: true)
        
    }
    
    @IBAction private func cancelButtonDidTap() {
        dismiss(animated: true)
    }
    
    @IBAction private func editButtonDidTap() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let thirdVC = mainStoryboard.instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC
            else {return}
        thirdVC.saveDataDelegate = self.saveDataDelegate
        thirdVC.editDataDelegate = self
        present(thirdVC, animated: true)
    }
}

extension SecondVC: EditDataDelegate {
    func setEditAvatar(editProfile: EditUser) {
        avatarImage.image = editProfile.editAvatar
    }
    func setEditName(editProfile: EditUser) {
        nameLabel.text = editProfile.editName
    }
    func dismissVC() {
        dismiss(animated: true)
    }
}

protocol EditDataDelegate: AnyObject {
    func dismissVC()
    func setEditName(editProfile: EditUser)
    func setEditAvatar(editProfile: EditUser)
}
