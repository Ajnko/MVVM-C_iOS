//
//  UserInfoTableViewCell.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import UIKit
import SnapKit

class UserInfoTableViewCell: UITableViewCell {
    
    public let viewModel = UserInfoViewModel()
    
    let userImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let userNameLabel: UILabel = {
       let name = UILabel()
        name.font = .boldSystemFont(ofSize: 25)
        return name
    }()
    
    let userSurnameLabel: UILabel = {
       let surname = UILabel()
        surname.font = .boldSystemFont(ofSize: 25)
        return surname
    }()
    
    let userAgeLabel: UILabel = {
       let age = UILabel()
        age.font = .boldSystemFont(ofSize: 25)
        return age
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.left).offset(10)
            make.width.equalTo(self.snp.width).multipliedBy(0.3)
            make.height.equalTo(self.snp.height).multipliedBy(0.9)
        }
        
        self.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.top).offset(15)
            
        }
        
        self.addSubview(userSurnameLabel)
        userSurnameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            
        }
        
        self.addSubview(userAgeLabel)
        userAgeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userSurnameLabel.snp.bottom).offset(10)
            
        }
        
    }
    
    func updateUI(with model: UserInfo) {
        userNameLabel.text = model.name
        userSurnameLabel.text = model.surname
        userImage.image = UIImage(named: model.imageName)
        userAgeLabel.text = model.age
    }
    

}
