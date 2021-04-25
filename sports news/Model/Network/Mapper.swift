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
               league.leagueBadge = json["strBadge"].stringValue
               league.leagueName = json["strLeague"].stringValue
              league.leagueVideoLink = json["strYoutube"].stringValue
               league.leagueID = json["idLeague"].stringValue
            print("league\(league.leagueName)")
            print("Arrayleague\(leagueArray.count)")

            leagueArray.append(league)
             })
           return leagueArray as Array<LeagueEntity>
    }

    public static func jsonToTeamList(fromJson json: JSON) -> Array<TeamEntity>{
          var teamArray = Array<TeamEntity>()
          let customarray = json["teams"].arrayValue
          customarray.forEach({ json in
              let team = TeamEntity()
              team.teamName = json["strTeam"].stringValue
              print(team.teamName)
              team.teamBadge = json["strTeamBadge"].stringValue
              team.teamCountry = json["strCountry"].stringValue
              team.teamSport = json["strSport"].stringValue
              team.teamFacebook = json["strFacebook"].stringValue
             team.teamWebsite = json["strWebsite"].stringValue
             team.teamInstgram = json["strInstagram"].stringValue
             team.teamTwitter = json["strTwitter"].stringValue

              teamArray.append(team)
          })
          return teamArray
      }
      
      public static func jsonToEventList(fromJson json: JSON) -> Array<EventEntity>{
          var eventArray = Array<EventEntity>()
          let customarray = json["events"].arrayValue
          customarray.forEach({ json in
              let event = EventEntity()
              print(json["idLeague"].stringValue)
              event.eventName = json["strEvent"].stringValue
              event.eventDate = json["dateEvent"].stringValue
              event.eventTime = json["strTime"].stringValue
              event.firstTeam = TeamEntity()
              event.secondTeam = TeamEntity()
              event.firstTeam?.teamName = json["strHomeTeam"].stringValue
              event.secondTeam?.teamName = json["strAwayTeam"].stringValue
              event.firstTeamScore = json["intHomeScore"].stringValue
              event.secondTeamScore = json["intAwayScore"].stringValue
             event.teamThumb = json["strThumb"].stringValue
              eventArray.append(event)
          })
          return eventArray
      }
}
