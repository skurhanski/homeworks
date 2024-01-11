//
//  SixthVC.swift
//  homework#7
//
//  Created by Sergey Kurgansky on 10.01.2024.
//

import UIKit

class SixthVC: UIViewController {
    
    var saveDataDelegate: SaveDataDelegate?
    var editDataDelegate: EditDataDelegate?
    
    @IBOutlet weak var bugImgButton, manImgButton, crownImgButton, starImgButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func bugImgButtonDidTap() {
        let profileAvatar = EditUser(editAvatar: UIImage.bug)
        editDataDelegate?.setEditAvatar(editProfile: profileAvatar)
        editDataDelegate?.dismissVC()
    }
    
    @IBAction private func manImgButtonDidTap() {
        let profileAvatar = EditUser(editAvatar: UIImage.man)
        editDataDelegate?.setEditAvatar(editProfile: profileAvatar)
        editDataDelegate?.dismissVC()
    }
    
    @IBAction private func crownImgButtonDidTap() {
        let profileAvatar = EditUser(editAvatar: UIImage.king)
        editDataDelegate?.setEditAvatar(editProfile: profileAvatar)
        editDataDelegate?.dismissVC()
    }
    
    @IBAction private func starImgButtonDidTap() {
        let profileAvatar = EditUser(editAvatar: UIImage.star)
        editDataDelegate?.setEditAvatar(editProfile: profileAvatar)
        editDataDelegate?.dismissVC()
    }
    
    @IBAction private func backButtonDidTap() {
        dismiss(animated: true)
    }
}
