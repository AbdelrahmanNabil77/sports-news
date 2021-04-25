//
//  LeaguesTableViewController.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit
import SDWebImage

class LeaguesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,LeaguesShowProtocol, UISearchBarDelegate {
    
     let activityIndicatorView : UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var typeOfTab: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
     var isFiltered : Bool?
    var filteredArr: Array<LeagueEntity>?
     var league : LeagueEntity?
    
    var sportName: String?
    var isFavouriteTab : Bool?
    var leaguesArray: Array<LeagueEntity>?
    var presenterLeague = LeaguesPresent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isFiltered == false
        searchBar.delegate = self
        presenterLeague.showLeagues = self
              if let name = sportName {
                  self.typeOfTab?.text = sportName
              } else {
                self.typeOfTab?.text = "Favourite Sports"
        }
        
        filteredArr = leaguesArray
      
    }
       
       func displayLeagues(LeaguesArray array: Array<LeagueEntity>) {
           leaguesArray?.removeAll()
           leaguesArray = array
           filteredArr = array
           tableView.reloadData()
        activityIndicatorView.stopAnimating()
          print("stop activity indeicator2")
       }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(activityIndicatorView)
              print("activity indeicator2")
              activityIndicatorView.startAnimating()
              print("start activity indeicator2")
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
        guard let count = filteredArr?.count
               else{
                   return 0
               }
               return filteredArr!.count
        
           
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueTableViewCell
                
               if (filteredArr?.count) != nil{
                   cell.leagueName.text = filteredArr?[indexPath.row].leagueName
                   cell.leagueImage.layer.cornerRadius = cell.leagueImage.frame.size.width/2
                    cell.leagueImage.clipsToBounds = true
               var imageUrl = filteredArr?[indexPath.row].leagueBadge!
                                   cell.leagueImage!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "placeholder"))
                
                   cell.leagueEntity = filteredArr?[indexPath.row]
                   NotificationCenter.default.addObserver(self, selector: #selector(displayNoLink), name: NSNotification.Name("displayNoLink"), object: nil)
                   cell.youtubeBtn.clipsToBounds =  true
                   cell.youtubeBtn.setImage(UIImage(named: "youtube"),for: .highlighted)
                   cell.youtubeBtn.setImage(UIImage(named: "youtube"),for: .normal)
               }
        return cell
      
       }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isFiltered = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
          isFiltered = false
      }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
           isFiltered = false;

           searchBar.text = nil
           searchBar.resignFirstResponder()
           tableView.resignFirstResponder()
           self.searchBar.showsCancelButton = false
           tableView.reloadData()
       }

       func searchBarSearchButtonClicked(searchBar: UISearchBar) {
           isFiltered = false
       }

       func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
                   return true
       }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredArr = searchText.isEmpty ? leaguesArray : leaguesArray?.filter({ (data) -> Bool in
            return data.leagueName!.range(of: searchText, options: .caseInsensitive) != nil
        })
        self.tableView.reloadData()
          
      }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
         if(self.presenterLeague.checkAvailability()){
                    league = leaguesArray![indexPath.row]
                }
                else{
                    showAlert(Message: "Internet is NOT Available", Details: "Please Connect To Internet to Continue")
                }
        return indexPath
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc : LeagueDetailsViewController = segue.destination as! LeagueDetailsViewController
            vc.league = self.league
        print("leagueName\(league?.leagueName)\(league?.leagueID)")
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
