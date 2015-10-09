//
//  NotesTableViewController.swift
//  WritingPlist
//
//  Created by Giorgio Natili on 9/30/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    // MARK: data source
    var notes:[String] = Array<String>()
    
    // MARK: data manager (plist)
//    let plistManager:PlistManager = PlistManager(plist: "grocery_notes") // Removed reference
    let entityManager:EntityManager = EntityManager()
    
    // MAR: override of view methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onRefreshData:", name: "refreshData", object: nil)
        
//        plistManager.preparePlistForUse()
        
        notes = Array(dataManager.content.keys)
        
        self.tableView.reloadData()
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Accessing the model
    private var dataManager:ManageListItem {
        
//        return plistManager
        return entityManager
        
    }
    
    func onRefreshData(ref:AnyObject) {
        
        notes = Array(dataManager.content.keys)
        self.tableView.reloadData()
        
    }
    
    // MARK: adding and removing notes
    func addNote(title:String, info:String) {
        
        dataManager.addItem(title, info: info)
        notes = Array(dataManager.content.keys)

        self.tableView.reloadData()
        
    }
    
    func removeNote(title:String) {
        
        dataManager.removeItem(title)
        notes = Array(dataManager.content.keys)
        
        self.tableView.reloadData()
        
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroceryCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = notes[indexPath.item]

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    
    @IBAction func addNoteButton(sender: AnyObject) {
        let noteManager: NoteManager = NoteManager(manager: dataManager)
        presentViewController(noteManager.currentController, animated: true, completion: nil)
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            removeNote(notes[indexPath.row])
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
