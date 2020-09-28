//
//  DetailViewController.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    public var viewModel: DetailViewModel!
    
    private var map: Map!

    weak var delegate: ReloadTableViewDelegate!
    private var db = StorageService.shared
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.map.bind { [unowned self] in bindMap(map: $0) }
    }
    
    //MARK: - Binding -
    private func bindMap(map: Map?) {
        guard let map = map else { return }
        self.map = map
    }
    
    //MARK: - Actions -
    @IBAction func downloadAction(_ sender: UIButton) {
        viewModel.addToFavorite {
            self.showAlert(title: "Карта добавлена", message: nil)
        } filed: { () -> ()? in
            showAlert(title: "Карта уже добавлена", message: nil)
        }
        self.delegate.reloadTebleView()
    }
}

//MARK: - UITableViewDataSource -
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as! DetailCell
        cell.setupData(map: map)
        return cell
    }
}


//MARK: - UICollectionViewDataSource  -
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  map.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionCell.reuseID, for: indexPath) as! DetailCollectionCell
        cell.setupCell(image: map.images[indexPath.item]["image"]!)
        return cell
    }
}
