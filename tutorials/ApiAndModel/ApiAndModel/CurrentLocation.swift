//
//  CurrentLocation.swift
//  ApiAndModel
//
//  Created by Giorgio Natili on 10/19/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationInfo{
    
    var locationStatus:String { get }
    var longitude:Double { get }
    var latitude:Double { get }

    
}

class CurrentLocation: NSObject, CLLocationManagerDelegate, LocationInfo {

    private var locationManager:CLLocationManager
    
    private var _locationStatus:String
    private var _longitude:Double
    private var _latitude:Double
    
    override init (){
        
        self.locationManager = CLLocationManager()
        
        self._locationStatus = ""
        self._longitude = 0.0
        self._latitude = 0.0
        
        super.init()
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    
    // MARK: CLLocationManagerDelegate implementation
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        locationManager.stopUpdatingLocation()
        
        // TODO: add a notification to the probapage the error
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locationObj:CLLocation = locations.last!
        let coord = locationObj.coordinate
        
        _latitude = coord.latitude
        _longitude = coord.longitude
    
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status {
                
            case CLAuthorizationStatus.Restricted:
                _locationStatus = "Restricted Access to location"
                
            case CLAuthorizationStatus.Denied:
                _locationStatus = "User denied access to location"
                
            case CLAuthorizationStatus.NotDetermined:
                _locationStatus = "Status not determined"
                
            default:
                _locationStatus = "Allowed to location Access"
                
        }
        
        // TODO: add a notification for the status changed event
    
    }
    
    // MARK: LocationInfo implementation
    var locationStatus:String {
        
        get {
            
            return _locationStatus
            
        }
        
    }
    
    var latitude:Double {
        
        get {
            
            return _latitude
            
        }
        
    }
    
    var longitude:Double {
        
        get {
            
            return _longitude
            
        }
        
    }
}
