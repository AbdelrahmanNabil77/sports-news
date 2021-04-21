//
//  Mapper.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation
import SwiftyJSON

class Mapper{
    public static func jsonToSportsList(fromJson json: JSON) -> Array<SportEntity>{
        var sportArray = Array<SportEntity>()
        let customarray = json["sports"].arrayValue
        customarray.forEach({ json in
            let sport = SportEntity()
            sport.sportName = json["strSport"].stringValue
            print(sport.sportName)
            sport.sportThumb = json["strSportThumb"].stringValue
            print(sport.sportName)
            sportArray.append(sport)
        })
        return sportArray
    }
    
    public static func jsonToLeagueList(fromJson json: JSON) -> Array<Any>{
           
           var leagueArray = Array<LeagueEntity>()
           let customarray = json["countrys"].arrayValue
           customarray.forEach({ json in
               let league = LeagueEntity()
               //print(json["strSport"].stringValue)
               league.leagueBadge = json["strBadge"].stringValue
               league.leagueName = json["strLeague"].stringValue
               league.leagueVideoLink = json["strYoutube"].stringValue
               league.leagueID = json["idLeague"].stringValue
               leagueArray.append(league)
           })
           return leagueArray as Array<LeagueEntity>
       }
    
    public static func jsonToLeaguesList(fromJson jsonArray: [JSON]) -> Array<LeagueEntity>{
          var leagueArray = Array<LeagueEntity>()
          jsonArray.forEach({ json in
              let league = LeagueEntity()
              league.leagueBadge = json["strBadge"].stringValue
              league.leagueName = json["strLeague"].stringValue
              league.leagueVideoLink = json["strYoutube"].stringValue
              leagueArray.append(league)
          })
          return leagueArray
      }
}
