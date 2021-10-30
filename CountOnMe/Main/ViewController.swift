//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textViewDidChange()
        }
    }
    @IBOutlet var numberButtons: [UIButton]!

    @IBOutlet var operatorButtons: [UIButton]!
    let viewModel = ViewModel()

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.// Error check computed variables
    }

    private func textViewDidChange() {
        viewModel.elements = textView.text.split(separator: " ").map { "\($0)" }
    }

    private func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title,
                                        message: message,
                                        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    private func enableAllOperatorButtons() {
        for operatorButton in operatorButtons {
            operatorButton.isEnabled = true
        }
    }

    private func disableAllOperatorButtons() {
        for operatorButton in operatorButtons {
            operatorButton.isEnabled = false
        }
    }

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }

        if viewModel.expressionHaveResult {
            textView.text = ""
            textViewDidChange()
        }

        textView.text.append(numberText)
        textViewDidChange()
        enableAllOperatorButtons()
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if viewModel.canAddOperator {
            textView.text.append(" + ")
            textViewDidChange()
        } else {
            showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if viewModel.canAddOperator {
            textView.text.append(" - ")
            textViewDidChange()
        } else {
            showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if viewModel.canAddOperator {
            textView.text.append(" * ")
            textViewDidChange()
        } else {
            showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedDivideButton(_ sender: UIButton) {
        print("devide")
        if viewModel.canAddOperator {
            textView.text.append(" / ")
            textViewDidChange()
        } else {
            showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard viewModel.expressionIsCorrect else {
            showAlert(title: "Zéro!", message: "Entrez une expression correcte !")
            return
        }

        guard viewModel.expressionHaveEnoughElement else {
            showAlert(title: "Zéro!", message: "Démarrez un nouveau calcul !")
            return
        }

        if let result = viewModel.calculating() {
            textView.text.append(result)
            textViewDidChange()
            disableAllOperatorButtons()
        }
    }
}
