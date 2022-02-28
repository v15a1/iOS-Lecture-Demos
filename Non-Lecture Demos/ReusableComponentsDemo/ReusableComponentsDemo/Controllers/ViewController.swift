//
//  ViewController.swift
//  ReusableComponentsDemo
//
//  Created by Visal Rajapakse on 2022-02-28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reusableImageView1: ReusableImageView!
    @IBOutlet weak var reusableImageView2: ReusableImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let image1: UIImage = #imageLiteral(resourceName: "Stars")
        let image1Name = "Hubble Deep field"

        let image2: UIImage = #imageLiteral(resourceName: "VanGogh")
        let image2Name = "Starry Starry Night"

        reusableImageView1.setup(image: image1, name: image1Name)
        reusableImageView2.setup(image: image2, name: image2Name)
    }
}

