//
//  ViewController.swift
//  homework#7
//
//  Created by Sergey Kurgansky on 10.01.2024.
//

import UIKit

public struct User {
    var name: String?
    var avatar: UIImage?
}

public var user = User()


class ViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var customizeButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeStyle()
        nameLabel.text = user.name ?? "No Name"
        avatarImage.image = user.avatar ?? UIImage.noAvatar
    }
    
    func makeStyle() {
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.purple.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.clipsToBounds = true
        avatarImage.image = UIImage.noAvatar

        customizeButton.layer.borderWidth = 1
        customizeButton.layer.cornerRadius = 10
        customizeButton.layer.borderColor = UIColor.purple.cgColor
    }

    @IBAction private func customizeButtonDidTap() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = mainStoryboard.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
            else {return}
        secondVC.saveDataDelegate = self
        present(secondVC, animated: true)
    }
}

extension ViewController: SaveDataDelegate {
    func setAvatar(avatar: UIImage) {
        avatarImage.image = avatar
    }
    func setName(name: String) {
        nameLabel.text = name
    }    
}

protocol SaveDataDelegate: AnyObject {
    func setName(name: String)
    func setAvatar(avatar: UIImage)
}




