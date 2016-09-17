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
    fileprivate var buddies:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "\"The List\""
        friends.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        getSomeData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableViewDataSource implementation
    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return buddies.count
    }
    
    func tableView(_ tableView: UITableView,
        cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            
            let buddy = buddies[(indexPath as NSIndexPath).row] as! Friend
            cell!.textLabel!.text = buddy.value(forKey: "name") as? String
            
            return cell!
    }

    
    // MARK: user interaction
    @IBAction func addFriend(_ sender: AnyObject) {
        
        addFriend(name.text!, age: Int(age.text!)!)
        
    }
    
    
    @IBAction func sortBuddies(_ sender: AnyObject) {
        
        buddies.sort(by: {(a, b) -> Bool in
        
            return (a as! Friend).name < (b as! Friend).name
        
        })
        
        friends.reloadData()
        
    }

    // MARK: Core Data
    func getSomeData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let context = appDelegate.managedObjectContext {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Friend")
            
            let fetchedResults = try! context.fetch(fetchRequest) as? [NSManagedObject]

            if let friends = fetchedResults {
                
                buddies = friends
                
                print(friends.count)
                
                for friend in friends {
                    
                    let val = (friend as! Friend)
                    print("I have a buddy named \(val.name) and his/her age is \(val.age)")
                    
                }
                
                
            }
            
        }
        
    }
    
    func addFriend(_ name:String, age:Int) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let context = appDelegate.managedObjectContext {
         
            // Get access to the class
            let entity = NSEntityDescription.entity(forEntityName: "Friend", in: context)
            
            let friend = NSManagedObject(entity: entity!, insertInto:context)
            
            friend.setValue(name, forKey: "name")
            friend.setValue(age, forKey: "age")
            
            var error: NSError?
            do {
                try context.save()
            } catch let error1 as NSError {
                error = error1
                
                print("Could not save \(error), \(error?.userInfo)")
            
            }

            print(friend)
            
            buddies.append(friend)
            friends.reloadData()
            
        }
        
    }
    

}

