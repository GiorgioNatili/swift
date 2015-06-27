//
//  ViewController.swift
//  06_BillCalculator
//
//  Created by Giorgio Natili on 6/27/15.
//  Copyright (c) 2015 Giorgio Natili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var people:Int?
    private var percentage:Double?
    
    private enum Percentages:Double {
        
        case POOR = 10.00
        case AVERAGE = 15.00
        case FAIR =  18.00
        case GOOD = 20.00
        
    }
    
    // MARK: UI outlets
    @IBOutlet weak var percentage_txt: UITextField!
    @IBOutlet weak var people_txt: UITextField!
    @IBOutlet weak var bill_txt: UITextField!
    @IBOutlet weak var amount_txt: UILabel!
    
    // MARK: ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        people = 1
        percentage = Percentages.AVERAGE.rawValue
        
        updateValues()
          
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UI updates 
    private func updateValues() {
        
        if let perc = percentage?.description {
            
            percentage_txt.text = perc + "%"
            
        }
        
        if let num = people?.description {
            
            people_txt.text = num
        
        }
        
        if let value = (bill_txt.text as? NSString) {
        
            let bill = BillCalculator(amount: value.doubleValue, people: people!, percentage: percentage!)
            
            amount_txt.text = bill.amountToPay().description
            
        }
    }

    // MARK: percentage interaction
    @IBAction func increasePercentage(sender: AnyObject) {
        
        percentage! += 1.00
        updateValues()
        
    }
    
    @IBAction func decreasePecentage(sender: AnyObject) {
    
        percentage! -= 1.00
        updateValues()
    
    }
    
    // MARK: people interaction
    @IBAction func increasePeople(sender: AnyObject) {
    
        people! += 1
        updateValues()
        
    }
    
    @IBAction func decreasePeople(sender: AnyObject) {
        
        people! -= 1
        updateValues()
        
    }
    
}

