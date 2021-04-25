//
//  DatabaseModel.swift
//  sports news
//
//  Created by AbdElRahman Nabil on 4/25/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class CoredataModel {
    private init() {
    }
    
    static let getInstance=CoredataModel()
    
    func getFavoriteArrayFromCD() -> [FavItem] {
        var favArr=[FavItem]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavLeague")
        do{
            let favArrCD = try managedContext.fetch(fetchRequest)
            
            for favItemCD in favArrCD{
                let title = favItemCD.value(forKey: "title") as! String
                let link = favItemCD.value(forKey: "link") as! String
                let image = favItemCD.value(forKey: "image") as! String
                let lId = favItemCD.value(forKey: "lId") as! String
                let favItem = FavItem(image: image, title: title, link: link,lId: lId)
                favArr.append(favItem)
            }
        }catch{
            print("failed to load data from core data")
        }
        return favArr
    }
    
    func addFavToCD(favItem:FavItem){
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //2
        let managedContext = appDelegate.persistentContainer.viewContext
        //3
        let entity = NSEntityDescription.entity(forEntityName: "FavLeague", in: managedContext)
        //4
        let favItemCD = NSManagedObject(entity: entity!, insertInto: managedContext)
        favItemCD.setValue(favItem.image, forKey: "image")
        favItemCD.setValue(favItem.title, forKey: "title")
        favItemCD.setValue(favItem.link, forKey: "link")
        favItemCD.setValue(favItem.lId, forKey: "lId")
        //5
        do{
            try managedContext.save()
            print("saved successfully")
        }catch let error as NSError{
            print(error)
        }
    }
    
    func deleteFavItem(indexRow:Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavLeague")
        do{
            let favArrCD = try managedContext.fetch(fetchRequest)
            managedContext.delete(favArrCD[indexRow])
        }catch{
            print("failed to load data from core data")
        }
    }
}
