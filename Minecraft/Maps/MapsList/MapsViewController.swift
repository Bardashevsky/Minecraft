//
//  MapsViewController.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

protocol ReloadTableViewDelegate: class {
    var indexToReload: IndexPath { get }
    func reloadTebleView()
}

class MapsViewController: UIViewController {
    
    private var tableView: UITableView!
    private var mapsArray = [Map]()
    private var viewModel: MapsViewModel!
    private var indexPath = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        viewModel = MapsViewModel()
        viewModel.maps.bind { [unowned self] in self.bindMaps(maps: $0) }
        viewModel.fetchMapsList()
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: - Binding -
    private func bindMaps(maps: [Map]?) {
        guard let maps = maps else { return }
        mapsArray = maps
    }
    
    //MARK: - UI Elements -
    private func setupTableView() {
        self.tableView = CustomTableView(frame: self.view.bounds)
        self.tableView.backgroundColor = .clear
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(MapsCell.self, forCellReuseIdentifier: MapsCell.reuseID)
        self.view.addSubview(self.tableView)
    }
    
    

}

//MARK: - UITableViewDataSource -
extension MapsViewController: UITableViewDataSource {
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
extension MapsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height / 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(identifier: "DetailIdentifier") as! DetailViewController
        self.indexPath = indexPath
        detailVC.viewModel = DetailViewModel(map: mapsArray[indexPath.row])
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension MapsViewController: ReloadTableViewDelegate {
    var indexToReload: IndexPath {
        return self.indexPath
    }
    
    
    func reloadTebleView() {
        self.tableView.reloadRows(at: [indexToReload], with: .fade)
    }
}
