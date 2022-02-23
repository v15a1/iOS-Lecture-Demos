//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by Visal Rajapakse on 2022-02-22.
//

import UIKit

class ViewController: UIViewController {

    // Usiing IBOutlet Collections
    @IBOutlet var textfields: [UITextField]!
    @IBOutlet var operands: [UIButton]!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var outputLabel: UILabel!

    var firstNumber: String = ""
    var secondNumber: String = ""
    var operand: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardSetup()
    }

    private func keyboardSetup() {
        textfields.forEach { textfield in
            //It will Hide Keyboard
            textfield.inputView = UIView()
            //It will Hide Keyboard tool bar
            textfield.inputAccessoryView = UIView()
        }
    }


    @IBAction func didPressNumber(_ sender: UIButton) {
        // Unwrapping optionals
        if let buttonText = sender.titleLabel?.text {

            // Collection filtering
            let activeTextField = textfields.filter { tf in
                return tf.isFirstResponder
            }.first

            if activeTextField?.tag == 1 {
                firstNumber += buttonText
                activeTextField?.text = firstNumber
            } else if activeTextField?.tag == 2 && operand != nil {
                secondNumber += buttonText
                activeTextField?.text = secondNumber
            }
        }
    }

    @IBAction func didPressOperand(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {

            // Resetting the button color using For each
            operands.forEach { button in
                button.backgroundColor = UIColor.calculatorOrange
            }

            if buttonText == "=" {
                var answer: Int = 0
                let firstNumberInt = Int(firstNumber) ?? 0
                let secondNumberInt = Int(secondNumber) ?? 0

                if operand == "+" {
                    answer = firstNumberInt + secondNumberInt
                } else if operand == "-" {
                    answer = firstNumberInt - secondNumberInt
                }
                outputLabel.text = "\(answer)"
            } else {
                operand = buttonText
                sender.backgroundColor = .black
            }
        }
    }

    @IBAction func reset() {
        textfields.forEach { tf in
            tf.text = ""
        }

        operands.forEach { button in
            button.backgroundColor = UIColor.calculatorOrange
        }

        outputLabel.text = ""
        firstNumber = ""
        secondNumber = ""
        operand = nil
    }
}

