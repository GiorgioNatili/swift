//
//  GroceryTableViewController.swift
//  GroceryUIPickerCoreData
//
//  Created by Giorgio Natili on 9/7/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class GroceryTableViewController: UITableViewController {

    fileprivate var groceryItems:[GroceryItem] = []
    fileprivate var dataManager:DataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groceryItems = dataManager.getItems()
        
        NotificationCenter.default.addObserver(self, selector: #selector(GroceryTableViewController.ontodoItemsUpdated(_:)), name:NSNotification.Name(rawValue: "todoItemsUpdated"), object: nil)


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return groceryItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroceryCell", for: indexPath) as! IRenderItem

        // Configure the cell...
        let item = groceryItems[(indexPath as NSIndexPath).row] as GroceryItem

        cell.name = item.name
        cell.icon = item.type

        return cell as! UITableViewCell
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    func ontodoItemsUpdated(_ notification: Notification){
        
        groceryItems = dataManager.getItems()
        tableView.reloadData()
        
    }
    
    @IBAction func addItem(_ sender: AnyObject) {

        let addItemController = AddItemViewController(title: "please now...", message: "..add a todo item", preferredStyle: .alert)
        addItemController.dataManager = dataManager
        
        self.present(addItemController, animated: true, completion: nil)
        
    }
    

}
