//
//  UIImageView + Extension.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

extension UIImageView {
    convenience init(image: String, cornerRadius: CGFloat) {
        self.init()
        self.image = UIImage(named: image)
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
    }
}
