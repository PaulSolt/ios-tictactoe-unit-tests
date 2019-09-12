//
//  TicTacToeGameUITests.swift
//  TicTacToeUITests
//
//  Created by Paul Solt on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest
//@testable import TicTacToe // Tic_Tac_Toe use underscores for spaces/specialcharacter in a project name

class TicTacToeGameUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    // UI click (X)
    // Apple Park + Maps
    
    
    override func setUp() {
        super.setUp()
        print("Starting a new UI Test")
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    /*func testSavingAndRestartingApp()  {
        // Test saving ... terminate and verify on relaunch it's saved the data
        app.terminate()
        
        // TODO: Test the last edited item is in the tableview
    }*/
    
    /// # UI Test Ideas
    /// * Make sure Reset button appears
    /// * Make sure 9 boxes and all empty
    /// * Make sure buttons are actually correct and titled
    /// * Label has text other than Label? (Should say something other than Label - current player is X)
    /// * Making sure when you mark the button, the correct mark is displaying (show a mark in general?)
    /// * Reset should empty the board
    /// * Test marks are taking turns (showing the active player)
    /// * Play a full game
    ///     * Cats game (tie)
    ///     * Vertical win
    ///     * Diagonal win
    ///     * Horizontal win
    
    /// QUESTION: What should be a UI test, and what should be a Unit Test?
    /// * More logic / background, we test a unit (not necessiarly on the screen)
    /// * Test the appearance rather than the logic
    
    // Record a UI Test
    // 1. Move the focus inside the { }
    // 2. Click on the record button
    /*func testRecording() {
       // Place cursor here
     
     // Not clear what we're testing!!!
        
        let element2 = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element(boundBy: 2)
        let button = element.children(matching: .button).matching(identifier: " ").element(boundBy: 0)
        button.tap()
        
        let button2 = element2.children(matching: .other).element(boundBy: 1).children(matching: .button).matching(identifier: " ").element(boundBy: 1)
        button2.tap()
        button.tap()
        button2.tap()
        element.buttons[" "].tap()
        
        
    }*/
    
    // DRY: Don't Repeat Yourself
    
    // Create helper functions / computed properties
    
    
    var statusLabel: XCUIElement {
        let label = app.staticTexts["GameViewController.stausLabel"]  // GameViewController.statusLabel
        XCTAssertTrue(label.exists)
        return label
    }
    
    var restartButton: XCUIElement {
        let button = app.buttons["Restart"]
        XCTAssertTrue(button.exists)
        return button
    }
    
    func buttonAt(_ index: Int) -> XCUIElement {
        let identifier = "BoardViewController.button\(index)"
        let button = app.buttons[identifier]
        XCTAssertTrue(button.exists)
        return button
    }
    
    enum Mark: String, Equatable {
        case x = "X"
        case o = "O"
        case empty = ""
    }    
    
    func testGameBoardIsClearOnStartScratch() {
        
        // TEST: status label
        // TEST: restart button
        
        // BUG: Don't set the accessiblity label because it masks the value of the label
        
        XCTAssertEqual("Player X's turn", statusLabel.label) // label not title (for UILabel)
        
        XCTAssertEqual("Restart", restartButton.label)

        // TEST: All buttons are blank

//        let button = app.buttons["BoardViewController.button0"]
//        button.tap()
        
        // Create a function to get a button # (button 1)
//        buttonAt(0).tap()
        let button0 = buttonAt(0)
        XCTAssertEqual(Mark.empty.rawValue, button0.label)

        button0.tap()
        XCTAssertEqual("X", button0.label)
        
//        print("|\(button.title)|") // TODO: BLANK, why?
//        print("|\(button.label)|") // USE label for buttons
    }
        
//        XCTAssertTrue(restartButton.isHittable)
//        restartButton.tap()
//        XCTAssertTrue(restartButton.isEnabled) // enable / disable an undo button
//    }
    
    
    
    func testGameBoardIsClearOnStart() {
        XCTAssertEqual("Player X's turn", statusLabel.label)
        XCTAssertEqual("Restart", restartButton.label)
        
        
        for index in 0..<9 {
            XCTAssertEqual(Mark.empty.rawValue, buttonAt(index).label)
        }
    }
    
    func testGameBoardResetClearsBoard() {
        XCTAssertEqual("Player X's turn", statusLabel.label)
        XCTAssertEqual("Restart", restartButton.label)
        
        for index in 0..<9 {
            let button = buttonAt(index)
            button.tap()    // TODO: tap and confirm matching value (X or O)
        }
        
        restartButton.tap()
        
        for index in 0..<9 {
            XCTAssertEqual(Mark.empty.rawValue, buttonAt(index).label)
        }
        XCTAssertEqual("Player X's turn", statusLabel.label)
    }

}

