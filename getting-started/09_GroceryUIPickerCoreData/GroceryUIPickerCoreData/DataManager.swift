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
    
    fileprivate var todoItems:[NSManagedObject]
    fileprivate var appDelegate:AppDelegate
    
    init() {
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        todoItems = []
        
        recoverItems()
        
    }
    
    func addItem(_ name:String, type:String) {
        
        let context = appDelegate.managedObjectContext
            
        // Get access to the class
        let entity = NSEntityDescription.entity(forEntityName: "GroceryItem", in: context)
            
        let item = NSManagedObject(entity: entity!, insertInto:context)
            
        item.setValue(name, forKey: "name")
        item.setValue(type, forKey: "type")
            
        do {
                
            try context.save()
                
        } catch let error as NSError {
            
            print("Something went wrong \(error.userInfo)")
                
        }
            
        todoItems.append(item)
            
        // dispatch event
        notifyUpdates()
        
    }
    
    fileprivate func recoverItems() {
        
        let context = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:"GroceryItem")
            
        do {
                
            let fetchedResults = try context.fetch(fetchRequest) as? [NSManagedObject]
                
            if let items = fetchedResults {
                    
                todoItems = items
                    
            }
                
                
        }catch let error as NSError{
                
            print("Something went wrong \(error.userInfo)")
                
        }
        
    }
    
    fileprivate func notifyUpdates() {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "todoItemsUpdated"), object: nil)
        
    }
    
    func getItems() -> [GroceryItem] {
        
        return todoItems.map { return $0 as! GroceryItem }
        
    }
    
}
