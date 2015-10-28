//
//  TodoManager.swift
//  ParseData
//
//  Created by Giorgio Natili on 10/27/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import Parse

class TodoManager: NSObject {

    private var todos:[Todo] = []
    private let appDelegate:AppDelegate
    var doneValues = [
        0: false,
        1: true
    ]
    
    override init(){
        
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    }
    

    
    func add(title: String, descript: String, done: Int) {
        
        var todo = PFObject(className:"Todo")
        todo["title"] = title
        todo["description"] = descript
        todo["done"] = doneValues[done]
        todo.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                let todoObject = Todo(context: context)
                todoObject.title = title
                todoObject.note = descript
                todoObject.done = done
                
                self.todos.append(
                NSNotificationCenter.defaultCenter().postNotificationName("todosUpdated", object: nil)
            } else {
                // There was a problem, check error.description
            }
        }
    }

    func fetch() {
        
        let query = PFQuery(className:"Todo")
        query.findObjectsInBackgroundWithBlock {
            
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) todos.")
                
                let context = self.appDelegate.managedObjectContext
                
                    // Do something with the found objects
                    for object in objects! {
                        
                        let todo = Todo(context: context)
                        
                        todo.id     = object.objectId!
                        todo.title  = object["title"] as! String
                        todo.note   = object["description"] as! String
                        todo.done   = object["done"]as! Bool
                        
                        self.todos.append(todo)
                        
                    }
                    
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "todosUpdated", object: nil))
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
    }
    
    func remove(id:String) {
        
        let todo = PFObject(className: "Todo")
        
        todo.objectId = id
        todo.deleteInBackgroundWithBlock { (status:Bool, error:NSError?) -> Void in
            
          NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "todoRemoved", object: nil))
            
        }
    }
    
    var list:[Todo] {
        
        get {
            
            return todos
            
        }
        
    }
    
}
