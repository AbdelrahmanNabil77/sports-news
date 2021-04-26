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
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
       private var managedContext:NSManagedObjectContext?
       
       private init () {
           managedContext = appDelegate.persistentContainer.viewContext
       }
    
    static let getInstance=CoredataModel()
    
    func getFavouriteLeagues() -> [LeagueEntity] {
          return getFavoriteArrayFromCD()
      }
    
    
    private func prepareNSManagedObject(leagueValue:LeagueEntity,leagueNSManagedObject : NSManagedObject) -> NSManagedObject{
         
         leagueNSManagedObject.setValue(leagueValue.leagueID, forKey: "lId")
         leagueNSManagedObject.setValue(leagueValue.leagueName, forKey: "title")
         leagueNSManagedObject.setValue(leagueValue.leagueBadge, forKey: "image")
         leagueNSManagedObject.setValue(leagueValue.leagueVideoLink, forKey: "link")
         
         return leagueNSManagedObject
     }
     
     private func prepareLeagueObject(leagueNSManagedObject : NSManagedObject) -> LeagueEntity{
         
         let league = LeagueEntity()
         league.leagueID = leagueNSManagedObject.value(forKey: "lId") as? String
         league.leagueName = leagueNSManagedObject.value(forKey: "title") as? String
         league.leagueBadge = leagueNSManagedObject.value(forKey: "image") as? String
         league.leagueVideoLink = leagueNSManagedObject.value(forKey: "link") as? String

         return league
     }
    
    func getFavoriteArrayFromCD() -> [LeagueEntity] {
        var favArr=[LeagueEntity]()
        var favArrCD = Array<NSManagedObject>()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavLeague")
        do{
             
            favArrCD = try managedContext!.fetch(fetchRequest)
            
            favArrCD.forEach({(object) in
                favArr.append(prepareLeagueObject(leagueNSManagedObject: object))
            
            })
        }catch{
            print("failed to load data from core data")
        }
        return favArr
    }
    
    func addFavToCD(league LeagueValue:LeagueEntity)  -> LeagueEntity{
  
        let entity = NSEntityDescription.entity(forEntityName: "FavLeague", in: managedContext!)
        
        var favItemCD = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        favItemCD = prepareNSManagedObject(leagueValue: LeagueValue, leagueNSManagedObject: favItemCD)
       
        do{
            try managedContext!.save()
            print("saved successfully")
        }catch let error as NSError{
            print(error)
        }
              return LeagueValue
    }

    func fetchFavById(indexRow :String) -> NSManagedObject?{
        var leaguesById = Array<NSManagedObject>()
        
        let predicate = NSPredicate(format: "lId == %@",indexRow)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavLeague")
        
        fetchRequest.predicate = predicate
        
        do{
            leaguesById = try managedContext!.fetch(fetchRequest)
        }
        catch{
            print("error in fetchData")
        }
        if(leaguesById.count > 0 ){
            return leaguesById[0]
        }
        return  nil
    }
    
    func deleteFavItem(indexRow:String){
         let leagueById = fetchFavById(indexRow: indexRow)
        if(leagueById == nil){
               return
           }
         managedContext?.delete(leagueById!)
       
        do{
            try managedContext!.save()

        }catch{
            print("failed to load data from core data")
        }
    }
}

