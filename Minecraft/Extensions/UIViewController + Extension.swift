//
//  UIViewController + Extension.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?, complition: (() -> ())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            guard let complition = complition else { return }
            complition()
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
