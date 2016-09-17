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
    
    @IBAction func openPrompt(_ sender: AnyObject) {
        
        var alertViewControllerTextField: UITextField?
        
        let promptController = UIAlertController(title: "Type Something", message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
            print("\(alertViewControllerTextField?.text)")
            self.textField.text = alertViewControllerTextField?.text
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in }
        
        promptController.addAction(ok)
        promptController.addAction(cancel)
        
        promptController.addTextField { (textField) -> Void in
            alertViewControllerTextField = textField
        }
        
        present(promptController, animated: true, completion: nil)
    }
    
    func wordEntered(_ alert: UIAlertAction!){
        

    }
    
    func addTextField(_ textField: UITextField!){
    
    }
    
    @IBAction func goBack(_ sender: AnyObject) {
        
        self.navigationController?.popToRootViewController(animated: true)
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
