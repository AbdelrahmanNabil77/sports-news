//
//  LeaguesTableViewController.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit
import SDWebImage

class LeaguesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,LeaguesShowProtocol {
  
    
    @IBOutlet weak var typeOfTab: UILabel!
   
    @IBOutlet weak var tableView: UITableView!
    
    var sportName: String?
    var isFavouriteTab : Bool?
    var leaguesArray: Array<LeagueEntity>?
    var presenterLeague = LeaguesPresent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterLeague.showLeagues = self
              if let name = sportName {
                  self.typeOfTab?.text = sportName
              } else {
                self.typeOfTab?.text = "Favourite Sports"
        }
      
    }
       
       func displayLeagues(LeaguesArray array: Array<LeagueEntity>) {
           leaguesArray?.removeAll()
           leaguesArray = array
           tableView.reloadData()
       }
    
    override func viewWillAppear(_ animated: Bool) {
           presenterLeague.getLeagues()
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 110
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = leaguesArray?.count
               else{
                   return 0
               }
               return leaguesArray!.count
           
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueTableViewCell
               if (leaguesArray?.count) != nil{
                   cell.leagueName.text = leaguesArray?[indexPath.row].leagueName
                   cell.leagueImage.layer.cornerRadius = cell.leagueImage.frame.size.width/2
                    cell.leagueImage.clipsToBounds = true
            
                var imageUrl = leaguesArray?[indexPath.row].leagueBadge!
                                     cell.leagueImage!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "placeholder"))
                
                   cell.leagueEntity = leaguesArray?[indexPath.row]
                   NotificationCenter.default.addObserver(self, selector: #selector(displayNoLink), name: NSNotification.Name("displayNoLink"), object: nil)
                   cell.youtubeBtn.clipsToBounds =  true
                   cell.youtubeBtn.setImage(UIImage(named: "youtube"),for: .highlighted)
                   cell.youtubeBtn.setImage(UIImage(named: "youtube"),for: .normal)
               }
        return cell
      
       }
    
    @objc func showAlert(Message message : String, Details details : String){
        let alert = UIAlertController(title: message, message: details, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @objc func displayNoLink (notification: Notification){
          let leag = notification.object as! LeagueEntity
      showAlert(Message: "Sorry",Details: "No link Available for \(leag.leagueName!) League")
      }

}
