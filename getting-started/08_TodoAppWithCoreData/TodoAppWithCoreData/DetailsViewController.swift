//
//  DetailsViewController.swift
//  TodoAppWithCoreData
//
//  Created by Giorgio Natili on 9/1/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todoContent: UITextView!
    
    // Mark: private properties
    private var todo:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTitle.text = todo
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var todoItem:String
    {
        set {
            
            todo = newValue
        }
        get {
            
            return todo
            
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
