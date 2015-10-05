//
//  AddNoteViewController.swift
//  WritingPlist
//
//  Created by Matthew Hartwig on 10/4/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AddNoteViewController: UITableViewController, UITextFieldDelegate {
    
    var NotesTable = NotesTableViewController()

    @IBOutlet weak var noteText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didDone(sender: AnyObject) {
        if let note = noteText.text {
            NotesTable.addNote(note)
        }
        dismissViewControllerAnimated(true, completion: nil)

        
    }
    
    override func tableView(tableView:UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    
    //Disable bar button if nothing typed
  /*  @objc func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = noteText.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: <#T##String#>)
        
        if newText.length > 0 {
            doneBarButton.enabled = true
        } else {
            doneBarButton.enabled = false
        }
        return true
        
    }*/


}
