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
      
    static let sportsURL : URL = URL(string: allSportsURL)!
    
    static var searchLeagueKey : String?
    
}

enum JSONObjectMapperTypes{
  
    case SportEntity
    case LeagueEntity
  
}

