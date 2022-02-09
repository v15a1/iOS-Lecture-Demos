//
//  CustomKeyboard.swift
//  CustomKeyboardMock
//
//  Created by Visal Rajapakse on 2022-02-09.
//

import UIKit

class CustomKeyboard: UIView {

    // Ensure that this and the class name are equal
    private let nibName: String = "CustomKeyboard"
    private var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        guard let view = loadFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view

        self.contentView.backgroundColor = .red
    }

    func loadFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

}

/// MARK: Checklist after creating an `Xib` file and the swift file
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


/// // MARK: Helpful links
/// https://betterprogramming.pub/swift-3-creating-a-custom-view-from-a-xib-ecdfe5b3a960
