//
//  TeamDetailsViewController.swift
//  sports news
//
//  Created by MACOS on 4/25/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit
import  SDWebImage

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var teamSport: UILabel!
    @IBOutlet weak var teamCountry: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImg: UIImageView!
    var teamDetails : TeamEntity?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
           if(teamDetails != nil){
               teamName.text = teamDetails?.teamName
            print("teamName\(teamName)")
               teamCountry.text = teamDetails?.teamCountry
               teamSport.text = teamDetails?.teamSport
               var imageUrl = URL(string:(teamDetails?.teamBadge)!)
            teamImg.makeImgRounded()
          teamImg.sd_setImage(with: (imageUrl), placeholderImage: UIImage(named: "placeholder"))
            NotificationCenter.default.addObserver(self, selector: #selector(displayNoLinkForTeam), name: NSNotification.Name("displayNoLinkForTeam"), object: nil)
                //    teamW.clipsToBounds =  true

       }
    }
    @objc func displayNoLinkForTeam (notification: Notification){
                  let team = notification.object as! TeamEntity
              showAlert(Message: "Sorry",Details: "No link Available for \(team.teamName!) Team")
              }
    
    @objc func showAlert(Message message : String, Details details : String){
        let alert = UIAlertController(title: message, message: details, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    @IBAction func goToInstgram(_ sender: Any) {
        if (!(teamDetails?.teamInstgram!)!.isEmpty) {
                             let appURL = URL(string: "https://\((teamDetails?.teamInstgram)!)")!
                             let webURL = URL(string: "https://\((teamDetails?.teamInstgram)!)")!
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
                                 NotificationCenter.default.post(name: NSNotification.Name("displayNoLinkForTeam"), object: teamDetails)
                             }
    }
    @IBAction func goToWebsite(_ sender: Any) {
        if (!(teamDetails?.teamWebsite!)!.isEmpty) {
                         let appURL = URL(string: "https://\((teamDetails?.teamWebsite)!)")!
                         let webURL = URL(string: "https://\((teamDetails?.teamWebsite)!)")!
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
                             NotificationCenter.default.post(name: NSNotification.Name("displayNoLinkForTeam"), object: teamDetails)
                         }
    }
    @IBAction func goToTwitter(_ sender: Any) {
        if (!(teamDetails?.teamTwitter!)!.isEmpty) {
                                  let appURL = URL(string: "https://\((teamDetails?.teamTwitter)!)")!
                                  let webURL = URL(string: "https://\((teamDetails?.teamTwitter)!)")!
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
                                      NotificationCenter.default.post(name: NSNotification.Name("displayNoLinkForTeam"), object: teamDetails)
                                  }
    }
    @IBAction func goToFacebook(_ sender: Any) {
        if (!(teamDetails?.teamFacebook!)!.isEmpty) {
                                  let appURL = URL(string: "https://\((teamDetails?.teamFacebook)!)")!
                                  let webURL = URL(string: "https://\((teamDetails?.teamFacebook)!)")!
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
                                      NotificationCenter.default.post(name: NSNotification.Name("displayNoLinkForTeam"), object: teamDetails)
                                  }
    }
}
extension UIImageView {

    func makeImgRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
