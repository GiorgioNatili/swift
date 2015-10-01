//
//  ViewController.swift
//  UserDataPersistence
//
//  Created by Giorgio Natili on 9/29/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: UI items
    @IBOutlet weak var backgroundColor: UISegmentedControl!
    
    let colorManager = ColorManager()
    let preferenceManager = PreferenceManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let color = colorManager.retrieveColor()
        
        ColorChanger.updateUI(self.view, colorSelection: color)
        backgroundColor.selectedSegmentIndex = color
        
    }
    
    override func shouldAutorotate() -> Bool {
                
        return preferenceManager.shouldRotate()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: user interaction
    @IBAction func storeBackground(sender: AnyObject) {
        
        colorManager.saveColor(backgroundColor.selectedSegmentIndex)
        
    }
    
    @IBAction func didColorChanged(sender: AnyObject) {
        
        ColorChanger.updateUI(self.view, colorSelection: backgroundColor.selectedSegmentIndex)
        
    }

}

