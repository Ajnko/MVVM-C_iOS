//
//  InfoViewModel.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import UIKit

class InfoViewModel {
    
    var isFav = true
    
    private var item: UserInfo {
        didSet {
            self.updateUI!()
        }
    }
    
    var updateUI: (()->())?
    var dataManager: FavoriteDataManager
    
    init(manager: FavoriteDataManager, info: UserInfo) {
        self.dataManager = manager
        self.item = info
    }
    
    func getItems() -> UserInfo? {
        
        return item
        
    }
    
    func isFavorite() -> Bool{
        isFav = dataManager.chekItemExist(id: item.id)
        return isFav
    }
    
    func manageFavorites(){
        if isFav{
            deleteFavorites()
        }
        else {
            saveToFavorites()
        }
    }
    
    //MARK: - Save to Favorites
    func saveToFavorites(){
        dataManager.saveToInfo(information: item){ res in
            switch res {
                
            case .success(_): break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Delete
    func deleteFavorites(){
        dataManager.deleteRecords(information: item.id){ del in
            switch del{
            case .success(_): break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
