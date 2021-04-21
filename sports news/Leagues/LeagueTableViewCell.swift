//
//  LeagueTableViewCell.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leagueName: UILabel!
    
  
    @IBOutlet weak var youtubeBtn: UIButton!
    @IBOutlet weak var leagueImage: UIImageView!
    
    var leagueEntity :LeagueEntity?
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    @IBAction func openYoutube(_ sender: Any) {
        if (!(leagueEntity?.leagueVideoLink!)!.isEmpty) {
                     let appURL = URL(string: "https://\((leagueEntity?.leagueVideoLink)!)")!
                     let webURL = URL(string: "https://\((leagueEntity?.leagueVideoLink)!)")!
                         let application = UIApplication.shared
                         print(webURL.absoluteString)
                         if application.canOpenURL(appURL) {
                             application.open(appURL)
                         } else {
                             // if Youtube app is not installed, open URL inside Safari
                             application.open(webURL)
                         }
                     }
                     else{
                         NotificationCenter.default.post(name: NSNotification.Name("displayNoLink"), object: leagueEntity)
                     }
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
