//
//  MainTableViewController.swift
//  GroceryDataImages
//
//  Created by Giorgio Natili on 11/13/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    // Data managment and storage
    private var items:[GroceryItem]!
    private var dataManager:DataManager = DataManager()
    
    // MARK: UITableViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onGroceryItemsUpdated:", name: "groceryItemsUpdated", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onGroceryItemsError:", name: "groceryItemsError", object: nil)
        
        items = dataManager.getItems()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Notification
    func onGroceryItemsUpdated(notification:NSNotification) {
        
        print("I got some data back")
        
        items = dataManager.getItems()
        tableView.reloadData()
        
    }
    
    func onGroceryItemsError(notification:NSNotification) {
        
        print("I got some error back :(((")
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroceryItemCell", forIndexPath: indexPath)

        // Configure the cell...
        (cell as! GroceryItemTableViewCell).data = items[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "addItemSegue" {
            
            if let vc = segue.destinationViewController as? AddItemViewController{
                vc.dataManager = dataManager
            }
            
        }
        
    }

}
