//
//  ViewController.swift
//  homework#5
//
//  Created by Sergey Kurgansky on 07.02.2024.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goButton() {
        let storyboard = UIStoryboard(name: "Calculator", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "CalculatorVC") as? CalculatorVC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

