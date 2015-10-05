//
//  AddItemViewController.swift
//  WritingPlist
//
//  Created by Marcy Regalado on 10/4/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet var note: UITextField!
    private var noteTable = NotesTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: user interaction

    
    @IBAction func addNote(sender: AnyObject) {
    
        if let newNote = note.text {
            noteTable.addNote(newNote)
        }
        
        navigationController?.popToRootViewControllerAnimated(true)
    
    }
    
    
//    @IBAction func didDone(sender: AnyObject) {
//        if let note = noteText.text {
//            NotesTable.addNote(note)
//        }
//        dismissViewControllerAnimated(true, completion: nil)
//        
//        
//    }
//    
//    override func tableView(tableView:UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
//        return nil
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
