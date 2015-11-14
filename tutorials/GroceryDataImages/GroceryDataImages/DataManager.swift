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
    
    enum DataStatus:Int {
     
        case Inserted = 2
        case Recovered = 1
        case Failed = 0
        
    }
    
    private var groceryItems:[NSManagedObject]
    private var appDelegate:AppDelegate
    
    init() {
        
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        groceryItems = []
        
        recoverItems()
        
    }
    
    func addItem(name:String, category:Int) {
        
        let context = appDelegate.managedObjectContext

        do {
            
            // Get access to the class
            let entity = NSEntityDescription.entityForName("GroceryItem", inManagedObjectContext: context)
            
            let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:context)
            
            item.setValue(name, forKey: "name")
            item.setValue(category, forKey: "category")
            
            try context.save()
            
            groceryItems.append(item)
            notifyUpdates(.Inserted)
            
        }catch let error as NSError{
            
           notifyUpdates(.Failed)
            
        }

    }
    
    private func recoverItems() {
        
        let context = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:"GroceryItem")
        
        do {
            
            let fetchedResults = try context.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let items = fetchedResults {
                
                groceryItems = items
                
            }
            
            notifyUpdates(.Recovered)
            
        }catch let error as NSError{
            
           notifyUpdates(.Failed)
            
        }
        
    }
    
    private func notifyUpdates(status:DataStatus) {
        
        switch status {
            
        case .Inserted:
            NSNotificationCenter.defaultCenter().postNotificationName("groceryItemsUpdated", object: nil)
            break
         
        case .Recovered:
            NSNotificationCenter.defaultCenter().postNotificationName("groceryItemsUpdated", object: nil)
            break
            
        case .Failed:
            NSNotificationCenter.defaultCenter().postNotificationName("groceryItemsError", object: nil)
            break
            
        }
        
    }
    
    func getItems() -> [GroceryItem] {
        
        return groceryItems.map { return $0 as! GroceryItem }
        
    }
    
}