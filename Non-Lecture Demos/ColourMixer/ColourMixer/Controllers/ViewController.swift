//
//  ViewController.swift
//  ColourMixer
//
//  Created by Visal Rajapakse on 2022-02-22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Views
    // Outlets for the custom view + basic views
    @IBOutlet weak var redSlider: ReusableColorSlider!
    @IBOutlet weak var greenSlider: ReusableColorSlider!
    @IBOutlet weak var blueSlider: ReusableColorSlider!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorLabel: UILabel!

    // Properties to hold each of a colors R,G,B components
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0

    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: Setup
    private func setup() {
        redSlider.setup(title: "Red Slider", tag: 1, tint: .red)
        greenSlider.setup(title: "Green Slider", tag: 2, tint: .green)
        blueSlider.setup(title: "Blue Slider", tag: 3, tint: .blue)

        // Setting Delegates
        redSlider.delegate = self
        greenSlider.delegate = self
        blueSlider.delegate = self
        setColor()
    }

    /// Sets the color of the `colorView` and sets the `colorText` in RGB values
    private func setColor() {
        colorView.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)

        // Ternary operator to set the text color
        let textColor = (red > 140 || green > 140 || blue > 140) ? UIColor.black : UIColor.white

        // Setting the text and the color
        colorLabel.textColor = textColor
        colorLabel.text = "(R:\(Int(red)),G:\(Int(green)), B:\(Int(blue)))"
    }
}

// MARK: Extension
/// Extensions as the name suggests, is an EXTENSION to the current class
///
/// It's conventional to have additional functionality (E.g., protocol methods, feature based methods) inside an extensions
///
/// Keep in mind that only methods/functions and static constants can be embedded within extensions
///
/// Here, we are using an extension to get the functionality provided by a protocol
extension ViewController: ColorSliderProtocol {
    func didChangeValue(_ sender: UISlider) {
        let tag = sender.tag
        switch tag {
        case 1:
            print("R \(sender.value)")
            red = CGFloat(sender.value)
        case 2:
            print("G \(sender.value)")
            green = CGFloat(sender.value)
        case 3:
            print("B \(sender.value)")
            blue = CGFloat(sender.value)
        default:
            return
        }

        setColor()
    }
}

// MARK: Tutorial to connect reusables
/// To add `ReusableColorSlider` into the parent view. You will need to...
///     > First, open `Main.storyboard`
///     > Search and add a few `UIViews` (I've added them into a vertical stackview)
///     > Select one or all the `UIViews` and open the `Identity Inspector (4th from the left)`
///     > Change the `class` attribute to the custom class name
///     > Make the connections
