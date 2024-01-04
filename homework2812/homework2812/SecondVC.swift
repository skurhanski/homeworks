//
//  SecondVC.swift
//  homework2812
//
//  Created by Sergey Kurgansky on 04.01.2024.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func nextButton() {
        let secondStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let thirdVC = secondStoryboard.instantiateViewController(withIdentifier: "ThirdVC")
        //present(secondVC, animated: true)
        navigationController?.pushViewController(thirdVC, animated: true)
    }

}
