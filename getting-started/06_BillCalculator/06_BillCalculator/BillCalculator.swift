//
//  BillCalculator.swift
//  06_BillCalculator
//
//  Created by Giorgio Natili on 6/27/15.
//  Copyright (c) 2015 Giorgio Natili. All rights reserved.
//

import Foundation

class BillCalculator {
    
    private var amount:Double
    private var people:Int
    private var percentage:Double
    
    init (amount:Double, people:Int, percentage:Double) {
        
        self.amount = amount
        self.people = people
        self.percentage = percentage
        
    }
    
    func amountToPay() -> Double {
        
        var billWithTip = amount + (amount / 100 * percentage)
        var billSplit = billWithTip / Double(people)
        
        return billSplit
        
    }
    
}