// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class SingletonBundle {

     private struct SubStruct {
      
      static var internalKey: String = "1411853287227"
      
    }
  
    class var sharedInstance : SingletonBundle {
      
        struct Static {
            static let instance : SingletonBundle = SingletonBundle(key: SubStruct.internalKey)
        }
        
        return Static.instance
    
    }
    
    init(key:String) {
      
      if(key != SubStruct.internalKey){
      
        NSException(name: NSExceptionName(rawValue: "SingletonBundle ->"), reason: "cannot be instantiated directly", userInfo: nil).raise()
        return
      
      }
      
      print("Instantiation...");
    
    }
    
}

// var classone = SingletonBundle(key: "212")
var classtwo = SingletonBundle.sharedInstance
var classthree = SingletonBundle.sharedInstance

// http://stackoverflow.com/questions/24015207/class-variables-not-yet-supported
// http://stackoverflow.com/questions/24010569/error-handling-in-swift-language
//
