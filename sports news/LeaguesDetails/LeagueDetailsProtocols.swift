//
//  LeagueDetailsProtocols.swift
//  sports news
//
//  Created by MACOS on 4/23/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation

protocol LeaguesDetailsPresenterContract {
   func getUpComingEvents(withID id: String)
   func getPastEvents(withID id: String)
   func getTeams(withName name: String)
   func getAllData(forLeague league: LeagueEntity)
   func addLeagueToLocal(League league: LeagueEntity)
    func checkLeagueFavourite(withID id : String)
    func deleteFromLocal(League league: LeagueEntity)
}

protocol LeaguesDetailsControllerContract {
    func displayUpcomingEvents(listOfUpcomingEvents events: Array<EventEntity>)
    func displayPastEvents(listOfPastEvents events: Array<EventEntity>)
    func displayTeams(listOfTeams teams: Array<TeamEntity>)
    func updateFavourite(isSelected: Bool)

}
