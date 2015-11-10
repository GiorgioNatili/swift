//
//  NewsViewController.swift
//  SideMenu
//
//  Created by Giorgio Natili on 1/22/15.
//  Copyright (c) 2015 Giorgio Natili. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var menuItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let rvc:SWRevealViewController! = self.revealViewController()
        
        if (( rvc ) != nil) {
            
            menuItem.target = rvc
            menuItem.action = Selector ("revealToggle:")
            
            self.view.addGestureRecognizer(rvc.panGestureRecognizer())
            
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
