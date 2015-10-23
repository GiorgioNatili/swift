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
    var cities:[String:Location] = [String: Location]()
    
    @IBOutlet weak var locationStatus: UILabel!
    @IBOutlet weak var getForecast: UIButton!
    @IBOutlet weak var cityList: AutoCompleteTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onupdatedLocations:", name: "updatedLocations", object: nil)
        
        location = CurrentLocation()
        
        availableCities()
        configureTextField()
        
        
        cityList.onSelect = {[weak self] text, indexpath in
            // your code goes here
            self!.cityList.text = text
            
            print(self!.cities[text])
            let test = ForecastProvider(location: self!.cities[text]!)
            
        }
        
    }
    
    
    private func availableCities() {
        
        let converter = FileConverter()
        var content:[String] = Array()
        
        do{
            
            content = try converter.arrayFromLocalLines("city_list.txt")
            
        } catch let error as NSError {
            
            print("We got an error: \(error.description)")
            
        }
        
        content.removeLast()
        
        for loc:String in content {
            
            let values = loc.componentsSeparatedByString("\t")
            let location:Location =  Location(values: values)
            
            cities[location.name] = location

        }

        cityList.autoCompleteStrings = Array(cities.keys)
        
    }
    
    private func configureTextField(){
        
        cityList.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        cityList.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 12.0)
        cityList.autoCompleteCellHeight = 35.0
        cityList.maximumAutoCompleteCount = 10
        cityList.hidesWhenSelected = true
        cityList.hidesWhenEmpty = true
        cityList.autoCompleteTableHeight = 300.0
        
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor.blackColor()
        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
        cityList.autoCompleteAttributes = attributes
        
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

