//
//  MapsTableViewCell.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

class MapsCell: UITableViewCell, CellProtocol {
    
    static var reuseID: String = "MapsCell"
    
    private let nameLocalized = NSLocalizedString("language", comment: "")
    
    private var mapList = StorageService.shared.mapsList()
    
    var cellContentView = UIView()
    var mainImageView = UIImageView()
    
    var blurContainerView = UIView()
    var blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    var nameLabel = UILabel(text: "name", font: UIFont.rMedium(14), textColor: .white)
    var descriptionLabel = UILabel(text: "Description", font: UIFont.rRegular(12), textColor: .white)
    
    var isFavContentView = UIView()
    var isFavoriteImage = UIImageView(image: "favorite", cornerRadius: 10)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        setupConstraints()
        customizationUIElements()
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let map = value as? Map else { return }
        if let image = map.images[0]["image"] {
            mainImageView.image = UIImage(named: image)
            changeLanguage(map: map)
            isFavorite(map: map)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func changeLanguage(map: Map) {
        switch nameLocalized {
        case "English":
            nameLabel.text = map.title_def
            descriptionLabel.text = map.desc_def
        default:
            nameLabel.text = map.title_ru
            descriptionLabel.text = map.desc_ru
        }
    }
    
    private func isFavorite(map: Map) {
        if mapList.contains(map) {
            isFavContentView.isHidden = false
        } else {
            isFavContentView.isHidden = true
        }
    }
    
    private func customizationUIElements() {
        cellContentView.layer.cornerRadius = 45
        cellContentView.clipsToBounds = true
        cellContentView.backgroundColor = .clear
        
        blurContainerView.backgroundColor = .clear
        blurContainerView.clipsToBounds = true
        blurContainerView.layer.cornerRadius = 32
        
        nameLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        
        isFavContentView.backgroundColor = .white
        isFavContentView.layer.cornerRadius = 20
        
        isFavoriteImage.backgroundColor = .white
        isFavoriteImage.contentMode = .scaleAspectFill
    }
    
    //MARK: - SetupConstraints -
    private func setupConstraints() {
        cellContentView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurContainerView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        isFavContentView.translatesAutoresizingMaskIntoConstraints = false
        isFavoriteImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(cellContentView)
        cellContentView.addSubview(mainImageView)
        blurContainerView.addSubview(blurView)
        blurContainerView.addSubview(nameLabel)
        blurContainerView.addSubview(descriptionLabel)
        cellContentView.addSubview(blurContainerView)
        
        cellContentView.addSubview(isFavContentView)
        isFavContentView.addSubview(isFavoriteImage)
        
        
        NSLayoutConstraint.activate([
            cellContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            cellContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
            cellContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 11),
            cellContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
            
            mainImageView.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor),
            mainImageView.topAnchor.constraint(equalTo: cellContentView.topAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor),
            
            isFavContentView.heightAnchor.constraint(equalToConstant: 40),
            isFavContentView.widthAnchor.constraint(equalToConstant: 40),
            isFavContentView.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 18),
            isFavContentView.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -18),
            
            isFavoriteImage.centerXAnchor.constraint(equalTo: isFavContentView.centerXAnchor),
            isFavoriteImage.centerYAnchor.constraint(equalTo: isFavContentView.centerYAnchor),
            isFavoriteImage.heightAnchor.constraint(equalToConstant: 32),
            isFavoriteImage.widthAnchor.constraint(equalToConstant: 32),
            
            blurContainerView.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -8),
            blurContainerView.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 50),
            blurContainerView.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -50),
            blurContainerView.heightAnchor.constraint(equalToConstant: 64),
            
            blurView.leadingAnchor.constraint(equalTo: blurContainerView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: blurContainerView.trailingAnchor),
            blurView.topAnchor.constraint(equalTo: blurContainerView.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: blurContainerView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: blurContainerView.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: blurContainerView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: blurContainerView.trailingAnchor, constant: -24),
            nameLabel.heightAnchor.constraint(equalToConstant: 14),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: blurContainerView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: blurContainerView.trailingAnchor, constant: -24),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 14),
        
        ])
        
    }

}
