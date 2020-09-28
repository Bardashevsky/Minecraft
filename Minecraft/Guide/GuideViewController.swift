//
//  GuideViewController.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

class GuideViewController: UIViewController {

    private var tableView: CustomTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupTableView()
    }
    
    //MARK: - UI Elements -
    private func setupTableView() {
        self.tableView = CustomTableView(frame: self.view.bounds)
        self.tableView.backgroundColor = .clear
        self.tableView.allowsSelection = false
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
//        self.tableView.register(GuideCell.self, forCellReuseIdentifier: GuideCell.reuseID)
    }
}

//MARK: - UITableViewDataSource -
extension GuideViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = GuideCell()
        return cell
    }
}

//MARK: - UITableViewDelegate -
extension GuideViewController: UITableViewDelegate {
    
}
