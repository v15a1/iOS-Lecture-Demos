//
//  ReusableColorSlider.swift
//  ColourMixer
//
//  Created by Visal Rajapakse on 2022-02-22.
//

import UIKit

/// What is a `protocol`?
/// A protocol is similar to an interface. It imposes "rules" that a conforming class should follow.
protocol ColorSliderProtocol: AnyObject {
    func didChangeValue(_ sender: UISlider)
}

class ReusableColorSlider: UIView {

    // Ensure that this and the class name are equal
    private let nibName: String = "ReusableColorSlider"

    // MARK: Properties
    private var contentView: UIView!

    // Delegate that we need to assign other functionality to. (Refer the end of this file for info on delegation)
    weak var delegate: ColorSliderProtocol?

    // MARK: Views
    @IBOutlet weak var sliderTitle: UILabel!
    @IBOutlet weak var colorSlider: UISlider!

    // MARK: Life cycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    /// Loads and sets the custom view to `self`.
    private func commonInit() {
        /// `guard` is another way to handle optional binding. Compared to it's counterparts `if let` and `if`, this requires the exit of the current scope.
        guard let view = loadFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    private func loadFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    /// Setting up various aspects of the custom View
    /// - Parameters:
    ///   - title: Title of the Slider view
    ///   - tag: Tag is like an integer ID you can use to identify the view
    ///   - tint: Tint of the slider
    public func setup(title: String,tag: Int, tint: UIColor = UIColor.systemBlue) {
        sliderTitle.text = title
        colorSlider.tintColor = tint
        colorSlider.tag = tag
    }

    // Actino to run when slider is moved
    @IBAction func didMoveSlider(_ sender: UISlider) {
        delegate?.didChangeValue(sender)
    }
}

// MARK: Checklist after creating an `Xib` file and the swift file
///
/// 1. Go to the `CustomKeyboard.xib`
///     > left view hierarchy
///     > `placeholders`
///     > `File owner`
///     > right Attribute inspector
///     > Set class to the corresponding Swift file (`CustomKeyboard`)
///
/// 2. override BOTH init methods
/// 3. Add Nib Loading methods to constructor

// MARK: Delegation
/// Delegation, although self explanatory, is when you try to "pass responsibility" from one class to another
///     > In this class we have a property called `delegate: ColorSliderProtocol?` which will hold any value that conforms to `ColorSliderProtocol`
///     > Although `ReusableColorSlider` "holds" the sliders, it has no way to get the values of the slider and change the color in the parent view (ViewController.swift)
///     > What we can do to fix this is make `ViewController` a delegate of `ReusableColorSlider` (Shown in lines 37 - 40 in `ViewController.swift`). This way we can say that `ReusableColorSlider` is delegating the functionality defined `ColorSliderProtocol` to `ViewController`
///     > Hence assigning the responsibility of the whatever `didChangeValue(_ sender: UISlider)` needs to do, to `ViewController` (Line 66 in `ViewController.swift`)


/// // MARK: Helpful links
/// Custom Views : https://betterprogramming.pub/swift-3-creating-a-custom-view-from-a-xib-ecdfe5b3a960
/// Delegation : https://www.appypie.com/delegation-swift-how-to
