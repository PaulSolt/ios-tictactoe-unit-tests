//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Paul Solt on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest
@testable import TicTacToe


class GameBoardTests: XCTestCase {
    
    // Unit Tests always start with "test"
    func testGameBoard() {

        // A compilation error is a unit test failure
        let board = GameBoard()
//         XCTFail("The game board doesn't work properly")
    }
    
    // test<What we are testing><What we expect>()
    func testNewBoardIsEmpty() {
        
        let board = GameBoard()
        
//        board[(0, 0)] // Top left corner
        
        // How do we know if it's empty?
        XCTAssertNil(board[(0, 0)])
        
        // (x, y)
        // (0, 0), (1, 0), (2, 0)
        // (0, 1), (1, 1), (2, 1)
        // (0, 2), (1, 2), (2, 2)
        
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    
    
    
    

    // DON"T do this, documentation and code get out of sync
//    // Tests that we can reset the game and the game board is reset
//    func testA() {
//
//    }
    
    
    
    
    func helper() {
        print("help manage the code...")
    }
    
}

