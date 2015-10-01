//
//  FileManager.swift
//  ReadFile
//
//  Created by Giorgio Natili on 9/30/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class FileManager: NSObject {

    static let root = NSSearchPathDirectory.DocumentDirectory
    static let paths = NSSearchPathForDirectoriesInDomains(root, NSSearchPathDomainMask.UserDomainMask, true)
    static let documentsDirectory :String = paths[0] as String
    
    static var filePath:String = ""
    
    // Methods
    static func exists(file:String) -> Bool {
        
        filePath = documentsDirectory + "/" + file
        
        return NSFileManager().fileExistsAtPath(filePath)
        
    }
    
    static func create(file:String){
        
        let writePath = NSURL(fileURLWithPath: documentsDirectory).URLByAppendingPathComponent(file)
    
        NSFileManager().createFileAtPath(writePath.path!, contents: nil, attributes: nil)
        
    }
    
}
