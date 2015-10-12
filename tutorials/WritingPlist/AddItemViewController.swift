//
//  AddItemViewController.swift
//  WritingPlist
//
//  Created by Marcy Regalado on 10/4/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import CoreData

class AddItemViewController: UIViewController {

    @IBOutlet var note: UITextField!
    
    private var manager:PlistManager!
    private var notes = NotesTableViewController()
    
    var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var newNote = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: context) as NSManagedObject
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: user interaction

    @IBAction func addNewNote(sender: AnyObject) {
        
        
        
        // MARK: accessing app delegate and model
        //note: I keep getting an error when I break it up into two lines... still figuring out why
        
        notes.addNote(note.text!)
        NSNotificationCenter.defaultCenter().postNotificationName("refreshData", object: nil)
        navigationController?.popToRootViewControllerAnimated(true)
        
    
    }
    
    
    // MARK: coreData fetching
    
    func getData() {
        
        let fetchRequest = NSFetchRequest(entityName: "Note") //Having errors with this line...
        
        do {
            
            let fetchedResults = try context.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
        }catch let error as NSError{
            
            print("Something went wrong \(error.userInfo)")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
