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

    private var calcString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customKeyboard.delegate = self
    }
}

extension ViewController: CustomKeyboardProtocol {
    func didPressNumber(_ number: Int) {
        calcString += "\(number)"
        calculatorLabel.text = calcString
    }

    func didPressOperator(_ op: Operator) {
        calcString += op.rawValue
        calculatorLabel.text = calcString
    }


}
