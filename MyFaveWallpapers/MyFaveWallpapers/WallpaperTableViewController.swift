//
//  WallpaperTableViewController.swift
//  MyFaveWallpapers
//
//  Created by Amee Thakkar on 7/3/18.
//  Copyright © 2018 Amee Thakkar. All rights reserved.
//

import UIKit

var namesArray = [String]()
var imageArray = [UIImage]()

class WallpaperTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return namesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath) as! WallpaperTableViewCell

        cell.wallpaperImgView.image = imageArray[indexPath.row]
        
        cell.nameLabel.text = namesArray[indexPath.row]
        
        cell.numberLabel.text = "\(indexPath.row + 1)"
       
        return cell
    }
 
    @IBAction func loadClick(_ sender: Any) {
        
        namesArray = ["BMW M6", "NEW MAYBACH", "RANGE ROVER", "PORSHE JEEP"]
        
        imageArray = [UIImage(named:"car1")!, UIImage(named:"car2")!, UIImage(named:"car3")!, UIImage(named:"car4")!]
        
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            namesArray.remove(at: indexPath.row)
            imageArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.reloadData()
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "identifier", sender: self)
    }
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     if let myIndexPath = tableView.indexPathForSelectedRow
     {
     let name = namesArray[myIndexPath.row]
     let image = imagesArray[myIndexPath.row]
     
     let destinationVC = segue.destination as! AddCarViewController
     destinationVC.
     }
     }*/

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
