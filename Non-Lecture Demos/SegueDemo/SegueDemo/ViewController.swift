//
//  ViewController.swift
//  SegueDemo
//
//  Created by Visal Rajapakse on 2022-03-02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button2: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didPressButton2(_ sender: Any) {
        performSegue(withIdentifier: "Segue1", sender: self)
    }

}

