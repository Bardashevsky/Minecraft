//
//  UILabel + Extension.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, textColor: UIColor) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
        
        self.backgroundColor = .clear
        self.numberOfLines = 0
    }
}
