//
//  GameBoard.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

enum GameBoardError: Error, Equatable {
    case invalidSquare
}

// (x, y)
// (0, 0)
typealias Coordinate = (x: Int, y: Int)

// BUG not working
enum Mark: String, Equatable {
    case x = "X"
    case o = "O"
    case empty = ""
}

struct GameBoard: CustomStringConvertible, CustomDebugStringConvertible {
    
    
    var description: String {
        var output: String = ""
        
        for y in 0..<3 {
            for x in 0..<3 {
                let index = arrayIndex(for: (x, y))
                let square = squares[index]
                
                switch square {
                case .empty:
                    output += "- "
                case .filled(let mark):
                    output += "\(mark.rawValue) "
                }
            }
            output += "\n"
        }
        return output
    }
    
    var debugDescription: String {
        return "Debug details ..."
    }
    
    
    private enum Square: Equatable {
        case filled(Mark)
        case empty
    }
    
    subscript(coordinate: Coordinate) -> Mark? {
        print("\(coordinate.x), \(coordinate.y)")
        let square = squares[arrayIndex(for: coordinate)]
        if case Square.filled(let mark) = square {
            return mark
        } else {
            return nil
        }
    }
    
    mutating func place(mark: Mark, on square: Coordinate) throws {
        if self[square] != nil {
            throw GameBoardError.invalidSquare
        }
        squares[arrayIndex(for: square)] = .filled(mark)
    }
    
    var isFull: Bool {
        for square in squares {
            if square == .empty {
                return false
            }
        }
        return true
    }
    
    private func arrayIndex(for square: Coordinate) -> Int {
        return square.y * 3 + square.x
    }
    //[0 1 2] [3 4 5] [6 7 8]
    // (0, 0) = 0 * 3 + 0 = 0
    // (0, 1) = 1 * 3 + 0 = 3
    private var squares = Array(repeating: Square.empty, count: 9)
}
