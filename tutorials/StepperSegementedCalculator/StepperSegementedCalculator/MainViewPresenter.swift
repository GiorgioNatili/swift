//
//  MainViewPresenter.swift
//  StepperSegementedCalculator
//
//  Created by Giorgio Natili on 9/14/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class MainViewPresenter: NSObject, IElaborateData {
   
    private var view:IRenderData
    private var splitCalculator:ISplitBill
    private var totalWithTip:Double!

    private var meal:Meal?
    
    private let parties:String = "Parties"
    
    init(view:IRenderData){
        
        self.view = view
        self.splitCalculator = SplitCalculator()
        
    }
    
    // MARK: IElaborateData implementation
    func configureMeal(parties:Int, tip:Double) {
        
        meal = Meal()
        
        meal!.parties = parties
        meal!.tip = tip
        
    }
    
    func calculateSplitAmount(amount:Double){
        
        splitCalculator.amount = amount
        
        if let currentMeal = meal {
            
            totalWithTip = splitCalculator.calculateSplitAmount(currentMeal)
            updateView()
            
        }
    
    }
    
    private func updateView() {
        
        view.updateSplitAmout(totalWithTip.description)
        view.updateParties(getFormattedParties())
        
    }
    
    private func getFormattedParties() -> String {
        
        var formattedParties = parties
        
        if let currentMeal = meal {
            
            formattedParties = ("\(formattedParties) \(currentMeal.parties)")
            
        }
        
        return formattedParties
        
    }
    
}
