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
    var cities:[String]!
    
    @IBOutlet weak var locationStatus: UILabel!
    @IBOutlet weak var getForecast: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onupdatedLocations:", name: "updatedLocations", object: nil)
        
        location = CurrentLocation()
        availableCities()
        
    }
    
    
    private func availableCities() {
        
        let converter = FileConverter()
        var content:[String]?
        
        do{
            
            content = try converter.arrayFromLocalLines("city_list.txt")
            
        } catch let error as NSError {
            
            print("We got an error: \(error.description)")
            
        }
        
        content?.removeFirst()
        cities = content

    }
    
    func onupdatedLocations(notification:NSNotification){
        
        let status:DataWrapper = notification.userInfo!["status"] as! DataWrapper<(Int, String)>
        
        getForecast.enabled = status.element.0.toBool()!
        locationStatus.text = status.element.1
        
    }
    
    @IBAction func startLocation(sender: AnyObject) {
        

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

