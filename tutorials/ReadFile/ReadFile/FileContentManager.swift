//
//  FileContentManager.swift
//  ReadFile
//
//  Created by Giorgio Natili on 9/30/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class FileContentManager: NSObject {
        
    init (file:String){
    
        if FileManager.exists(file) == false {
            
            FileManager.create(file)
            
        }
        
    }
    
    func write(content:String) {
        
        let contentToWrite = content as NSString
        
        do {
        
            try contentToWrite.writeToFile(FileManager.filePath, atomically: true, encoding: NSUTF8StringEncoding)
            
        
        }catch{
            
            print("Something went wrong")
            
        }
        
    }
    
    func read() -> String {
        
        var text:String
        
        do {
        
             text = try String(contentsOfFile: FileManager.filePath)
            
        }catch{
            
            text = ""
            
        }
    
        return text
        
    }

    
   
    
}
