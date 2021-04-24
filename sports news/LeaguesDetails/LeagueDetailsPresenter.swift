//
//  LeagueDetailsPresenter.swift
//  sports news
//
//  Created by MACOS on 4/23/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation

class LeagueDetailsPresenter : LeaguesDetailsPresenterContract , Avilability{
 
    
        func checkAvailability() -> Bool {
            return Reachability.Connection()
        }
    
    var controller : LeaguesDetailsControllerContract?
    
    func getUpComingEvents(withID id: String) {
        if(checkAvailability()){
        APIs.searchEventsKey = id
        NetworkService.INSTANCE.getResponse(withURL: URL(string: "\(APIs.pastEventsPerLeagueURL)\(APIs.searchEventsKey!)")!, ProcessResult: {
            json in
            let upComingEvents = Mapper.jsonToEventList(fromJson: json)
            self.controller?.displayUpcomingEvents(listOfUpcomingEvents: upComingEvents)
        })
        }
    }

    func getPastEvents(withID id: String) {
        print("getPastEvents")
        if(checkAvailability()){
        APIs.searchEventsKey = id
        NetworkService.INSTANCE.getResponse(withURL: URL(string: "\(APIs.pastEventsPerLeagueURL)\(APIs.searchEventsKey!)")!, ProcessResult: {
            json in
            let pastEvents = Mapper.jsonToEventList(fromJson: json)
            self.controller?.displayPastEvents(listOfPastEvents: pastEvents)
            })
        }
    }
    
    func getTeams(withName name: String) {
        print("getTeams")
        if(checkAvailability()){
        APIs.searchTeamKey = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        NetworkService.INSTANCE.getResponse(withURL: URL(string: "\(APIs.allTeamsPerLeagueURL)\(APIs.searchTeamKey!)")!, ProcessResult: {
            json in
            let teams = Mapper.jsonToTeamList(fromJson: json)
            self.controller?.displayTeams(listOfTeams: teams)
        })
        }
    }
    
    func getAllData(forLeague league: LeagueEntity) {
        print("getAllDataStart")
        getPastEvents(withID: league.leagueID!)
        getUpComingEvents(withID: league.leagueID!)
        getTeams(withName: league.leagueName!)
        print("getAllDataEnd")
    }
    

    func deleteFromLocal(League league: LeagueEntity) {
//        if let id = league.leagueID {
//        CoreDataHandler.getCoreHandlerInstance().deleteFromEntity(id: id)
//            self.controller?.updateFavourite(isSelected: false)
//        }
    }

    func checkLeagueFavourite(withID id : String) {
//        if let val = CoreDataHandler.getCoreHandlerInstance().fetchLeagueById(id: id){
//            self.controller?.updateFavourite(isSelected: true)
//        }
//        else{
//            self.controller?.updateFavourite(isSelected: false)
//        }
    }

    func addLeagueToLocal(League league: LeagueEntity) {
//    CoreDataHandler.getCoreHandlerInstance().insertInLocalLeagues(league: league)
//        self.controller?.updateFavourite(isSelected: true)

    }


}
    
