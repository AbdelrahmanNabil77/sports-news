//
//  APIS.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation
class APIs {


static let allSportsURL = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
   static let allLeaguesForSportURL = "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s="
    
    // static let allLeaguesForSportURLForDetails = "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id="
  //  static let allLeaguesForSportURL = "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php?"
    
    static let allTeamsPerLeagueURL = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l="
     static let upComingEventsPerLeagueURL = "https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id="
     static let pastEventsPerLeagueURL = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="
  
      
    static let sportsURL : URL = URL(string: allSportsURL)!
    
    static var searchLeagueKey : String?
    static var searchTeamKey : String?
      static var searchEventsKey : String?
    
}

enum JSONObjectMapperTypes{
  
    case SportEntity
    case LeagueEntity
    case TeamEntity
    case EventEntity
  
}

