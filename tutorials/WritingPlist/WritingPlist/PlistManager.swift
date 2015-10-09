////
////  PlistManager.swift
////  WritingPlist
////
////  Created by Giorgio Natili on 10/2/15.
////  Copyright © 2015 io.webplatform.swift. All rights reserved.
////
//
//import UIKit
//import Foundation
//
//class PlistManager: NSObject, ManageListItem {
//    
//    private var plistName:String = ""
//    private var plistPathInDocument:String = ""
//    
//    private let EXTENSION = ".plist"
//    
//    init(plist:String) {
//        
//        super.init()
//
//        self.plistName = plist
//        self.preparePaths()
//        
//    }
//    
//    func preparePlistForUse(plits:String = "") {
//        
//        if plits.characters.count > 0 {
//        
//            plistName = plits
//            preparePaths()
//            
//        }
//        
//        if !NSFileManager.defaultManager().fileExistsAtPath(plistPathInDocument){
//            
//            let plistPathInBundle = NSBundle.mainBundle().pathForResource(plistName, ofType: "plist")!
//            
//            do{
//                
//                try NSFileManager().copyItemAtPath(plistPathInBundle, toPath: plistPathInDocument)
//                
//            }catch let error as NSError {
//                
//                print("something went wrong \(error.description)")
//                
//            }
//        }
//    }
//    
//    // MARK: ManageListItem implementation
//    func addItem(todo:String) {
//        
//        let dict = NSMutableDictionary(contentsOfFile: plistPathInDocument)!
//        
//        dict.setObject("", forKey: todo)
//        dict.writeToFile(plistPathInDocument, atomically: true)
//        
//    }
//    
//    func removeItem(todo:String) {
//        
//        let dict = NSMutableDictionary(contentsOfFile: plistPathInDocument)!
//        
//        dict.removeObjectForKey(todo)
//        dict.writeToFile(plistPathInDocument, atomically: true)
//        
//    }
//    
//    var content: Dictionary<String, AnyObject!> {
//        
//        return readDictionaryFromFile(plistPathInDocument)
//        
//    }
//    
//    // MARK: plist implementation
//    private func preparePaths() {
//        
//        let rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0]
//        let plist = NSURL(fileURLWithPath: rootPath).URLByAppendingPathComponent(plistName + EXTENSION)
//        
//        plistPathInDocument = plist.path!
//        
//    }
//    
//    private func readDictionaryFromFile(filePath:String) -> Dictionary<String, AnyObject!> {
//        
//        var value:Dictionary<String,AnyObject!> = [String: AnyObject]()
//        
//        do {
//            
//            let data : NSData! = try NSData(contentsOfFile: filePath, options: NSDataReadingOptions.DataReadingUncached)
//            let dict : AnyObject! = try NSPropertyListSerialization.propertyListWithData(data, options: NSPropertyListMutabilityOptions.MutableContainersAndLeaves,format: nil)
//            
//            if (dict != nil){
//                
//                if let ocDictionary = dict as? NSDictionary {
//                    
//                    var swiftDict : Dictionary<String,AnyObject!> = Dictionary<String,AnyObject!>()
//                    
//                    for key : AnyObject in ocDictionary.allKeys{
//                        
//                        let stringKey : String = key as! String
//                        
//                        if let keyValue : AnyObject = ocDictionary.valueForKey(stringKey){
//                            
//                            swiftDict[stringKey] = keyValue
//                            
//                        }
//                        
//                    }
//                    
//                    value = swiftDict
//                }
//                
//            }
//            
//        } catch let error as NSError {
//            
//            print("Something went terribly wrong \(error.localizedDescription)")
//            
//        }
//        
//        return value
//        
//    }
//
//}
