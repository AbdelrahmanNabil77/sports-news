////
////  FavoriteTableViewController.swift
////  sports news
////
////  Created by AbdElRahman Nabil on 4/24/21.
////  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
////
//
//import UIKit
//import CoreData
//class FavoriteTableViewController: UITableViewController,FavoriteControllerContract {
//    
//    var favPresenter:FavoritePresenterContract?
//    var favArr:[FavItem]=[FavItem]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        favPresenter=FavoritePresenter(favoriteVC: self)
//        favPresenter?.getFavArr()
//
//        
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return favArr.count
//    }
//
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FavortieTableViewCell", for: indexPath) as! FavortieTableViewCell
//        cell.leagueImage.makeRounded()
//        cell.leagueImage.image=UIImage(named: favArr[indexPath.row].image)
//        cell.leagueTitle.text=favArr[indexPath.row].title
//
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
// 
//        //    favPresenter?.deleteFavItem(indexRow: indexPath.row)
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//    func displayFavoriteArr(favArr: [FavItem]) {
//        self.favArr=favArr
//        self.tableView.reloadData()
//    }
//    func loadFromCoreData() {
//        favArr.removeAll()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavLeague")
//        do{
//            let favArrCD = try managedContext.fetch(fetchRequest)
//
//            for favItemCD in favArrCD{
//                let title = favItemCD.value(forKey: "title") as! String
//                let link = favItemCD.value(forKey: "link") as! String
//                let image = favItemCD.value(forKey: "image") as! String
//                let lId = favItemCD.value(forKey: "lId") as! String
//                let favItem = FavItem(image: image, title: title, link: link,lId: lId)
//                favArr.append(favItem)
//            }
//            tableView.reloadData()
//        }catch{
//            print("failed to load data from core data")
//        }
//    }
//
//}
