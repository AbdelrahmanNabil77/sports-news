//
//  NetworkService.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class NetworkService{
    static let INSTANCE = NetworkService()
    private init(){
    }
    
    private func generateOperationQueue(){
    }
    func getResponse(withURL url : URL,ProcessResult onComplete: @escaping (JSON) -> ()){
        var json : JSON?
        AF.request(url).validate()
            .responseJSON(completionHandler: {
            dataResponse in
        switch dataResponse.result{
            case .success(let value):
                json = JSON(value)
                
                onComplete(json!)
            case .failure(let error):
                print(error)
            }
        })
    }
}
