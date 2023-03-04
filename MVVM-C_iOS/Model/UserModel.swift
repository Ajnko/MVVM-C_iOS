//
//  UserModel.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import Foundation
import UIKit

struct UserInfo {
    let name        : String
    let surname     : String
    let age         : String
    let imageName   : String
    let id          : Int
}

struct UserInfoDetails{
    
    static let info: [UserInfo] = [
        UserInfo(name: "Davron", surname: "Fayziev", age: "30", imageName: "davron", id: 1),
        UserInfo(name: "Timur", surname: "Alixonov", age: "24", imageName: "timur", id: 2),
        UserInfo(name: "Inson", surname: "Odamov", age: "123", imageName: "inson", id: 3),
        UserInfo(name: "Odam", surname: "Insonov", age: "111", imageName: "odam", id: 4 )
    ]
}

