//
//  LeagueDetailsViewController.swift
//  sports news
//
//  Created by AbdElRahman Nabil on 4/21/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var upcomingCollection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpcomingCollectionViewCell
        cell.uTeamFirst.makeRounded()
        cell.uTeamSec.makeRounded()
        cell.uTeamFirst.image=UIImage(named: "ahly")
        cell.uTeamSec.image=UIImage(named: "zamalek")
               return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingCollection.delegate=self
        upcomingCollection.dataSource=self
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
