//
//  AddItemViewController.swift
//  GroceryUIPickerCoreData
//
//  Created by Giorgio Natili on 9/9/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AddItemViewController: UIAlertController {
    
    private var icons = ["apple", "pear", "orange"]
    private var itemName:UITextField!
    
    var dataManager:DataManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
            //Do some stuff
            var topVC = UIApplication.sharedApplication().keyWindow?.rootViewController
            topVC?.dismissViewControllerAnimated(true, completion: nil)
            
        }
        addAction(cancelAction)
        
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Next", style: .Default) { action -> Void in
            
            //Do some other stuff
            
            let randomIndex = Int(arc4random_uniform(UInt32(self.icons.count)))
            self.dataManager.addItem(self.itemName.text, type: self.icons[randomIndex])
            
        }
        
        addAction(nextAction)
        
        //Add a text field
        addTextFieldWithConfigurationHandler { name -> Void in
            //TextField configuration
            name.textColor = UIColor.blueColor()
            self.itemName = name
            
        }
        
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
