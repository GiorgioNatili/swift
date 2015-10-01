//
//  ViewController.swift
//  ReadFile
//
//  Created by Giorgio Natili on 9/30/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var miniNote: UITextField!
    
    let file = FileContentManager(file: "test.txt")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        miniNote.text = file.read()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSaveNote(sender: AnyObject) {
        
        file.write(miniNote.text!)
        
    }

}

