//
//  EntityManager.swift
//  WritingPlist
//
//  Created by Dmitry Shamis on 10/8/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import CoreData

class EntityManager: NSObject, ManageListItem {

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var context = NSManagedObjectContext!()
    
    var content:Dictionary<String, AnyObject!> = Dictionary<String, AnyObject!>()
    
    override init() {
        super.init()
        
        context = appDelegate.managedObjectContext
        getData()
    }
    
    func getData() {
        let fetchRequest = NSFetchRequest(entityName:"Note")
            
            do {
            
            let fetchedResults = try context.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
                if let notes = fetchedResults {
                    for note in notes {
                        let value = (note as! Note)
                        content[value.title] = value.info
                    }
                }
            
            }catch let error as NSError{
                
                print("Something went wrong \(error.userInfo)")
                
        }
    }
    
    func addItem(title: String, info:String) {
        let entity =  NSEntityDescription.entityForName("Note",
            inManagedObjectContext:context)
        let note = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: context)
        
        note.setValue(title, forKey: "title")
        note.setValue(info, forKey: "info")
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

        getData()
    }
    
    func removeItem(title: String) {
        let fetchRequest = NSFetchRequest(entityName:"Note")
        
        do {
            
            var toDelete:Note!
            let fetchedResults = try context.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let notes = fetchedResults {
                
                for note in notes {
                    
                    let val = (note as! Note)
                    
                    if val.title == title {
                        
                        toDelete = val
                        break
                        
                    }
                    
                }
                
                context.deleteObject(toDelete)
                try context.save()
                
            }
            
            
        } catch let error as NSError {
            
            // Handle error
            
        }
        
        getData()
    }
}