//
//  CustomTableView.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//


import UIKit

class CustomTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.backgroundColor = .white
        self.separatorStyle = .none
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.tableHeaderView?.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
