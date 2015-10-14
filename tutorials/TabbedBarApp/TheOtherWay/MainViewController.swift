//
//  MainViewController.swift
//  TheOtherWay
//
//  Created by Giorgio Natili on 10/12/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    let jokeFetcher = JokeFetcher(url: "http://api.icndb.com/jokes/random")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let items = tabBar.items {
            items[0].enabled = true
        }
        
        jokeFetcher.loadData()
        
        let defaultCenter = NSNotificationCenter.defaultCenter()
        defaultCenter.addObserver(self, selector: "onJokeFetch:", name: "jokeFetched", object: nil)
        
    }
    
    func onJokeFetch(notification: NSNotification) {
        for controller in viewControllers! {
            
            if let _ = controller.view {
                
                var randomizedController = controller as! Randomized
                randomizedController.randomValue = jokeFetcher.getJoke()
                
            }
        }
        
        if let items = tabBar.items {
            items[1].enabled = true
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
