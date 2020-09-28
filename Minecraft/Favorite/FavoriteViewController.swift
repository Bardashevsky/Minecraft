//
//  FavoriteViewController.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

class FavoriteViewController: UIViewController {

    private var viewModel: FavoriteViewModel!
    private var tableView: UITableView!
    private var mapsArray = [Map]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        
        viewModel = FavoriteViewModel()
        viewModel.maps.bind { [unowned self] in self.bintMapsList(maps: $0) }
        viewModel.fetchMapsList()
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchMapsList()
        tableView.reloadData()
    }
    
    //MARK: - Binding -
    private func bintMapsList(maps: [Map]?) {
        guard let maps = maps else { return }
        mapsArray = maps
    }
    
    
    //MARK: - UI Elements -
    private func setupTableView() {
        self.tableView = CustomTableView(frame: self.view.bounds)
        self.tableView.backgroundColor = .clear
        self.tableView.dataSource = self
        self.tableView.delegate = self
//        self.tableView.register(MapsCell.self, forCellReuseIdentifier: MapsCell.reuseID)
        self.view.addSubview(self.tableView)
    }
    
    

}

//MARK: - UITableViewDataSource -
extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mapsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MapsCell()
        cell.configure(with: mapsArray[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate -
extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height / 3
    }
}
