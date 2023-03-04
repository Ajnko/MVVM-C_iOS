//
//  FavoriteViewModel.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import Foundation
import CoreData

class FavortieViewModel {
    var reloadTableView: (() -> ())?
    
    var infoData: [NSManagedObject] = [] {
        didSet {
            self.reloadTableView
        }
    }
    
    init(){
        fetchProducts()
    }
    
    func getInfo() -> [UserInfo] {
        var information: [UserInfo] = []
        
        for data in infoData {
            let name = data.value(forKey: "name") as! String
            let surname = data.value(forKey: "surname") as! String
            let image = data.value(forKey: "image") as! String
            let age = data.value(forKey: "age") as! String
            let id: Int = data.value(forKey: "id") as! Int
            information.append(UserInfo(name: name, surname: surname, age: age, imageName: image, id: id))
        }
        return information
    }
    
    func getInfoCount() -> Int{
        return infoData.count
    }
    
    func getInfo(index: Int) -> UserInfo {
        let name = infoData[index].value(forKey: "name") as? String ?? ""
        let surname = infoData[index].value(forKey: "surname") as? String ?? ""
        let image = infoData[index].value(forKey: "image") as? String ?? ""
        let age = infoData[index].value(forKey: "age") as? String ?? ""
        let id: Int = infoData[index].value(forKey: "id") as? Int ?? 0
        
        let information = UserInfo(name: name, surname: surname, age: age, imageName: image, id: id)
        return information
    }
    
    func isInfoEmpty() -> Bool {
        return infoData.isEmpty
    }
    
    func deleteInfo(infoId: Int) {
        FavoriteDataManager.shared.deleteRecords(information: infoId) {res in
            switch res {
            case .success(_):
                print("success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchProducts(){
        FavoriteDataManager.shared.fetchFavorites{ res in
            switch res {
            case .success(let data):
                self.infoData = data
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

}

