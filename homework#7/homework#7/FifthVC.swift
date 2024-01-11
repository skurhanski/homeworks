//
//  FifthVC.swift
//  homework#7
//
//  Created by Sergey Kurgansky on 10.01.2024.
//

import UIKit

class FifthVC: UIViewController {
    
    var saveDataDelegate: SaveDataDelegate?
    var editDataDelegate: EditDataDelegate?
    
    @IBOutlet weak var foxButton, mirrorButton, queenButton, candyButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeStyle()
    }
    
    public func makeStyle() {
        foxButton.layer.borderWidth = 1
        foxButton.layer.cornerRadius = 10
        foxButton.layer.borderColor = UIColor.purple.cgColor

        mirrorButton.layer.borderWidth = 1
        mirrorButton.layer.cornerRadius = 10
        mirrorButton.layer.borderColor = UIColor.purple.cgColor
        
        queenButton.layer.borderWidth = 1
        queenButton.layer.cornerRadius = 10
        queenButton.layer.borderColor = UIColor.purple.cgColor
        
        candyButton.layer.borderWidth = 1
        candyButton.layer.cornerRadius = 10
        candyButton.layer.borderColor = UIColor.purple.cgColor
    }
    
    func goSixthVC() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sixthVC = mainStoryboard.instantiateViewController(withIdentifier: "SixthVC") as? SixthVC
            else {return}
        sixthVC.editDataDelegate = self.editDataDelegate
        sixthVC.saveDataDelegate = self.saveDataDelegate
        present(sixthVC, animated: true)
    }
    
    @IBAction private func foxButtonDidTap() {
        let profileName = EditUser(editName: "FOX")
        editDataDelegate?.setEditName(editProfile: profileName)
        goSixthVC()
    }
    
    @IBAction private func mirrorButtonDidTap() {
        let profileName = EditUser(editName: "MIRROR")
        editDataDelegate?.setEditName(editProfile: profileName)
        goSixthVC()
    }
    
    @IBAction private func queenButtonDidTap() {
        let profileName = EditUser(editName: "QUEEN")
        editDataDelegate?.setEditName(editProfile: profileName)
        goSixthVC()
    }
    
    @IBAction private func candyButtonDidTap() {
        let profileName = EditUser(editName: "CANDY")
        editDataDelegate?.setEditName(editProfile: profileName)
        goSixthVC()
    }

    @IBAction private func backButtonDidTap() {
        dismiss(animated: true)
    }

}

