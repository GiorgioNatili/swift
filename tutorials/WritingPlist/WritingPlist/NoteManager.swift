//
//  NoteManager.swift
//  WritingPlist
//
//  Created by Giorgio Natili on 10/5/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class NoteManager: NSObject {

    private let alertController: UIAlertController = UIAlertController(title: "Add a note", message: "Add a note to your grocery list", preferredStyle: .Alert)
    
    private var manager:ManageListItem
    private var currentNote:UITextField!
    
    init(manager:ManageListItem){
        
        self.manager = manager

        super.init()
        prepareViewController()
        
    }
    
    private func prepareViewController() {
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
            // Here you can configure the text field (eg: make it secure, add a placeholder, etc)
            textField.placeholder = "Note"
            textField.keyboardAppearance = UIKeyboardAppearance.Dark
            textField.keyboardType = UIKeyboardType.Alphabet
            
            self.currentNote = textField
            
        }
        
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
        
            self.manager.addItem(self.currentNote.text!)
        
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(ok)
        alertController.addAction(cancel)

    }
    
    var currentController:UIAlertController {
        
        return alertController
        
    }
    
}
