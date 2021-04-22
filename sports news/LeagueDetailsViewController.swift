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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingCollection.delegate=self
        upcomingCollection.dataSource=self
        
        teamsCollection.delegate=self
        teamsCollection.dataSource=self
        
        lastTable.delegate=self
        lastTable.dataSource=self
        
        mainScroll.contentSize=CGSize(width: (view.frame.size.width-20), height: 800)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LastTableViewCell", for: indexPath) as! LastTableViewCell
        cell.lTeamFirst.makeRounded()
        cell.lTeamSec.makeRounded()
        cell.lTeamFirst.image=UIImage(named: "ahly")
        cell.lTeamSec.image=UIImage(named: "zamalek")
        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return upcomingCollection.frame.size.height
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView==upcomingCollection){
        return 5
        }
        return 7
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView==teamsCollection){
            let teamsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
            teamsCell.teamImage.makeRounded()
            teamsCell.teamImage.image=UIImage(named: "ahly")
            
            
                return teamsCell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpcomingCollectionViewCell
        cell.uTeamFirst.makeRounded()
        cell.uTeamSec.makeRounded()
        cell.uTeamFirst.image=UIImage(named: "ahly")
        cell.uTeamSec.image=UIImage(named: "zamalek")
        
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
