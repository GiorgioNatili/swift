//
//  TodoTableViewController.swift
//  TodoAppWithCoreData
//
//  Created by Giorgio Natili on 8/31/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    // MARK: data and private members
    fileprivate var todos = ["grocery", "general assembly", "dinner", "moving"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // TODO load dynamcally core data
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: accessing to local data
    func addTodoItem(_ item:String) {
        
        if !item.isEmpty {
        
            todos.append(item)
            self.tableView.reloadData()
            
        }
        
    }
    
    // MARK: passing data around
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let todoViewController = segue.destination as? AddTodoViewController {
            
            todoViewController.tableData = self
            
        }
        
        if segue.identifier == "showInfo" {
            
            if let details = segue.destination as? DetailsViewController {
                
                let indexPath = self.tableView.indexPathForSelectedRow!
                let titleString = self.todos[(indexPath as NSIndexPath).row]
                
                details.todoItem = titleString
                
                self.tableView.deselectRow(at: indexPath, animated: true)
                
            }

            
        }
        
        
    }
    
    // MARK: editing data in core data
    @IBAction func editItem(_ sender: UIButton) {
        // TODO open the edit delegate
        
    }
    
    @IBAction func deleteItem(_ sender: UIButton) {
        // TODO delete item from core data
        todos.remove(at: sender.tag)
        self.tableView.reloadData()
    
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
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath) as! TodoItemCell

        // Configure the cell...
        cell.todoLabel?.text = todos[(indexPath as NSIndexPath).row]
        // cell.textLabel?.text = todos[indexPath.row]
        
        cell.editItem.tag = (indexPath as NSIndexPath).row;
        cell.editItem.addTarget(self, action: #selector(TodoTableViewController.editItem(_:)), for: .touchUpInside)
        
        cell.deleteItem.tag = (indexPath as NSIndexPath).row;
        cell.deleteItem.addTarget(self, action: #selector(TodoTableViewController.deleteItem(_:)), for: .touchUpInside)
        
      //  (cell.accessoryView as! UIButton).addTarget(self, action: "doSomethingForTheSegue:", forControlEvents: .TouchUpInside)


        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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

}
