//
//  NoteManager.swift
//  WritingPlist
//
//  Created by Dmitry Shamis on 10/5/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class NoteManager: NSObject {
    
    private var alertController:UIAlertController = UIAlertController(title: "What do you need to do?", message: "Add an item.", preferredStyle: .Alert)
    private var manager:ManageListItem
    private var currentNote:UITextField!
    
    init(manager:ManageListItem) {
        self.manager = manager
        super.init()

        prepareViewController()
    }
    
    func prepareViewController() {
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
            // Here you can configure the text field (eg: make it secure, add a placeholder, etc)
            textField.placeholder = "Note"
            textField.keyboardAppearance = UIKeyboardAppearance.Dark
            textField.keyboardType = UIKeyboardType.Alphabet
            
            self.currentNote = textField
            
        }
        
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.manager.addItem(self.currentNote.text!)
            NSNotificationCenter.defaultCenter().postNotificationName("refreshData", object: nil)
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        
    }
    
    var currentController:UIAlertController {
        
        return alertController
        
    }
}
