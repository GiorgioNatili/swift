//
//  SecondViewController.swift
//  randomstringTab
//
//  Created by Marcy Regalado on 10/12/15.
//  Copyright © 2015 Marcy Regalado. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, Randomized {

    
    @IBOutlet var randomString2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var randomize: String {
        get {
            return randomString2.text!
        }
        
        set {
            randomString2.text! = newValue
        }
    }


}

