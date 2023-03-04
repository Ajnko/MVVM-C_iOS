//
//  ViewController.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    public let viewModel = UserInfoViewModel()
    
    let tableView: UITableView = {
       let tableview = UITableView()
        tableview.rowHeight = 200
        tableview.register(UserInfoTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(saveButtonClicked))
        
        
        
    }
    func initView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    
    @objc func saveButtonClicked(){
        let vc = FavoriteViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getUserDataCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserInfoTableViewCell
        cell.updateUI(with: viewModel.getUserInfo(index: indexPath.item))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UserInfoModel.create(jewellary: viewModel.getUserInfo(index: indexPath.item))
        navigationController?.pushViewController(vc, animated: true)
    }
}
