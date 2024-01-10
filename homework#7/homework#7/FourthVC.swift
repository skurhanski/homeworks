//
//  FourthVC.swift
//  homework#7
//
//  Created by Sergey Kurgansky on 10.01.2024.
//

import UIKit

class FourthVC: UIViewController {
    
    var saveDataDelegate: SaveDataDelegate?
    var editDataDelegate: EditDataDelegate?
    
    @IBOutlet weak var frogButton, hummerButton, kingButton, gunButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeStyle()
    }
    
    public func makeStyle() {
        frogButton.layer.borderWidth = 1
        frogButton.layer.cornerRadius = 10
        frogButton.layer.borderColor = UIColor.purple.cgColor

        hummerButton.layer.borderWidth = 1
        hummerButton.layer.cornerRadius = 10
        hummerButton.layer.borderColor = UIColor.purple.cgColor
        
        kingButton.layer.borderWidth = 1
        kingButton.layer.cornerRadius = 10
        kingButton.layer.borderColor = UIColor.purple.cgColor
        
        gunButton.layer.borderWidth = 1
        gunButton.layer.cornerRadius = 10
        gunButton.layer.borderColor = UIColor.purple.cgColor
    }
    
    func goSixthVC() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sixthVC = mainStoryboard.instantiateViewController(withIdentifier: "SixthVC") as? SixthVC
            else {return}
        sixthVC.saveDataDelegate = self.saveDataDelegate
        sixthVC.editDataDelegate = self.editDataDelegate
        present(sixthVC, animated: true)
    }
    
    @IBAction private func frogButtonDidTap() {
        let profileName = EditUser(editName: "FROG")
        editDataDelegate?.setEditName(editProfile: profileName)
        goSixthVC()
    }
    
    @IBAction private func hummerButtonDidTap() {
        let profileName = EditUser(editName: "HUMMER")
        editDataDelegate?.setEditName(editProfile: profileName)
        goSixthVC()
    }
    
    @IBAction private func kingButtonDidTap() {
        let profileName = EditUser(editName: "KING")
        editDataDelegate?.setEditName(editProfile: profileName)
        goSixthVC()
    }
    
    @IBAction private func gunButtonDidTap() {
        let profileName = EditUser(editName: "GUN")
        editDataDelegate?.setEditName(editProfile: profileName)
        goSixthVC()
    }
    
    @IBAction private func backButtonDidTap() {
        dismiss(animated: true)
    }
}

