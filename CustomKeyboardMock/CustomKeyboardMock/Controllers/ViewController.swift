//
//  ViewController.swift
//  CustomKeyboardMock
//
//  Created by Visal Rajapakse on 2022-02-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customKeyboard: CustomKeyboard!
    @IBOutlet weak var calculatorLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!


    private var operandOne: String = ""
    private var operandTwo: String = ""
    private var expOperator: Operator = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customKeyboard.delegate = self
    }
}

extension ViewController: CustomKeyboardProtocol {
    func didPressNumber(_ number: Int) {
        if expOperator != nil {
            operandTwo += "\(number)"
        } else {
            operandOne += "\(number)"
        }
        inputLabel.text = "\(operandOne) \(expOperator.rawValue) \(operandTwo)"
    }

    func didPressOperator(_ op: Operator) {
        if op == .equate {
            let operandOne = Int(operandOne)
            let operandTwo = Int(operandTwo)
            let answer: Int

            if let op1 = operandOne, let op2 = operandTwo {
                if expOperator == .substract {
                    answer = op1 - op2
                } else if expOperator == .add {
                    answer = op1 + op2
                } else {
                    answer = 0
                }
            }
        } else {
            expOperator = op
        }
    }


}
