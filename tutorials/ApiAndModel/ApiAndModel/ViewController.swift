//
//  ViewController.swift
//  ApiAndModel
//
//  Created by Giorgio Natili on 10/19/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var location:CurrentLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let path = "http://openweathermap.org/help/city_list.txt"
//        var lineArray:[String] = []
//        
//        do {
//            let content = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
//            lineArray = content.componentsSeparatedByString("\n")
//        } catch  let error as NSError {
//            // TODO: handle failue
//            print(error)
//        }
        
        location = CurrentLocation()
        
    }

    @IBAction func startLocation(sender: AnyObject) {
        

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

