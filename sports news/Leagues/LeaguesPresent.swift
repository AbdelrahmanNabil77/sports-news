//
//  LeaguesPresent.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation

class LeaguesPresent : LeaguesPresentProtocol, Avilability
{
    
func checkAvailability() -> Bool {
    return Reachability.Connection()
}

    var showLeagues : LeaguesShowProtocol?

    
func getLeagues() {
    if((!((self.showLeagues as! LeaguesTableViewController).isFavouriteTab ?? true))){
        if(checkAvailability()){
                getLeagueFromNetwork()
          
        }
        else{
            (self.showLeagues as! LeaguesTableViewController).showAlert(Message: "Internet is NOT Available", Details: "Please check Internet to Continue")
        }
    }else {
           getFavouriteLeagues()
    }
}

    func getLeagueFromNetwork() {
        APIs.searchLeagueKey = self.showLeagues?.sportName?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        NetworkService.INSTANCE.getResponse(withURL:URL(string: "\(APIs.allLeaguesForSportURL)\(APIs.searchLeagueKey!)")!, ProcessResult: {
            json in
            
            let leagueArray = Mapper.jsonToLeagueList(fromJson: json)
            

        self.showLeagues?.displayLeagues(LeaguesArray: leagueArray as! Array<LeagueEntity>)
            }
        )
        
    }

    func getFavouriteLeagues() {
            DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async{
                let faveLeagues = CoredataModel.getInstance.getFavouriteLeagues()

                DispatchQueue.main.async {
                    self.showLeagues?.displayLeagues(LeaguesArray: faveLeagues)
                }
        }
        
        
    }
}
