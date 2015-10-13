//
//  HeartViewController.swift
//  TheOtherWay
//
//  Created by Giorgio Natili on 10/12/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class HeartViewController: UIViewController, Randomized {

    @IBOutlet weak var random: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
