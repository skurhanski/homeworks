//
//  CalculatorVC.swift
//  homework#5
//
//  Created by Sergey Kurgansky on 07.02.2024.
//

import UIKit

final class CalculatorVC: UIViewController {
    
    @IBOutlet private weak var buttonsView: UIView!
    @IBOutlet private weak var buttonPoint: UIButton!
    @IBOutlet private weak var buttonZero: UIButton!
    @IBOutlet private weak var buttonEqual: UIButton!
    @IBOutlet private weak var buttonPlus: UIButton!
    @IBOutlet private weak var buttonOne: UIButton!
    @IBOutlet private weak var buttonTwo: UIButton!
    @IBOutlet private weak var buttonThree: UIButton!
    @IBOutlet private weak var buttonFour: UIButton!
    @IBOutlet private weak var buttonFive: UIButton!
    @IBOutlet private weak var buttonSix: UIButton!
    @IBOutlet private weak var buttonMinus: UIButton!
    @IBOutlet private weak var buttonSeven: UIButton!
    @IBOutlet private weak var buttonEight: UIButton!
    @IBOutlet private weak var buttonNine: UIButton!
    @IBOutlet private weak var buttonMultiplier: UIButton!
    @IBOutlet private weak var buttonCancel: UIButton!
    @IBOutlet private weak var buttonDelete: UIButton!
    @IBOutlet private weak var buttonPercent: UIButton!
    @IBOutlet private weak var buttonDivision: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcView()
    }
    
    private func calcView() {
        setButtonsView()
        setButtonPoint()
        setButtonZero()
        setButtonEqual()
        setButtonPlus()
        setButtonOne()
        setButtonTwo()
        setButtonThree()
        setButtonFour()
        setButtonFive()
        setButtonSix()
        setButtonMinus()
        setButtonSeven()
        setButtonEight()
        setButtonNine()
        setButtonMultiplier()
        setButtonCancel()
        setButtonDelete()
        setButtonPercent()
        setButtonDivision()
    }
    
    private func setButtonsView() {
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        let buttonsViewConstraints = [
            buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            buttonsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            buttonsView.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 5/4)
        ]
        NSLayoutConstraint.activate(buttonsViewConstraints)
    }
    
    private func setButtonPoint() {
        buttonPoint.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPoint.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 0),
            buttonPoint.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 0),
            buttonPoint.trailingAnchor.constraint(equalTo: buttonZero.leadingAnchor, constant: 0),
            buttonPoint.bottomAnchor.constraint(equalTo: buttonsView.bottomAnchor, constant: 0),
            buttonPoint.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonPoint.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonPoint.layer.borderWidth = 0.3
        buttonPoint.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonZero() {
        buttonZero.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonZero.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: 0),
            buttonZero.leadingAnchor.constraint(equalTo: buttonPoint.trailingAnchor, constant: 0),
            buttonZero.trailingAnchor.constraint(equalTo: buttonEqual.leadingAnchor, constant: 0),
            buttonZero.bottomAnchor.constraint(equalTo: buttonsView.bottomAnchor, constant: 0),
            buttonZero.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonZero.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonZero.layer.borderWidth = 0.3
        buttonZero.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonEqual() {
        buttonEqual.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonEqual.topAnchor.constraint(equalTo: buttonThree.bottomAnchor, constant: 0),
            buttonEqual.leadingAnchor.constraint(equalTo: buttonZero.trailingAnchor, constant: 0),
            buttonEqual.trailingAnchor.constraint(equalTo: buttonPlus.leadingAnchor, constant: 0),
            buttonEqual.bottomAnchor.constraint(equalTo: buttonsView.bottomAnchor, constant: 0),
            buttonEqual.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonEqual.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonEqual.layer.borderWidth = 0.3
        buttonEqual.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonPlus() {
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPlus.topAnchor.constraint(equalTo: buttonMinus.bottomAnchor, constant: 0),
            buttonPlus.leadingAnchor.constraint(equalTo: buttonThree.trailingAnchor, constant: 0),
            buttonPlus.trailingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 0),
            buttonPlus.bottomAnchor.constraint(equalTo: buttonsView.bottomAnchor, constant: 0),
            buttonPlus.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonPlus.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/2)
        ])
        buttonPlus.layer.borderWidth = 0.3
        buttonPlus.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonOne() {
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonOne.topAnchor.constraint(equalTo: buttonFour.bottomAnchor, constant: 0),
            buttonOne.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 0),
            buttonOne.trailingAnchor.constraint(equalTo: buttonTwo.leadingAnchor, constant: 0),
            buttonOne.bottomAnchor.constraint(equalTo: buttonPoint.topAnchor, constant: 0),
            buttonOne.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonOne.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonOne.layer.borderWidth = 0.3
        buttonOne.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonTwo() {
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonTwo.topAnchor.constraint(equalTo: buttonFive.bottomAnchor, constant: 0),
            buttonTwo.leadingAnchor.constraint(equalTo: buttonOne.trailingAnchor, constant: 0),
            buttonTwo.trailingAnchor.constraint(equalTo: buttonThree.leadingAnchor, constant: 0),
            buttonTwo.bottomAnchor.constraint(equalTo: buttonZero.topAnchor, constant: 0),
            buttonTwo.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonTwo.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonTwo.layer.borderWidth = 0.3
        buttonTwo.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonThree() {
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonThree.topAnchor.constraint(equalTo: buttonSix.bottomAnchor, constant: 0),
            buttonThree.leadingAnchor.constraint(equalTo: buttonTwo.trailingAnchor, constant: 0),
            buttonThree.trailingAnchor.constraint(equalTo: buttonPlus.leadingAnchor, constant: 0),
            buttonThree.bottomAnchor.constraint(equalTo: buttonEqual.topAnchor, constant: 0),
            buttonThree.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonThree.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonThree.layer.borderWidth = 0.3
        buttonThree.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonFour() {
        buttonFour.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonFour.topAnchor.constraint(equalTo: buttonSeven.bottomAnchor, constant: 0),
            buttonFour.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 0),
            buttonFour.trailingAnchor.constraint(equalTo: buttonFive.leadingAnchor, constant: 0),
            buttonFour.bottomAnchor.constraint(equalTo: buttonOne.topAnchor, constant: 0),
            buttonFour.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonFour.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonFour.layer.borderWidth = 0.3
        buttonFour.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonFive() {
        buttonFive.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonFive.topAnchor.constraint(equalTo: buttonEight.bottomAnchor, constant: 0),
            buttonFive.leadingAnchor.constraint(equalTo: buttonFour.trailingAnchor, constant: 0),
            buttonFive.trailingAnchor.constraint(equalTo: buttonSix.leadingAnchor, constant: 0),
            buttonFive.bottomAnchor.constraint(equalTo: buttonTwo.topAnchor, constant: 0),
            buttonFive.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonFive.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonFive.layer.borderWidth = 0.3
        buttonFive.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonSix() {
        buttonSix.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonSix.topAnchor.constraint(equalTo: buttonNine.bottomAnchor, constant: 0),
            buttonSix.leadingAnchor.constraint(equalTo: buttonFive.trailingAnchor, constant: 0),
            buttonSix.trailingAnchor.constraint(equalTo: buttonMinus.leadingAnchor, constant: 0),
            buttonSix.bottomAnchor.constraint(equalTo: buttonThree.topAnchor, constant: 0),
            buttonSix.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonSix.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonSix.layer.borderWidth = 0.3
        buttonSix.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonMinus() {
        buttonMinus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonMinus.topAnchor.constraint(equalTo: buttonMultiplier.bottomAnchor, constant: 0),
            buttonMinus.leadingAnchor.constraint(equalTo: buttonSix.trailingAnchor, constant: 0),
            buttonMinus.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: 0),
            buttonMinus.bottomAnchor.constraint(equalTo: buttonPlus.topAnchor, constant: 0),
            buttonMinus.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonMinus.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonMinus.layer.borderWidth = 0.3
        buttonMinus.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonSeven() {
        buttonSeven.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonSeven.topAnchor.constraint(equalTo: buttonCancel.bottomAnchor, constant: 0),
            buttonSeven.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 0),
            buttonSeven.trailingAnchor.constraint(equalTo: buttonEight.leadingAnchor, constant: 0),
            buttonSeven.bottomAnchor.constraint(equalTo: buttonFour.topAnchor, constant: 0),
            buttonSeven.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonSeven.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonSeven.layer.borderWidth = 0.3
        buttonSeven.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonEight() {
        buttonEight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonEight.topAnchor.constraint(equalTo: buttonDelete.bottomAnchor, constant: 0),
            buttonEight.leadingAnchor.constraint(equalTo: buttonSeven.trailingAnchor, constant: 0),
            buttonEight.trailingAnchor.constraint(equalTo: buttonNine.leadingAnchor, constant: 0),
            buttonEight.bottomAnchor.constraint(equalTo: buttonFive.topAnchor, constant: 0),
            buttonEight.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonEight.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonEight.layer.borderWidth = 0.3
        buttonEight.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonNine() {
        buttonNine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonNine.topAnchor.constraint(equalTo: buttonPercent.bottomAnchor, constant: 0),
            buttonNine.leadingAnchor.constraint(equalTo: buttonEight.trailingAnchor, constant: 0),
            buttonNine.trailingAnchor.constraint(equalTo: buttonMultiplier.leadingAnchor, constant: 0),
            buttonNine.bottomAnchor.constraint(equalTo: buttonSix.topAnchor, constant: 0),
            buttonNine.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonNine.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonNine.layer.borderWidth = 0.3
        buttonNine.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonMultiplier() {
        buttonMultiplier.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonMultiplier.topAnchor.constraint(equalTo: buttonDivision.bottomAnchor, constant: 0),
            buttonMultiplier.leadingAnchor.constraint(equalTo: buttonNine.trailingAnchor, constant: 0),
            buttonMultiplier.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: 0),
            buttonMultiplier.bottomAnchor.constraint(equalTo: buttonMinus.topAnchor, constant: 0),
            buttonMultiplier.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonMultiplier.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonMultiplier.layer.borderWidth = 0.3
        buttonMultiplier.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonCancel() {
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonCancel.topAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 0),
            buttonCancel.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 0),
            buttonCancel.trailingAnchor.constraint(equalTo: buttonDelete.leadingAnchor, constant: 0),
            buttonCancel.bottomAnchor.constraint(equalTo: buttonSeven.topAnchor, constant: 0),
            buttonCancel.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonCancel.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonCancel.layer.borderWidth = 0.3
        buttonCancel.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonDelete() {
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonDelete.topAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 0),
            buttonDelete.leadingAnchor.constraint(equalTo: buttonCancel.trailingAnchor, constant: 0),
            buttonDelete.trailingAnchor.constraint(equalTo: buttonPercent.leadingAnchor, constant: 0),
            buttonDelete.bottomAnchor.constraint(equalTo: buttonEight.topAnchor, constant: 0),
            buttonDelete.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonDelete.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonDelete.layer.borderWidth = 0.3
        buttonDelete.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonPercent() {
        buttonPercent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPercent.topAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 0),
            buttonPercent.leadingAnchor.constraint(equalTo: buttonDelete.trailingAnchor, constant: 0),
            buttonPercent.trailingAnchor.constraint(equalTo: buttonDivision.leadingAnchor, constant: 0),
            buttonPercent.bottomAnchor.constraint(equalTo: buttonNine.topAnchor, constant: 0),
            buttonPercent.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonPercent.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonPercent.layer.borderWidth = 0.3
        buttonPercent.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setButtonDivision() {
        buttonDivision.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonDivision.topAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 0),
            buttonDivision.leadingAnchor.constraint(equalTo: buttonPercent.trailingAnchor, constant: 0),
            buttonDivision.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: 0),
            buttonDivision.bottomAnchor.constraint(equalTo: buttonMultiplier.topAnchor, constant: 0),
            buttonDivision.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4),
            buttonDivision.heightAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 1/4)
        ])
        buttonDivision.layer.borderWidth = 0.3
        buttonDivision.layer.borderColor = UIColor.gray.cgColor
    }
}
