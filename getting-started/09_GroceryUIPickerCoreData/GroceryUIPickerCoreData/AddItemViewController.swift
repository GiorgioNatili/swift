//
//  AddItemViewController.swift
//  GroceryUIPickerCoreData
//
//  Created by Giorgio Natili on 9/9/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AddItemViewController: UIAlertController {
    
    fileprivate var icons = ["apple", "pear", "orange"]
    fileprivate var itemName:UITextField!
    
    var dataManager:DataManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            
            //Do some stuff
            var topVC = UIApplication.shared.keyWindow?.rootViewController
            topVC?.dismiss(animated: true, completion: nil)
            
        }
        addAction(cancelAction)
        
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Next", style: .default) { action -> Void in
            
            //Do some other stuff
            
            let randomIndex = Int(arc4random_uniform(UInt32(self.icons.count)))
            self.dataManager.addItem(self.itemName.text!, type: self.icons[randomIndex])
            
        }
        
        addAction(nextAction)
        
        //Add a text field
        addTextField { name -> Void in
            //TextField configuration
            name.textColor = UIColor.blue
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
