//
//  ViewController.swift
//  UtilityConverterDemo
//
//  Created by Visal Rajapakse on 2022-03-02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keyboard: ReusableView!
    
    @IBOutlet var textfields: [UITextField]! // Outlet collectionview to hold the textfields

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the delegate of the keyboard.
        keyboard.delegate = self
        // Looping throught each texfield to disable the default keyboard
        textfields.forEach { textfield in
            textfield.inputView = UIView()
            textfield.inputAccessoryView = UIView()
        }
    }
}

// MARK: Implementation of the Reusable protocol methods
extension ViewController: ReusableProtocol {
    func didPressNumber(_ number: String) {
        print("Pressed number in VC \(number)")
    }

    func didPressDecemialNegative(_ value: String) {
        print("Pressed Decimal or negative in VC \(value)")
    }

    func didPressDelete() {
        print("Pressed delete")
    }


}

