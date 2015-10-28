//
//  NewDoViewController.swift
//  ParseData
//
//  Created by Max Blaushild on 10/27/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class NewDoViewController: UIViewController {

    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var noteInput: UITextField!
    @IBOutlet weak var titleINput: UITextField!
    
    let todoManager = TodoManager()
    
    @IBAction func addTodo(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        todoManager.add(noteInput.text!, note: titleINput.text!, dueDate: dueDatePicker.date)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
