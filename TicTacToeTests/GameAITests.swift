//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Paul Solt on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

// Allows us to test internal functions, otherwise we can't see them
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    // Game logic
    // * win conditions
    //     * x wins
    //     * o wins
    //     * cats games
    //     * row in a direction is filled (horizontal, vertical, diagonal)
    // * Game player
    
    // ... what else?
    
    
    func testThereIsNoWinnerWithNewGame() {
        var board = GameBoard()
        
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    // TDD = Test Driven Development
    
    // Red, Green, Refactor (1 test at a time)
    // 1. Red = Write a failing test (compilation errors are failure)
    // 2. Green = Make the test pass (Implement method / logic so test passes)
        // Don't write additional code, just the minimum amount to pass
    // 3. Refactor = Clean up code, rearrange, rename, add more helper functions, etc.
    
    /*
     x o -
     x o -
     x - -

     (x, y)
     (0, 0), (1, 0), (2, 0)
     (0, 1), (1, 1), (2, 1)
     (0, 2), (1, 2), (2, 2)
     */
    
    func testXWinCheckingVertical1() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
    }
    
    func testOWinCheckingVertical1() throws {
        var board = GameBoard()
        
        try board.place(mark: .o, on: (0, 0))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (0, 1))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (0, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
    }
    
    /*
     - x o
     - x o
     - x -
     */
    func testXWinCheckingVertical2() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (2, 0))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (2, 1))
        try board.place(mark: .x, on: (1, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
    }
    
    func testXWinCheckingVertical3() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (2, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (2, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
    }
    
    // Retest last function: Command + Control + Option + G
    func testXNotWinConditionVertical1and2() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (2, 0))
        try board.place(mark: .x, on: (2, 1))
        try board.place(mark: .x, on: (1, 0))
        
        let winCondition = game(board: board, isWonBy: .x)
        
        XCTAssertFalse(winCondition)
    }
    
}
