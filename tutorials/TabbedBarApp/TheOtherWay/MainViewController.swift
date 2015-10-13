//
//  MainViewController.swift
//  TheOtherWay
//
//  Created by Giorgio Natili on 10/12/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let items = tabBar.items {
            
           // items[0].enabled = false
           // items[1].enabled = true
            
        }
        
        let value = randomStringWithLength(8)
        
        for controller in viewControllers! {
            
            if let _ = controller.view {
                               
                var randomizedController = controller as! Randomized
                randomizedController.randomValue = value
                
            }
            
        }
        
    }
    
    func randomStringWithLength (len : Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString as String
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
