//
//  SportsProtocols.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation

protocol SportPresenterProtocol {
    func getSports()
}

protocol SportsViewProtocol {
    func showSports(sports:Array<SportEntity>)
}
