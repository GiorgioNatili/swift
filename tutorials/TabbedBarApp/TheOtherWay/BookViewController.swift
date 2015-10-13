//
//  ViewController.swift
//  TheOtherWay
//
//  Created by Giorgio Natili on 10/12/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, Randomized {

    @IBOutlet weak var random: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var randomValue:String {
        
        get {
            
            return random!.text!
            
        }
        
        set {
            
           random.text = newValue
            
        }
        
    }

    
    
}

