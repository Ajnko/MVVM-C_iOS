//
//  UserInfoViewModel.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import Foundation

class UserInfoViewModel {
    let data = UserInfoDetails.info
    
    func getUserDataCount() -> Int {
        return data.count
    }
    
    func getUserInfo(index: Int) -> UserInfo{
        
        let username = data[index].name
        let usersuname = data[index].surname
        let userimage = data[index].imageName
        let userage = data[index].age
        let id = data[index].id
        
        let info = UserInfo(name: username, surname: usersuname, age: userage, imageName: userimage, id: id)
        
        return info
    }
}

