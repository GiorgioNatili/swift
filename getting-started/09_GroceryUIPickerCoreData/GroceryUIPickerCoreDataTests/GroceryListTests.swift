//
//  GroceryListTests.swift
//  GroceryUIPickerCoreData
//
//  Created by Giorgio Natili on 9/7/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import XCTest
import GroceryUIPickerCoreData

class GroceryListTests: XCTestCase {

    override func setUp() {
        super.setUp()
        
//        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
//        let navigationController = storyboard.instantiateInitialViewController() as! GroceryTableViewController
//        viewController = navigationController.topViewController as! GroceryTableViewController
//        
//        UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
//        
//        // Test and Load the View at the Same Time!
//        XCTAssertNotNil(navigationController.view)
//        XCTAssertNotNil(viewController.view)
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRendersData() {
        
        // given
        let items = ["pasta", "apple", "meat"]
        
        // when 
        
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

    
}
