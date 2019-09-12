//
//  TicTacToeGameUITests.swift
//  TicTacToeUITests
//
//  Created by Paul Solt on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

class TicTacToeGameUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    // UI click (X)
    // Apple Park + Maps
    
    
    override func setUp() {
        super.setUp()
        print("Starting a new UI Test")
        
        app = XCUIApplication()
        app.launch()
        
    }
    
    func testSavingAndRestartingApp()  {
        // Test saving ... terminate and verify on relaunch it's saved the data
        app.terminate()
        
        // TODO: Test the last edited item is in the tableview
    }
    
}

