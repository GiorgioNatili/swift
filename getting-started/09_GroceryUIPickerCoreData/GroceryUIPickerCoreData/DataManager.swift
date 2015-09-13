//
//  DataManager.swift
//  GroceryUIPickerCoreData
//
//  Created by Giorgio Natili on 9/9/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    
    private var todoItems:[NSManagedObject]
    private var appDelegate:AppDelegate
    
    init() {
        
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        todoItems = []
        
        recoverItems()
        
    }
    
    func addItem(name:String, type:String) {
        
        if let context = appDelegate.managedObjectContext {
            
            // Get access to the class
            let entity = NSEntityDescription.entityForName("GroceryItem", inManagedObjectContext: context)
            
            let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:context)
            
            item.setValue(name, forKey: "name")
            item.setValue(type, forKey: "type")
            
            var error: NSError?
            if !context.save(&error) {
                
                println("Could not save \(error), \(error?.userInfo)")
                
            }
            
            todoItems.append(item)
            
            // dispatch event
            notifyUpdates()
            
        }

    }
    
    private func recoverItems() {
        
        if let context = appDelegate.managedObjectContext {
            
            let fetchRequest = NSFetchRequest(entityName:"GroceryItem")
            var error: NSError?
            
            let fetchedResults = context.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
            
            if let items = fetchedResults {
                
                todoItems = items
                
            }
            
            // dispatch event
            notifyUpdates()
            
        }

        
    }
    
    private func notifyUpdates() {
        
        NSNotificationCenter.defaultCenter().postNotificationName("todoItemsUpdated", object: nil)
        
    }
    
    func getItems() -> [GroceryItem] {
        
        return todoItems.map { return $0 as! GroceryItem }
        
    }
    
}