//
//  AddItemViewController.swift
//  ParseData
//
//  Created by Matthew Hartwig on 10/27/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    let toDoManager = TodoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var description: UITextField!

    @IBOutlet weak var doneChooser: UISegmentedControl!
    
    @IBAction func didHitDone(sender: AnyObject) {
        toDoManager.add(titleField.text, description.text, doneChooser.selectedSegmentIndex)
        dismissViewControllerAnimated(true, completion: nil)

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
