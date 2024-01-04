//
//  ThirdVC.swift
//  homework2812
//
//  Created by Sergey Kurgansky on 04.01.2024.
//

import UIKit

class ThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func homeButton() {
            navigationController?.popToRootViewController(animated: true)
        }

}
