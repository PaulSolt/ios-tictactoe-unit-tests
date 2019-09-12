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
    
    // testPlacingMark
    func testPlacingXMarkInTopLeftCorner() throws {
        var board = GameBoard()
        
        // Don't really want to catch errors in a test, we want to fail
//        do {
//            board.place(mark: .x, on: (0, 0))
//        } catch {
//
//        }
        
        try board.place(mark: .x, on: (0, 0))

        // AssertEqual(expected, actual)
        XCTAssertEqual(.x, board[(0, 0)])
    }
    
//    func testNewMarkOnExistingMark
//    func testNoNewMarkOnExistingMark() {
    func testPlacingDuplicateMarkThrowsError() throws {
        
        var game = GameBoard()
        try game.place(mark: .x, on: (0, 0))
        
        XCTAssertThrowsError(try game.place(mark: .o, on: (0, 0))) { (error) in
            
            // Test the error is correct errors
            XCTAssertEqual(GameBoardError.invalidSquare, error as? GameBoardError)
        }
    }
    
    
    class MyQueue {
        private var data = [1, 2, 3]
        
        subscript(index: Int) -> Int {
            return data[index]
        }
        
        var count: Int {
            return data.count
        }
    }
    
    func testQueue() {
        let queue = MyQueue()
        
        for i in 0 ..< queue.count {
            print(queue[i])
        }
        
        //let name = "Paul"
        //name[0] // 'subscript(_:)' is unavailable: cannot subscript String with an Int, see the documentation comment for discussion
        var grades = [String: Int]()
        grades["Paul"] = 75
        print(grades["Paul"] ?? "Empty")
        
        
    }
    
    
    
    // Talk about more tests
    // * Full board
    // * Reset board is empty
    // * can't place another mark in the same square
    
   
    
    
    

    // DON"T do this, documentation and code get out of sync
//    // Tests that we can reset the game and the game board is reset
//    func testA() {
//
//    }
    
    
    
    
    func helper() {
        print("help manage the code...")
    }
    
}

