//
//  DataManagerProtocols.swift
//  WritingPlist
//
//  Created by Giorgio Natili on 10/3/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import Foundation

protocol ManageListItem {
    
    func addItem(item:String)
    func removeItem(item:String)
    
    var content:Dictionary<String, AnyObject!> { get }
    
}