//
//  AddGroceryAlertController.swift
//  WritingPlist
//
//  Created by Max Blaushild on 10/5/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AddGroceryAlertController: UIAlertController {
    
    var notesTable = NotesTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "New Grocery Item"
        }
        
        let addGroceryAction = UIAlertAction(title: "Submit", style: .Default) { (_) in
            let note:String = self.textFields![0].text!
            self.notesTable.addNote(note)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        
        self.addAction(cancelAction)
        self.addAction(addGroceryAction)

        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
