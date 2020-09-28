//
//  UIFont + Extension.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

extension UIFont {
    
    static func rLight(_ size: CGFloat) -> UIFont? {
        return UIFont.init(name: "Roboto-Light", size: size)
    }
    
    static func rMedium(_ size: CGFloat) -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: size)
    }
    
    static func rRegular(_ size: CGFloat) -> UIFont? {
        return UIFont.init(name: "Roboto-Regular", size: size)
    }
}
