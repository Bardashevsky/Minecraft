//
//  GuideCell.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

class GuideCell: UITableViewCell, CellProtocol {
    static var reuseID: String = "GuideCell"
    
    
    var titleLabel = UILabel(text: "Инструкция по использованию приложения", font: UIFont.rMedium(32), textColor: .black)
    var firstGraph = UILabel(text: "1. Выберите понравившуюся картинку или мод", font: UIFont.rRegular(16), textColor: .black)
    var firstImage = UIImageView(image: "guide1", cornerRadius: 45)
    var jumpLeagueLabel = UILabel(text: "Jump League", font: UIFont.rMedium(24), textColor: .black)
    var jmLLabel = UILabel(text: "This is a simple parkour map that overcomes obstacles using command blocks and must defeat the final boss asdsada asdas asd sadsaasasd", font: UIFont.rRegular(16), textColor: .black)
    
    var secondGraph = UILabel(text: "2. Нажмите кнопку скачать и дождитесь пока карта или мод загрузятся на устройство.", font: UIFont.rRegular(16), textColor: .black)
    
    var downloadLabel = UILabel(text: "Download", font: UIFont.rMedium(24), textColor: .black)
    var downloadingLabel = UILabel(text: "Downloading", font: UIFont.rMedium(24), textColor: .black)
    
    var thirdGraph = UILabel(text: "3. Нажмите кнопку установить, откроется Minecraft и начнется импорт в игру. Дождитесь пока импорт закончится.", font: UIFont.rRegular(16), textColor: .black)
    
    var install = UILabel(text: "Install", font: UIFont.rMedium(24), textColor: .black)
    
    var thirdImage = UIImageView(image: "guide3", cornerRadius: 10)
    
    var fourthGraph = UILabel(text: "4. Скачанная карта появится в разделе Миры.", font: UIFont.rRegular(16), textColor: .black)
    var fourthImage = UIImageView(image: "guide4", cornerRadius: 10)
    
    var fifthGraph = UILabel(text: "5. Наслаждайтесь игрой :)", font: UIFont.rRegular(16), textColor: .black)
    var fifthImage = UIImageView(image: "guide5", cornerRadius: 10)
    var fifthGraph2 = UILabel(text: "Если вы установили моды. то они появятся в соответствующием разделе в настройках карты.", font: UIFont.rRegular(16), textColor: .black)
    var fifthImage2 = UIImageView(image: "guide52", cornerRadius: 10)
    var fifthGraph3 = UILabel(text: "Наслаждайтесь игрой :)", font: UIFont.rRegular(16), textColor: .black)
    var fifthImage3 = UIImageView(image: "guide53", cornerRadius: 10)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setupConstraints()
        customization()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customization() {
        downloadLabel.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.5)
        downloadLabel.layer.cornerRadius = 24
        downloadLabel.textAlignment = .center
        downloadLabel.clipsToBounds = true
        
        downloadingLabel.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.5)
        downloadingLabel.layer.cornerRadius = 24
        downloadingLabel.textAlignment = .center
        downloadingLabel.clipsToBounds = true
        
        install.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.5)
        install.layer.cornerRadius = 24
        install.textAlignment = .center
        install.clipsToBounds = true
        
//        titleLabel.preferredMaxLayoutWidth = self.bounds.size.width
    }
    
    private func setupConstraints() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, firstGraph, firstImage, jumpLeagueLabel, jmLLabel, secondGraph, downloadLabel, downloadingLabel, thirdGraph, install, thirdImage, fourthGraph, fourthImage, fifthGraph, fifthImage, fifthGraph2, fifthImage2, fifthGraph3, fifthImage3], axis: .vertical, spacing: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
//        stackView.alignment = .leading
        self.addSubview(stackView)
        
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            firstImage.heightAnchor.constraint(equalToConstant: 150),
            downloadLabel.heightAnchor.constraint(equalToConstant: 48),
            downloadingLabel.heightAnchor.constraint(equalToConstant: 48),
            install.heightAnchor.constraint(equalToConstant: 48),
            thirdImage.heightAnchor.constraint(equalToConstant: 150),
            fourthImage.heightAnchor.constraint(equalToConstant: 150),
            fifthImage.heightAnchor.constraint(equalToConstant: 150),
            fifthImage2.heightAnchor.constraint(equalToConstant: 150),
            fifthImage3.heightAnchor.constraint(equalToConstant: 150),
            
        ])
    }

}
