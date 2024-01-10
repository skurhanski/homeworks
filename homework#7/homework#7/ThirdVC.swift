//
//  ThirdVC.swift
//  homework#7
//
//  Created by Sergey Kurgansky on 10.01.2024.
//

import UIKit

class ThirdVC: UIViewController {
    

    var saveDataDelegate: SaveDataDelegate?
    var editDataDelegate: EditDataDelegate?
    
    @IBOutlet weak var maleButton, femaleButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeStyle()
    }
    
    public func makeStyle() {
        maleButton.layer.borderWidth = 1
        maleButton.layer.cornerRadius = 10
        maleButton.layer.borderColor = UIColor.purple.cgColor

        femaleButton.layer.borderWidth = 1
        femaleButton.layer.cornerRadius = 10
        femaleButton.layer.borderColor = UIColor.purple.cgColor
    }
    
    @IBAction private func backButtonButtonDidTap() {
        dismiss(animated: true)
    }
    
    @IBAction private func maleButtonDidTap() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let fourthVC = mainStoryboard.instantiateViewController(withIdentifier: "FourthVC") as? FourthVC
            else {return}
        fourthVC.saveDataDelegate = self.saveDataDelegate
        fourthVC.editDataDelegate = self.editDataDelegate
        present(fourthVC, animated: true)
    }
    
    @IBAction private func femaleButtonDidTap() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let fifthVC = mainStoryboard.instantiateViewController(withIdentifier: "FifthVC") as? FifthVC
            else {return}
        fifthVC.saveDataDelegate = self.saveDataDelegate
        fifthVC.editDataDelegate = self.editDataDelegate
        present(fifthVC, animated: true)
    }
}
