//
//  MainTableViewController.swift
//  ParseData
//
//  Created by Giorgio Natili on 10/27/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import Parse

class MainTableViewController: UITableViewController {

    private var currentTodos:[Todo] = []
    private var todoManager:TodoManager = TodoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onTodosUpdated:", name: "todosUpdated", object: nil)
        
        todoManager.fetch()
        
    }
    
    
    func handleCancel(alertView: UIAlertAction!)
    {
        print("User click Cancel button")
    }
    
    @IBAction func addTodo(sender: AnyObject) {
        
        //NSNotificationCenter.defaultCenter().postNotificationName("onAddTodo", object: nil)
        
        var todoTextField : UITextField!
        let todoNoteTextField: UITextField!
        
        var alert = UIAlertController(title: "Add Todo Item", message: "Enter a new todo:", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler({ (textField: UITextField!) -> Void in
            todoTextField = textField
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:handleCancel))
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler:{ (UIAlertAction)in
            self.todoManager.add(todoTextField.text!)
        }))
        self.presentViewController(alert, animated: true, completion: {
            print("completion block")
        })
        

        //self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    func onTodosUpdated(notification: NSNotification) {
        
        currentTodos = todoManager.list
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentTodos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = currentTodos[indexPath.row].title

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            todoManager.remove(currentTodos[indexPath.row].id!)
            currentTodos.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
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
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

}
