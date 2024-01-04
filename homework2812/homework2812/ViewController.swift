//
//  ViewController.swift
//  homework2812
//
//  Created by Sergey Kurgansky on 28.12.2023.
//

import UIKit

class ViewController: UIViewController {
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func experienceButton() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = mainStoryboard.instantiateViewController(withIdentifier: "SecondVC")
        navigationController?.pushViewController(secondVC, animated: true)
        
    }


}

