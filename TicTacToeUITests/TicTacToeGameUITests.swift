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

// BUG: We need to redeclare an enum in the UI Test file ... WHY?
enum Mark: String, Equatable {
    case x = "X"
    case o = "O"
    case empty = ""
}

/*
 # UI Test Ideas
 - Make sure Reset button appears
 - Make sure 9 boxes and all empty
 - Make sure buttons are actually correct and titled
 - Label has text other than Label? (Should say something other than Label - current player is X)
 - Making sure when you mark the button, the correct mark is displaying
 - show a mark in general?
 - Reset should empty the board
 - Test marks are taking turns (showing the active player)
 - Play a full game
 - Cats game (tie)
 - Vertical win
 - Diagonal win
 - Horizontal win
 
 QUESTION: What should be a UI test, and what should be a Unit Test?
 - More logic / background, we test a unit (not necessiarly on the screen)
 - Test the appearance rather than the logic
 
 */



class TicTacToeGameUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    // Create properties to make finding / using UI elements easy
    // NOTE: You may want to use inner classes to help organize (MainScreen.statusLabel, etc.)
    
    var statusLabel: XCUIElement {
        let label = app.staticTexts["GameViewController.stausLabel"]
        XCTAssertTrue(label.exists)
        return label
    }
    
    var restartButton: XCUIElement {
        let button = app.buttons["Restart"]
        XCTAssertTrue(button.exists)
        return button
    }
    
    // Helper functions
    
    func buttonAt(_ index: Int) -> XCUIElement {
        let identifier = "BoardViewController.button\(index)"
        let button = app.buttons[identifier]
        XCTAssertTrue(button.exists)
        return button
    }
    
    override func setUp() {
        super.setUp()
        print("Starting a new UI Test")
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        //app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    /*func testSavingAndRestartingApp()  {
     // Test saving ... terminate and verify on relaunch it's saved the data
     app.terminate()
     
     // TODO: Test the last edited item is in the tableview
     }*/
    
    // Record a UI Test
    // 1. Move the focus inside the { }
    // 2. Click on the record button
    /*func testRecording() {
     // Place cursor here
     
     // Not very clear what we're testing!!!
     
     let element2 = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element
     // ...
     }*/
    
    // DRY: Don't Repeat Yourself
  
    func testGameBoardIsClearOnStart() {
        XCTAssertEqual("Player X's turn", statusLabel.label)
        XCTAssertEqual("Restart", restartButton.label)
        for index in 0..<9 {
            XCTAssertEqual(Mark.empty.rawValue, buttonAt(index).label)
        }
    }
    
    // AAA Arrange, Act, Assert
    func testGameBoardResetClearsBoard() {
        // Arrange
        for index in 0..<9 {
            let button = buttonAt(index)
            button.tap()    // TODO: tap and confirm matching value (X or O)
        }
        
        // Act
        restartButton.tap()
        
        // Assert
        for index in 0..<9 {
            XCTAssertEqual(Mark.empty.rawValue, buttonAt(index).label)
        }
        XCTAssertEqual("Player X's turn", statusLabel.label)
    }
    
    func testPlayerXVerticalWin1() {
        // x o -
        // x o -
        // x - -
        buttonAt(0).tap()
        buttonAt(1).tap()
        buttonAt(3).tap()
        buttonAt(4).tap()
        buttonAt(6).tap()
        
        XCTAssertEqual("Player X won!", statusLabel.label)
    }
    
// Test asynchronous logic using an expectation
func testExpectation() {
    let didFinish = expectation(description: "didFinish")
    var name = ""
    let url = URL(string: "https://apple.com")!
    
    URLSession.shared.dataTask(with: url) { (data, _, _) in
        didFinish.fulfill()
        name = "Dave"
    }.resume()

    wait(for: [didFinish], timeout: 5) // blocking sync wait
    
    // Assertion only happens after the time out, or web request completes
    XCTAssertEqual("Dave", name)
}
}

