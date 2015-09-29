//
//  ViewController.swift
//  SimpleJSONLoading
//
//  Created by Giorgio Natili on 9/28/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jokeContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onJokeRecoverd:", name:"jokeFetched", object: nil)

    }
    
    func onJokeRecoverd(notification: NSNotification) {
     
        jokeContent.text = notification.object as! String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fetchJoke(sender: AnyObject) {
        
        let jokeProvider = JokeProvider(decorator: JokeDecorator())
        jokeProvider.getJoke()
        
    }

}

