//
//  MainViewController.swift
//  randomstringTab
//
//  Created by Marcy Regalado on 10/12/15.
//  Copyright © 2015 Marcy Regalado. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    private var joke = JokeFetcher()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for controller in viewControllers! {
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "onJokeFetched:", name: "jokeFetched", object: nil)
            
            if let _ = controller.view {
                var randomizedController = controller as! Randomized
                randomizedController.randomize = "Palla"
            }
            
        }
        
    }
    
    func onJokeFetched() {
        joke.getJoke("http://api.icndb.com/jokes/random")
        
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
