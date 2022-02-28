//
//  Extensions.swift
//  ReusableComponentsDemo
//
//  Created by Visal Rajapakse on 2022-02-28.
//

import UIKit

extension UIView {
    func loadFromNib(_ nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
