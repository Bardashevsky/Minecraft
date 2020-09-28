//
//  DetailCollectionCell.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

class DetailCollectionCell: UICollectionViewCell {
    static var reuseID: String = "DetailCollectionCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    public func setupCell(image: String) {
        imageView.image = UIImage(named: image)
        imageView.layer.cornerRadius = 45
        
    }
    
}
