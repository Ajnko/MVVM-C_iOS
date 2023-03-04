//
//  UserInfoViewController.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import UIKit
import SnapKit


class UserInfoViewController: UIViewController {
    
    public var info: UserInfo?
    let viewModel: InfoViewModel
    
    init(vm: InfoViewModel) {
        viewModel = vm
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let userImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let userName: UILabel = {
        let name = UILabel()
        name.font = .boldSystemFont(ofSize: 25)
        return name
    }()
    
    let userSurname: UILabel = {
       let surname = UILabel()
        surname.font = .boldSystemFont(ofSize: 25)
        return surname
    }()
    
    let userAge: UILabel = {
       let age = UILabel()
        age.font = .boldSystemFont(ofSize: 25)
        return age
    }()
    
    let favoriteButton: UIButton = {
      let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
//        button.addTarget(self, action: #selector(favoriteButtonDidClicked), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        view.backgroundColor = .systemBackground

    }
    
    func initView(){
        
        view.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(25)
            make.width.equalTo(view.snp.width).multipliedBy(0.45)
            make.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
        
        view.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userImage.snp.bottom).offset(20)
        }
        
        view.addSubview(userSurname)
        userSurname.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userName.snp.bottom).offset(15)
        }
        
        view.addSubview(userAge)
        userAge.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userAge.snp.bottom).offset(15)
        }
        
        view.addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.top)
            make.right.equalTo(view.snp.right).offset(-20)
        }
    }
    
    func updateUI(with model: UserInfo) {
        userImage.image = UIImage(named: model.imageName)
        userName.text = model.name
        userSurname.text = model.surname
        userAge.text = model.age
    }
    
    @objc func favoriteButtonDidClicked(){
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    


}
