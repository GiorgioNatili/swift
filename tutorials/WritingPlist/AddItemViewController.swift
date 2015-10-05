//
//  AddItemViewController.swift
//  WritingPlist
//
//  Created by Marcy Regalado on 10/4/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet var note: UITextField!
    private var noteTable = NotesTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: user interaction

    @IBAction func addNewNote(sender: AnyObject) {
        
        noteTable.addNote(note.text!)
        navigationController?.popToRootViewControllerAnimated(true)
    
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
