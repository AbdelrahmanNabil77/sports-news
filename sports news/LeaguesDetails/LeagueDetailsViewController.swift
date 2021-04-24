//
//  LeagueDetailsViewController.swift
//  sports news
//
//  Created by AbdElRahman Nabil on 4/21/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var mainScroll: UIScrollView!
    @IBOutlet weak var teamsCollection: UICollectionView!
    @IBOutlet weak var upcomingCollection: UICollectionView!
    
    @IBOutlet weak var lastTable: UITableView!
    var league : LeagueEntity?
    var upComingEvents = Array<EventEntity>()
    var teamsArray = Array<TeamEntity>()
    var pastEvents = Array<EventEntity>()

      private let presenter = LeagueDetailsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingCollection.delegate=self
        upcomingCollection.dataSource=self
        
        teamsCollection.delegate=self
        teamsCollection.dataSource=self
        
        lastTable.delegate=self
        lastTable.dataSource=self
        
        presenter.controller = self
        presenter.getAllData(forLeague: league!)

        mainScroll.contentSize=CGSize(width: (view.frame.size.width-20), height: 800)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("arrayOfEvant\(pastEvents.count)")
        return pastEvents.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LastTableViewCell", for: indexPath) as! LastTableViewCell
        cell.lTeamFirst.makeRounded()
        cell.lTeamSec.makeRounded()
       // let imageUrl = pastEvents[indexPath.row].firstTeam?.teamBadge!
         //           cell.lTeamFirst!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "placeholder"))
          //cell.lTeamSec!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "placeholder"))
        cell.firstTeamName.text = pastEvents[indexPath.row].firstTeam?.teamName
        cell.secTeamName.text = pastEvents[indexPath.row].secondTeam?.teamName

              cell.dateTV.text = "Date: \(String(describing: (pastEvents[indexPath.row].eventDate)!)) Time: \(String(describing: (pastEvents[indexPath.row].eventTime)!))"
              return cell
        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView==upcomingCollection){
        return 5
        }
        print("arrayOfTeam\(teamsArray.count)")
        return teamsArray.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView==teamsCollection){
            let teamsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
            teamsCell.teamImage.makeRounded()
            var imageUrl = teamsArray[indexPath.row].teamBadge!
            teamsCell.teamImage!.sd_setImage(with: URL(string:imageUrl), placeholderImage: UIImage(named: "placeholder"))
            
                return teamsCell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpcomingCollectionViewCell
            cell.uTeamFirst.makeRounded()
            cell.uTeamSec.makeRounded()
       // cell.dateTV.text = "Date: \(String(describing: (upComingEvents[indexPath.row].eventDate)!)) Time: \(String(describing: (upComingEvents[indexPath.row].eventTime)!))"
      //  var imageUrl = teamsArray[indexPath.row].teamBadge!
                 //  cell.uTeamFirst!.sd_setImage(with: URL(string:imageUrl), placeholderImage: UIImage(named: "placeholder"))
      //   cell.uTeamSec!.sd_setImage(with: URL(string:imageUrl), placeholderImage: UIImage(named: "placeholder"))
          
        
            return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView==teamsCollection){
        return CGSize(width: 120, height: upcomingCollection.frame.size.height)
        }
        return CGSize(width: upcomingCollection.frame.size.width, height: upcomingCollection.frame.size.height)
    }
    
}

 extension UIImageView {

     func makeRounded() {

         self.layer.borderWidth = 1
         self.layer.masksToBounds = false
         self.layer.borderColor = UIColor.black.cgColor
         self.layer.cornerRadius = self.frame.height / 2
         self.clipsToBounds = true
     }
 }
extension LeagueDetailsViewController : LeaguesDetailsControllerContract{
    func updateFavourite(isSelected: Bool) {
    
    }
    
    func displayUpcomingEvents(listOfUpcomingEvents events: Array<EventEntity>) {
        upComingEvents = events
        self.upcomingCollection.reloadData()

    }
    
    func displayPastEvents(listOfPastEvents events: Array<EventEntity>) {
        
        pastEvents = events
        self.lastTable.reloadData()
    }
    
    func displayTeams(listOfTeams teams: Array<TeamEntity>) {
            teamsArray = teams
            self.teamsCollection.reloadData()
                            
    }
    
    
}
