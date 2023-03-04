//
//  UserInfoModel.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import UIKit

class UserInfoModel {
    static func create(jewellary: UserInfo) -> UIViewController {
        let dataManager = FavoriteDataManager()
        let vm = InfoViewModel(manager: dataManager, info: jewellary)
        let vc = UserInfoViewController(vm: vm)

        return vc
    }
}

