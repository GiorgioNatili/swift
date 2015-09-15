//
//  TipManager.swift
//  StepperSegementedCalculator
//
//  Created by Giorgio Natili on 9/14/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class TipManager: NSObject {
   
    static private let percentages = [0.10, 0.15, 0.20]
    
    static func getPercentage(index:Int) -> Double{
        
        return TipManager.percentages[index]
        
    }
    
}
