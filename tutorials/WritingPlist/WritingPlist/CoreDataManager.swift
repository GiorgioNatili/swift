//
//  CoreDataManager.swift
//  WritingPlist
//
//  Created by Giorgio Natili on 10/5/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject, ManageListItem {

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var currentContent:Dictionary<String, AnyObject!> = Dictionary<String, AnyObject!>()
    
    var context:NSManagedObjectContext!
    
    override init() {
        
        super.init()
        
        context = appDelegate.managedObjectContext
        getData()
        
    }
    
    private func getData() {
     
        let fetchRequest = NSFetchRequest(entityName:"Note")
        
        do {
            
            let fetchedResults = try context.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let notes = fetchedResults {
                
                for note in notes {
                    
                    let val = (note as! Note)
                    currentContent[val.title!] = ""
                    
                }
                
            }
            
        }catch let error as NSError{
            
            print("Something went wrong \(error.userInfo)")
            
        }

        
    }
    
    // MARK: ManageListItem implementation
    func addItem(item:String) {
        
        // Get access to the class
        let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext: context)
        let note = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:context)
        
        note.setValue(item, forKey: "title")
        
        do {
            
            try context.save()
            
        } catch let error as NSError {
            
            print("Could not save \(error), \(error.userInfo)")
            
        }
        
         getData()

    }
    
    func removeItem(item:String){
        
        let fetchRequest = NSFetchRequest(entityName:"Note")
        
        do {
            
            var toDelete:Note!
            let fetchedResults = try context.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let notes = fetchedResults {
            
                for note in notes {
                    
                    let val = (note as! Note)
                    
                    if val.title == item {
                        
                        toDelete = val
                        currentContent[val.title!] = nil

                        break
                        
                    }
                    
                }
                
                context.deleteObject(toDelete)
                try context.save()
        
            }
            
            
        } catch let error as NSError {
        
            // Handle error
            print("Something went wrong \(error.userInfo)")
        
        }
        
        getData()
        
    }
    
    var content:Dictionary<String, AnyObject!> {
        
        return currentContent
    
    }
    
}
