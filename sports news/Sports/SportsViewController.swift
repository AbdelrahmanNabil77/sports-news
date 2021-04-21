//
//  SportsViewController.swift
//  sports news
//
//  Created by MACOS on 4/20/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit
import SDWebImage

class SportsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout ,SportsViewProtocol{
    
    var sportsList:Array<SportEntity>?
    var sportPersent:SportsPresent?
    
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         sportsList = Array<SportEntity>()
        sportPersent = SportsPresent(sportsview: self)
        sportPersent?.getSports()

       
    }
    
    func showSports(sports: Array<SportEntity>) {
          sportsList = sports
          print((sportsList?.count)!)
          collectionView.reloadData()
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/2.0
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if(((sportsList?.count)!)==0||(sportsList?.count)!==nil){
              
                  return 0

              }else{
                   return (sportsList?.count)!
              }
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCollectionViewCell
            if(((sportsList?.count)!)==0||(sportsList?.count)! == nil){
                
            }
            else{
                cell.sportName.text = sportsList?[indexPath.row].sportName
                var imageUrl = sportsList?[indexPath.row].sportThumb!
                       cell.sportImage!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "placeholder"))
            }
        return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let leagueStoryBoard = UIStoryboard(name: "LeaguesStoryboard", bundle: nil)
                let leagueViewController = leagueStoryBoard.instantiateViewController(withIdentifier:
                    "leaguesTableViewController") as! LeaguesTableViewController

         leagueViewController.isFavouriteTab = false
         leagueViewController.sportName = sportsList?[indexPath.row].sportName
         self.navigationController?.pushViewController(leagueViewController, animated: true)
        print("goToLeagues")
         return true
     }
    
 
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//          let leagueStoryBoard = UIStoryboard(name: "LeaguesStoryboard", bundle: nil)
//                          let leagueViewController = leagueStoryBoard.instantiateViewController(withIdentifier:
//                              "leaguesTableViewController") as! LeaguesTableViewController
//
//                   leagueViewController.isFavouriteTab = false
//                   leagueViewController.sportName = sportsList?[indexPath.row].sportName
//                   self.navigationController?.pushViewController(leagueViewController, animated: true)
//                  print("goToLeagues")
//    }
  

}
