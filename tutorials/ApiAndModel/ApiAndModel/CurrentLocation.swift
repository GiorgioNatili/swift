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
    
    private var _locationStatus:(code: Int, message: String)
    private var _longitude:Double
    private var _latitude:Double
    
    override init (){
        
        self.locationManager = CLLocationManager()
        
        self._locationStatus = (code: 0, message: "")
        self._longitude = 0.0
        self._latitude = 0.0
        
        super.init()
        
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    
    // MARK: CLLocationManagerDelegate implementation
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        locationManager.stopUpdatingLocation()
        
        // TODO: add a notification to the propagate the error
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locationObj:CLLocation = locations.last!
        let coord = locationObj.coordinate
        
        _latitude = coord.latitude
        _longitude = coord.longitude
    
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        let _ = (code: 1, message: "palla")
        
        switch status {
                
            case CLAuthorizationStatus.Restricted:
                _locationStatus = (code: 1, message: "Restricted access to location")
                
            case CLAuthorizationStatus.Denied:
                _locationStatus = (code: 0, message: "User denied access to location")
                
            case CLAuthorizationStatus.NotDetermined:
                _locationStatus = (code: 0, message: "Status not determined")
                
            default:
                _locationStatus = (code: 1, message: "Allowed to location Access")
                
        }
        
        // TODO: add a notification for the status changed event        
        NSNotificationCenter.defaultCenter().postNotificationName("updatedLocations", object: nil, userInfo: [_locationStatus.message: _locationStatus.code])
        
    }
    
    // MARK: LocationInfo implementation
    var locationStatus:String {
        
        get {
            
            return _locationStatus.message
            
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
