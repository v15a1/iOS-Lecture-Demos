//
//  ViewController.swift
//  TriangleAreaCalculator
//
//  Created by Visal Rajapakse on 2022-02-23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlets + variables
    @IBOutlet weak var baseTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var calculateAreaButton: UIButton!
    @IBOutlet weak var outputLabel: UILabel!

    var baseValue: String = ""
    var heightValue: String = ""

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Removing the Apple default keyboard for each UITextField
        baseTextField.inputView = UIView()
        baseTextField.inputAccessoryView = UIView()

        heightTextField.inputView = UIView()
        heightTextField.inputAccessoryView = UIView()
    }

    @IBAction func didPressNumber(_ sender: UIButton) {
        // Unwrapping an optional
        //  > Checking if a variable that can POTENTIALLY be NULL
        //  > We can us IF LETs to define a new constant IF and ONLY IF the value we want unwrapped is NOT null.
        if let unwrappedText = sender.titleLabel?.text {
            // Checking if the TextField is the first responder (i.e., If it's the view ready to listen to actions)
            if baseTextField.isFirstResponder {
                // Preventing entering successive 0s before a decimal
                if unwrappedText == "0" && baseValue.first == "0" && !baseValue.contains(".") { return }
                baseValue += unwrappedText //String concatenation
                baseTextField.text = baseValue // Setting the textfield input
            } else if heightTextField.isFirstResponder {
                if unwrappedText == "0" && heightValue.first == "0" && !heightValue.contains(".") { return }
                heightValue += unwrappedText
                heightTextField.text = heightValue
            }

        }
    }

    @IBAction func didPressDelete(_ sender: UIButton) {
        // Checking if the TextField is the first responder
        if baseTextField.isFirstResponder {
            // Preventing invoking `.removeLast()` when the strings are empty
            if baseValue.count > 0 {
                _ = baseValue.removeLast()
            }
            baseTextField.text = baseValue // Setting the text
        } else if heightTextField.isFirstResponder {
            if heightValue.count > 0 {
                _ = heightValue.removeLast()
            }
            heightTextField.text = heightValue
        }
    }

    @IBAction func didPressDecimalPoint(_ sender: UIButton) {
        // Checking if the TextField is the first responder
        if baseTextField.isFirstResponder {
            // Checking if the variable has a decimal point and preventing adding more decimals
            if baseValue.contains(".") {
                return
            }
            baseValue += "."
            baseTextField.text = baseValue
        } else if heightTextField.isFirstResponder {
            if heightValue.contains(".") {
                return
            }
            heightValue += "."
            heightTextField.text = heightValue
        }
    }

    @IBAction func calculateArea(_ sender: Any) {
        // Calculating and setting the area
        let base = Double(baseValue) ?? 0
        let height = Double(heightValue) ?? 0

        let area = 0.5 * base * height
        outputLabel.text = "\(area)"
    }

}

