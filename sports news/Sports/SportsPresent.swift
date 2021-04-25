//
//  SportsPresent.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation
class SportsPresent:SportPresenterProtocol, Avilability{
    func checkAvailability() -> Bool {
        return Reachability.Connection()
    }

    let sportsview:SportsViewProtocol
    
    init(sportsview:SportsViewProtocol) {
        self.sportsview = sportsview
    }
    
    func getSports() {
        if(checkAvailability()){
            
            NetworkService.INSTANCE.getResponse(withURL: APIs.sportsURL,  ProcessResult: {
                json in let sportArray = Mapper.jsonToSportsList(fromJson: json)
                sportArray.forEach({
                    sport in
                    print("SportName: \(sport.sportName)")
                })
                self.sportsview.showSports(sports: sportArray)
            })
        }
    }
}
