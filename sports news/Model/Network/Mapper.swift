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
}
