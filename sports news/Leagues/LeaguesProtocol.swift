//
//  LeaguesProtocol.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation

protocol LeaguesPresentProtocol{
    func getLeagues()
    func getLeagueFromNetwork()
    func getFavouriteLeagues()
}

protocol LeaguesShowProtocol {
    var sportName : String? { get set }
    func displayLeagues(LeaguesArray array: Array<LeagueEntity>)
}
