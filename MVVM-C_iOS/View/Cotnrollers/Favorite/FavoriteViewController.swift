//
//  FavoriteViewController.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import UIKit
import SnapKit

class FavoriteViewController: UIViewController {
    
    var favoriteViewModel = FavortieViewModel()
    
    let tableView: UITableView = {
       let tableview = UITableView()
        tableview.rowHeight = 200
        tableview.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        favoriteViewModel.reloadTableView = { [unowned self] in
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationController?.navigationBar.topItem?.title = "Favorites"
        favoriteViewModel.fetchProducts()
    }

}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteViewModel.getInfoCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteTableViewCell
        
        cell.updateUI(with: favoriteViewModel.getInfo(index: indexPath.item))
        return cell
    }
}
