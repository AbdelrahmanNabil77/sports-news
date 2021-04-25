//
//  FavoritePresenter.swift
//  sports news
//
//  Created by AbdElRahman Nabil on 4/25/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation
class FavoritePresenter:FavoritePresenterContract{
    var favoriteVC:FavoriteControllerContract?
    
    let databaseInstance = CoredataModel.getInstance
    
    init() {
        
    }
    
    init(favoriteVC:FavoriteControllerContract) {
        print("inside presenter init")
        self.favoriteVC=favoriteVC
    }
   
    func getFavArr() {
        print("getFavArr and the count is \(databaseInstance.getFavoriteArrayFromCD().count)")
        favoriteVC!.displayFavoriteArr(favArr: databaseInstance.getFavoriteArrayFromCD())
    }
    
    func deleteFavItem(indexRow: Int) {
        databaseInstance.deleteFavItem(indexRow: indexRow)
        favoriteVC!.displayFavoriteArr(favArr: databaseInstance.getFavoriteArrayFromCD())
    }
    
    func addFavItem(favItem: FavItem) {
        databaseInstance.addFavToCD(favItem: favItem)
        
    }
    
    
}
