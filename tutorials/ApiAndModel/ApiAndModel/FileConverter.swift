//
//  FileConverter.swift
//  ApiAndModel
//
//  Created by Giorgio Natili on 10/22/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class FileConverter: NSObject {
    
    
    func arrayFromLocalLines(fileName: String) throws -> [String] {
        
        guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: nil) else {
            
            throw NSError(domain: NSCocoaErrorDomain, code: NSFileNoSuchFileError, userInfo: [ NSFilePathErrorKey : fileName ])
        }
        
        let content = try String(contentsOfFile: path, encoding: NSMacOSRomanStringEncoding)
        return content.componentsSeparatedByString("\n")
        
    }
    
    // TODO: discuss how to get data from a remote source and implement it

}
