//
//  NoteManager.swift
//  WritingPlist
//
//  Created by Dmitry Shamis on 10/5/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class NoteManager: NSObject {
    
    private var tableViewController:NotesTableViewController
    private var alert:UIAlertController = UIAlertController(title: "What do you need to do?", message: "Add an item.", preferredStyle: .Alert)
    
    init(tableViewController:NotesTableViewController) {
        self.tableViewController = tableViewController
        super.init()

        prepareAlert()
    }
    
    func prepareAlert() {
        let saveAction = UIAlertAction(title: "Save",
            style: .Default) { (action: UIAlertAction) -> Void in
                
                let textField = self.alert.textFields![0]
                self.tableViewController.addNote(textField.text!)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        self.alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        self.alert.addAction(saveAction)
        self.alert.addAction(cancelAction)
        
    }
    
    func renderAlert() {
        self.alert.presentViewController(self.alert, animated: true, completion: nil)
    }
}
