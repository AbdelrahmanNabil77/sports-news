//
//  LeagueDetailsViewController.swift
//  sports news
//
//  Created by AbdElRahman Nabil on 4/21/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit
import CoreData
class LeagueDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {

    let activityIndicatorView : UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    @IBOutlet weak var mainScroll: UIScrollView!
    @IBOutlet weak var teamsCollection: UICollectionView!
    @IBOutlet weak var upcomingCollection: UICollectionView!
    
    @IBOutlet weak var lastTable: UITableView!
    var league : LeagueEntity?
    var upComingEvents = Array<EventEntity>()
    var teamsArray = Array<TeamEntity>()
    var teamDetails : TeamEntity?
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
        self.view.addSubview(activityIndicatorView)
                   print("activity indeicator3")
                   activityIndicatorView.startAnimating()
                   print("start activity indeicator3")
        presenter.controller = self
        presenter.getAllData(forLeague: league!)
        activityIndicatorView.stopAnimating()
               print("stop activity indeicator3")

        mainScroll.contentSize=CGSize(width: (view.frame.size.width-20), height: 800)
        
       /*let testUIBarButtonItem = UIBarButtonItem(image: UIImage(named: "heart"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem  = testUIBarButtonItem
        testUIBarButtonItem.tintColor = .gray*/
        
        let containerView = UIControl(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        containerView.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        let imageAdd = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        imageAdd.image = UIImage(named: "heart")
        containerView.addSubview(imageAdd)
        let addBtn = UIBarButtonItem(customView: containerView)
        addBtn.width = 20
        navigationItem.rightBarButtonItem = addBtn
        

        
        
    }
    
    @objc func addFavorite(){
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //2
        let managedContext = appDelegate.persistentContainer.viewContext
        //3
        let entity = NSEntityDescription.entity(forEntityName: "FavLeague", in: managedContext)
        //4
        let favItemCD = NSManagedObject(entity: entity!, insertInto: managedContext)
        favItemCD.setValue("ahly", forKey: "image")
        favItemCD.setValue("premium league", forKey: "title")
        favItemCD.setValue("www.google.com", forKey: "link")
        //5
        do{
            try managedContext.save()
            print("saved successfully")
        }catch let error as NSError{
            print(error)
        }
        let favView:FavoriteTableViewController=(self.storyboard?.instantiateViewController(identifier: "FavoriteTableViewController"))!
        self.navigationController?.pushViewController(favView, animated: true)
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
        if  let imageUrlTeam1 = pastEvents[indexPath.row].firstTeam?.teamBadge{
            cell.lTeamFirst!.sd_setImage(with: URL(string:imageUrlTeam1), placeholderImage: UIImage(named: "placeholder"))
        }else{
            cell.lTeamFirst.image = UIImage(named: "team1")
        }
        if let imageUrlTeam2 = pastEvents[indexPath.row].secondTeam?.teamBadge{
          cell.lTeamSec!.sd_setImage(with: URL(string:imageUrlTeam2), placeholderImage: UIImage(named: "placeholder"))
        }else{
            cell.lTeamSec.image = UIImage(named: "team2")
        }
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
                  print("arrayOfUPComing\(teamsArray.count)")
            return upComingEvents.count
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
        
            if let imageUrlTeam1 = upComingEvents[indexPath.row].firstTeam?.teamBadge{
                          cell.uTeamFirst!.sd_setImage(with: URL(string:imageUrlTeam1), placeholderImage: UIImage(named: "placeholder"))
            }else{
                cell.uTeamFirst.image = UIImage(named: "team1")
            }
            
            if let imageUrlTeam2 = upComingEvents[indexPath.row].secondTeam?.teamBadge{
             cell.uTeamSec!.sd_setImage(with: URL(string:imageUrlTeam2), placeholderImage: UIImage(named: "placeholder"))
            }else{
                cell.uTeamSec.image = UIImage(named: "team2")
            }
                       cell.dateTV.text = "Date: \(String(describing: (upComingEvents[indexPath.row].eventDate)!)) Time: \(String(describing: (upComingEvents[indexPath.row].eventTime)!))"
     
      
            return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView==teamsCollection){
        return CGSize(width: 120, height: upcomingCollection.frame.size.height)
        }
        return CGSize(width: upcomingCollection.frame.size.width, height: upcomingCollection.frame.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
         print("goToTeamDetails")
        if(self.presenter.checkAvailability()){
            teamDetails = teamsArray[indexPath.row]
        }
        else{
             showAlert(Message: "Internet is NOT Available", Details: "Please Connect To Internet to Continue")
        }
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tvc : TeamDetailsViewController = segue.destination as! TeamDetailsViewController
        tvc.teamDetails = self.teamDetails
    print("TeamName\(teamDetails?.teamName)")
        }
    
@objc func showAlert(Message message : String, Details details : String){
     let alert = UIAlertController(title: message, message: details, preferredStyle: .alert)
     alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
     self.present(alert, animated: true)
 }
    @objc func displayNoLinkForTeam (notification: Notification){
               let team = notification.object as! TeamEntity
           showAlert(Message: "Sorry",Details: "No link Available for \(team.teamName!) Team")
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
