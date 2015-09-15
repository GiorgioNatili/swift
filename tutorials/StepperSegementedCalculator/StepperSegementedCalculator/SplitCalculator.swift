//
//  SplitCalculator.swift
//  StepperSegementedCalculator
//
//  Created by Giorgio Natili on 9/14/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

protocol ISplitBill {
    
    var amount:Double { set get }
    func calculateSplitAmount(meal:Meal) -> Double
    
}

class SplitCalculator: NSObject, ISplitBill {
   
    private var _amount:Double? = 0.0
    
    func calculateSplitAmount(meal: Meal) -> Double {
        
        var splitAmount = 0.0
        
        if let tot = _amount {
            
            splitAmount = (tot + (tot * meal.tip)) / Double(meal.parties)
            
        }
        
        return splitAmount
    }
    
    var amount:Double {
        
        set{
            
            _amount = newValue
            
        }
        
        get{
            
            return _amount!
            
        }
        
    }
    
}
