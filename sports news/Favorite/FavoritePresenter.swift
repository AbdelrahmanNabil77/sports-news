////
////  FavoritePresenter.swift
////  sports news
////
////  Created by AbdElRahman Nabil on 4/25/21.
////  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
////
//
//import Foundation
//class FavoritePresenter:FavoritePresenterContract{
// 
//    var favoriteVC:FavoriteControllerContract?
//    
//    let databaseInstance = CoredataModel.getInstance
//    
//    init() {
//        
//    }
//    
//    init(favoriteVC:FavoriteControllerContract) {
//        print("inside presenter init")
//        self.favoriteVC=favoriteVC
//    }
//    
//   
//    func getFavArr(id : String) {
//        print("getFavArr and the count is \(databaseInstance.getFavoriteArrayFromCD().count)")
//        if let vai = databaseInstance.fetchFavById(indexRow: id){
//            self.favoriteVC?.updateFavourite(isSelected: true)
//        }else{
//            self.favoriteVC?.updateFavourite(isSelected: false)
//        }
//        
//      //  favoriteVC!.displayFavoriteArr(favArr: databaseInstance.getFavoriteArrayFromCD())
//    }
//    
//    func deleteFavItem(indexRow: FavItem) {
//        if let indexRow = indexRow.lId{
//        databaseInstance.deleteFavItem(indexRow: indexRow)
//      //  favoriteVC!.displayFavoriteArr(favArr: databaseInstance.getFavoriteArrayFromCD())
//            favoriteVC?.updateFavourite(isSelected: false)
//        }
//    }
//    
//    func addFavItem(favItem: FavItem) {
//        databaseInstance.addFavToCD(favItem: favItem)
//        self.favoriteVC?.updateFavourite(isSelected: true)
//        
//    }
//    
//    
//}
