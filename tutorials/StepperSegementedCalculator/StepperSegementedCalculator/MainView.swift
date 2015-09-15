//
//  MainViewController.swift
//  StepperSegementedCalculator
//
//  Created by Giorgio Natili on 9/14/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class MainView: UIViewController, IRenderData {

    // MARK: UI elements
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var splitBy: UILabel!
    @IBOutlet weak var partyAmount: UILabel!
    @IBOutlet weak var currentTip: UISegmentedControl!
    @IBOutlet weak var currentParties: UIStepper!
    
    // MARK: private properties
    private var presenter:IElaborateData!
    
    // MARK: instance methods override
    override func viewDidLoad() {
        
        super.viewDidLoad()

        presenter = MainViewPresenter(view: self)
        
        billAmount.text = 0.description
        currentTip.selectedSegmentIndex = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: User Interaction
    @IBAction func dataChanged(sender: AnyObject) {
        
        let tip = TipManager.getPercentage(currentTip.selectedSegmentIndex)
        
        presenter.configureMeal(Int(currentParties.value), tip: tip)
        presenter.calculateSplitAmount((billAmount.text as NSString).doubleValue)
        
    }
    
    // MARK: IRenderData implementation
    func updateSplitAmout(amount:String) {
        
        partyAmount.text = amount
        
    }
    
    func updateParties(parties:String) {
        
        splitBy.text = parties
        
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
