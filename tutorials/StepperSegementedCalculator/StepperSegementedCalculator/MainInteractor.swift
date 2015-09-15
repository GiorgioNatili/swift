//
//  MainInteractor.swift
//  StepperSegementedCalculator
//
//  Created by Giorgio Natili on 9/14/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import Foundation

protocol IRenderData {
    
    func updateSplitAmout(amount:String)
    func updateParties(parties:String)
    
}

protocol IElaborateData {
    
    func configureMeal(parties:Int, tip:Double)
    func calculateSplitAmount(amount:Double)
    
}