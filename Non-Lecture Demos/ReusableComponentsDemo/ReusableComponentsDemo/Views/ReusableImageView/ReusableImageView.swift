//
//  ReusableImageView.swift
//  ReusableComponentsDemo
//
//  Created by Visal Rajapakse on 2022-02-28.
//

import UIKit

class ReusableImageView: UIView {

    let nibName = "ReusableImageView"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageName: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        guard let view = self.loadFromNib("ReusableImageView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }

    func setup(image: UIImage, name: String) {
        imageName.text = name
        imageView.image = image
    }
}
