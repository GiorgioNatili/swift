//
//  ViewController.swift
//  HelloCoreData
//
//  Created by Giorgio Natili on 8/24/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var friends: UITableView!
    
    // MARK: private property
    private var buddies:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "\"The List\""
        friends.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        getSomeData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableViewDataSource implementation
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return buddies.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
            
            let buddy = buddies[indexPath.row] as! Friend
            cell.textLabel!.text = buddy.valueForKey("name") as? String
            
            return cell
    }

    
    // MARK: user interaction
    @IBAction func addFriend(sender: AnyObject) {
        
        addFriend(name.text, age: age.text.toInt()!)
        
    }
    
    
    @IBAction func sortBuddies(sender: AnyObject) {
        
        buddies.sort({(a, b) -> Bool in
        
            return (a as! Friend).name < (b as! Friend).name
        
        })
        
        friends.reloadData()
        
    }

    // MARK: Core Data
    func getSomeData() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if let context = appDelegate.managedObjectContext {
            
            let fetchRequest = NSFetchRequest(entityName:"Friend")
            var error: NSError?
            
            let fetchedResults = context.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]

            if let friends = fetchedResults {
                
                buddies = friends
                
                println(friends.count)
                
                for friend in friends {
                    
                    let val = (friend as! Friend)
                    println("I have a buddy named \(val.name) and his/her age is \(val.age)")
                    
                }
                
                
            }
            
        }
        
    }
    
    func addFriend(name:String, age:Int) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if let context = appDelegate.managedObjectContext {
         
            // Get access to the class
            let entity = NSEntityDescription.entityForName("Friend", inManagedObjectContext: context)
            
            let friend = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:context)
            
            friend.setValue(name, forKey: "name")
            friend.setValue(age, forKey: "age")
            
            var error: NSError?
            if !context.save(&error) {
                
                println("Could not save \(error), \(error?.userInfo)")
            
            }

            println(friend)
            
            buddies.append(friend)
            friends.reloadData()
            
        }
        
    }
    

}

