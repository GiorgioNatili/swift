//
//  SecondViewController.swift
//  SimpleNavigation
//
//  Created by Natili, Giorgio on 2/21/15.
//  Copyright (c) 2015 Natili, Giorgio. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    @IBAction func openPrompt(sender: AnyObject) {
        
        var alertViewControllerTextField: UITextField?
        
        let promptController = UIAlertController(title: "Type Something", message: nil, preferredStyle: .Alert)
        
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            print("\(alertViewControllerTextField?.text)")
            self.textField.text = alertViewControllerTextField?.text
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in }
        
        promptController.addAction(ok)
        promptController.addAction(cancel)
        
        promptController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            alertViewControllerTextField = textField
        }
        
        presentViewController(promptController, animated: true, completion: nil)
        
    }
    
    func wordEntered(alert: UIAlertAction!){
        

    }
    func addTextField(textField: UITextField!){
    
    }
    @IBAction func goBack(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
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
