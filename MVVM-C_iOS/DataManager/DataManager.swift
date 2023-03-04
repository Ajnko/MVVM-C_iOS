//
//  DataManager.swift
//  MVVM-C_iOS
//
//  Created by Abdulbosid Jalilov on 03/03/23.
//

import Foundation
import CoreData
import UIKit

class FavoriteDataManager {
    
    static let shared = FavoriteDataManager()
    
    //MARK: - Save to info
    
    func saveToInfo(information: UserInfo, complitionHandler: @escaping(Result<Bool, Error>) -> Void){
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            complitionHandler(.failure(NSError(domain: "App Delegate not found", code: 123)))
            return
        }
        
        let context = delegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let favoriteUser = NSManagedObject(entity: entity!, insertInto: context)
        favoriteUser.setValue(information.name, forKeyPath: "name")
        favoriteUser.setValue(information.surname, forKeyPath: "surname")
        favoriteUser.setValue(information.age, forKeyPath: "age")
        favoriteUser.setValue(information.imageName, forKeyPath: "image")
        
        do {
            try context.save()
            complitionHandler(.success(true))
        }
        
        catch {
            complitionHandler(.failure(error))
        }
        
    }
    
    func fetchFavorites(complitionHandler: @escaping(Result<[NSManagedObject], Error>) -> Void) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            complitionHandler(.failure(NSError(domain: "App Delegate not found", code: 124)))
            return
        }
        
        let managedContext = delegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        do {
            let fav = try managedContext.fetch(fetchRequest)
            complitionHandler(.success(fav))
        }
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    //MARK: - delete records
    
    func deleteRecords(information: Int, copmlition: @escaping(Result<Bool, Error>) -> Void) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            copmlition(.failure(NSError(domain: "App delegate not found", code: 404, userInfo: nil)))
            return
        }
        
        let ctx = delegate.persistentContainer.viewContext
        let requestDel = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        requestDel.returnsObjectsAsFaults = false
        do {
            let arrUsrObj = try ctx.fetch(requestDel)
            for usrObj in arrUsrObj as! [NSManagedObject] {
                if usrObj.value(forKey: "id") as! Int == information{
                    ctx.delete(usrObj)
                }
            }
        }
        
        catch {
            print("Failed")
        }
        
        do {
            try ctx.save()
        }
        
        catch {
            print("Failed saving")
        }
        
    }
    
    func chekItemExist(id: Int) -> Bool{
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        let managedContext = delegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            let count = try managedContext.count(for: fetchRequest)
            if count > 0 {
                return true
            }
            else {
                return false
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
}

