//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

/*
 x o -
 x o -
 x - -
 */

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    
    // How do know if X won in the vertical direction?
    
    if board[(0, 0)] == player &&
        board[(0, 1)] == player &&
        board[(0, 2)] == player
        
        {
        return true
    }
    
    /*
     - x o
     - x o
     - x -
     */
    
    /*  (x, y)
     (0, 0), (1, 0), (2, 0)
     (0, 1), (1, 1), (2, 1)
     (0, 2), (1, 2), (2, 2)
     */
    if board[(1, 0)] == player &&
        board[(1, 1)] == player &&
        board[(1, 2)] == player {
        return true
    }
    
    
    
    return false
}
