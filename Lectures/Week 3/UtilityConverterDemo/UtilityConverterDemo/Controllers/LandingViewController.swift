//
//  LandingViewController.swift
//  UtilityConverterDemo
//
//  Created by Visal Rajapakse on 2022-03-02.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Performing manual segues
    @IBAction func didPressSegue(_ sender: UIButton) {
        performSegue(withIdentifier: "LandingSegue", sender: self)
    }

}
