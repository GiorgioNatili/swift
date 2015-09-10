//
//  AddTodoViewController.swift
//  TodoAppWithCoreData
//
//  Created by Giorgio Natili on 8/31/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController, UITextFieldDelegate {

    // MARK: outlets
    @IBOutlet weak var todo: UITextField!
    
    // MARK: properties
    var tableData:TodoTableViewController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        todo.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: user interaction
    @IBAction func addItem(sender: AnyObject) {
        
        tableData.addTodoItem(todo.text)
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // MARK: UITextFieldDelegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        println(textField.text)
        
        if count(textField.text) < 3 {
            
            todo.layer.cornerRadius = 8.0
            todo.layer.masksToBounds = true
            todo.layer.borderColor = UIColor.redColor().CGColor
            todo.layer.borderWidth = 1.0
            
        }else{
            
            todo.layer.cornerRadius = 8.0
            todo.layer.masksToBounds = true
            todo.layer.borderColor = UIColor.grayColor().CGColor
            todo.layer.borderWidth = 1.0
            
        }
        
        return true
        
    }
    
    func textFieldDidBeginEditing(textFieldThatEdited: UITextField) {
        
        todo.placeholder = "add a todo"
        
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
