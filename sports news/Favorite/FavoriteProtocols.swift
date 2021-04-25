//
//  FavoriteProtocols.swift
//  sports news
//
//  Created by AbdElRahman Nabil on 4/25/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation
protocol FavoritePresenterContract{
    func getFavArr()
    func deleteFavItem(indexRow:Int)
    func addFavItem(favItem:FavItem)
}

protocol FavoriteControllerContract{
    func displayFavoriteArr(favArr:[FavItem])
    //func deleteItem()
    
}
