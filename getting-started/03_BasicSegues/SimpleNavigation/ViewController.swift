//
//  ViewController.swift
//  SimpleNavigation
//
//  Created by Natili, Giorgio on 2/21/15.
//  Copyright (c) 2015 Natili, Giorgio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openNextSceene(sender: AnyObject) {
        
        let view = self.storyboard?.instantiateViewControllerWithIdentifier("sceene2") as SecondViewController
        self.navigationController?.pushViewController(view, animated: true)
        
    }
  
}

