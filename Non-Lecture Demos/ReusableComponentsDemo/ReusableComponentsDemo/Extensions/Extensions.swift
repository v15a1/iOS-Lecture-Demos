//
//  Extensions.swift
//  ReusableComponentsDemo
//
//  Created by Visal Rajapakse on 2022-02-28.
//

import UIKit

extension UIView {
    /// Loads the UIView from the XIB (Nib is the more popular name. It stems from Swifts predecessor -- Objective-C)
    /// - Parameter nibName: Name of the XIB/Nib in string
    /// - Returns: The UIView corresponding to the given `nibName`
    func loadFromNib(_ nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self)) // Searching the bundle directory for the nibName
        let nib = UINib(nibName: nibName, bundle: bundle) // Caching the view in memory
        return nib.instantiate(withOwner: self, options: nil).first as? UIView // instantiating and returning the view as an optional
    }
}
