//
//  FavoriteTableViewCell.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import UIKit
import SnapKit

class FavoriteTableViewCell: UITableViewCell {

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
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
    }
    
    func updateUI(with model: UserInfo) {
        userNameLabel.text = model.name
        userImage.image = UIImage(named: model.imageName)
    }

}
