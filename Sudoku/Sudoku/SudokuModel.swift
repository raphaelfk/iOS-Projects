//
//  SudokuModel.swift
//  Sudoku
//
//  Created by Raphael Ferezin Kitahara on 18/03/23.
//

import Foundation
import SwiftUI

enum DificultyLevel {
    case easy
    case medium
    case hard
}

class SudokuModel: ObservableObject {
    @Published var board = [[Tile]]()
    @Published var pastBoard = [[Tile]]()
    @Published var numberPad = [PadTile]()
    @Published var dificulty: DificultyLevel
    @Published var numberCount: [Int] = [0,0,0,0,0,0,0,0,0,0]
    
    // board models
    let easyBoard = [
        [0,0,2,7,0,0,6,3,9],
        [5,8,3,0,1,6,4,7,0],
        [6,9,0,4,0,0,8,0,0],
        [7,1,8,0,0,9,0,6,0],
        [0,0,0,0,0,4,7,0,5],
        [0,0,0,3,0,0,1,9,8],
        [2,0,4,8,0,5,9,0,0],
        [8,7,0,0,0,1,5,0,3],
        [0,0,0,0,0,3,2,0,0]
    ]
    
    let easySolution = [
        [1,4,2,7,5,8,6,3,9],
        [5,8,3,9,1,6,4,7,2],
        [6,9,7,4,3,2,8,5,1],
        [7,1,8,5,2,9,3,6,4],
        [3,6,9,1,8,4,7,2,5],
        [4,2,5,3,6,7,1,9,8],
        [2,3,4,8,7,5,9,1,6],
        [8,7,6,2,9,1,5,4,3],
        [9,5,1,6,4,3,2,8,7]
    ]
    
    let mediumBoard = [
        [0,0,9,7,0,0,0,6,0],
        [0,7,1,0,4,0,9,2,8],
        [0,4,0,9,8,6,7,0,0],
        [0,8,0,0,0,0,0,9,0],
        [0,1,0,6,2,0,0,4,0],
        [2,0,4,0,0,7,5,0,6],
        [0,0,0,5,6,8,0,0,2],
        [4,0,7,0,3,0,6,8,0],
        [5,0,0,2,7,0,0,3,9]
    ]
    
    let mediumSolution = [
        [8,5,9,7,1,2,3,6,4],
        [6,7,1,3,4,5,9,2,8],
        [3,4,2,9,8,6,7,5,1],
        [7,8,6,4,5,1,2,9,3],
        [9,1,5,6,2,3,8,4,7],
        [2,3,4,8,9,7,5,1,6],
        [1,9,3,5,6,8,4,7,2],
        [4,2,7,1,3,9,6,8,5],
        [5,6,8,2,7,4,1,3,9]
    ]
    
    let hardBoard = [
        [7,0,0,2,0,0,0,6,0],
        [0,0,0,0,6,7,0,2,0],
        [0,0,0,0,0,9,0,0,0],
        [6,0,7,5,0,0,0,0,0],
        [5,0,0,0,0,3,0,0,6],
        [0,0,0,0,1,0,7,0,2],
        [0,0,0,9,8,0,0,0,1],
        [0,0,0,0,0,0,9,0,5],
        [8,3,9,0,0,0,0,0,0]
    ]
    
    let hardSolution = [
        [7,9,1,2,3,5,4,6,8],
        [4,5,8,1,6,7,3,2,9],
        [3,2,6,8,4,9,5,1,7],
        [6,4,7,5,2,8,1,9,3],
        [5,1,2,7,9,3,8,4,6],
        [9,8,3,4,1,6,7,5,2],
        [2,7,5,9,8,4,6,3,1],
        [1,6,4,3,7,2,9,8,5],
        [8,3,9,6,5,1,2,7,4]
    ]
    
    
    // initialization of class
    init(dificulty: DificultyLevel) {
        
        self.dificulty = dificulty
        
        // setting up the board
        if(dificulty == .easy) {
            for i in 0...8 {
                var line = [Tile]()
                for j in 0...8 {
                    line.append(Tile(number: easyBoard[i][j]))
                    numberCount[easyBoard[i][j]] += 1
                }
                board.append(line)
            }
        } else if (dificulty == .medium) {
            for i in 0...8 {
                var line = [Tile]()
                for j in 0...8 {
                    line.append(Tile(number: mediumBoard[i][j]))
                    numberCount[easyBoard[i][j]] += 1
                }
                board.append(line)
            }
        } else {
            for i in 0...8 {
                var line = [Tile]()
                for j in 0...8 {
                    line.append(Tile(number: hardBoard[i][j]))
                    numberCount[easyBoard[i][j]] += 1
                }
                board.append(line)
            }
        }
        
        // creating number pad
        for i in 1...9 {
            self.numberPad.append(PadTile(number: i))
            if (numberCount[i] == 9) {
                self.numberPad[i-1].completed = true
            }
        }
    }
    
    // restarts the board
    func restart() {
        // setting up the board
        if(dificulty == .easy) {
            for i in 0...8 {
                var line = [Tile]()
                for j in 0...8 {
                    line.append(Tile(number: easyBoard[i][j]))
                }
                board.append(line)
            }
        } else if (dificulty == .medium) {
            for i in 0...8 {
                var line = [Tile]()
                for j in 0...8 {
                    line.append(Tile(number: mediumBoard[i][j]))
                }
                board.append(line)
            }
        } else {
            for i in 0...8 {
                var line = [Tile]()
                for j in 0...8 {
                    line.append(Tile(number: hardBoard[i][j]))
                }
                board.append(line)
            }
        }
        
        for i in 1...9 {
            numberPad.append(PadTile(number: i))
        }
    }
    
    func registerBoard() {
        self.pastBoard = self.board
    }
    
    func undo() {
        self.board = self.pastBoard
    }
    
    func checkBoard() -> Bool {
        for row in 0...8 {
            for col in 0...8 {
                if (dificulty == .easy) {
                    if (self.board[row][col].number != self.easySolution[row][col]) {
                        return false
                    }
                } else if (dificulty == .medium) {
                    if (self.board[row][col].number != self.mediumSolution[row][col]) {
                        return false
                    }
                } else {
                    if (self.board[row][col].number != self.hardSolution[row][col]) {
                        return false
                    }
                }
            }
        }
        return true
    }
}
    
// below are the functions I created for generating a new board. they did not generate a board with an unique solution, so I decided to start exploring sudoku APIs, but, unfortunately, I wasn't able to make them work in time, so I set up three boards with different difficulties to use.
    
//    func checkInsertion(board: [[Tile]], row: Int, col: Int, number: Int) -> Bool {
//        // checking the row and column
//        for i in 0...8 {
//            if(board[row][i].number == number) {
//                return false
//            } else if(board[i][col].number == number) {
//                return false
//            }
//        }
//
//        // checking the box
//        for i in row / 3 * 3 ... row / 3 * 3 + 2 {
//            for j in col / 3 * 3 ... col / 3 * 3 + 2 {
//                if(board[i][j].number == number) {
//                    return false
//                }
//            }
//        }
//
//        return true
//    }
//
//    func solveBoard(board: [[Tile]], row: Int, col: Int) -> Bool {
//        if row == 9 {
//            return true
//        } else if col == 9 {
//            return solveBoard(board: board, row: row+1, col: 0)
//        } else if board[row][col].number != 0 {
//            return solveBoard(board: board, row: row, col: col+1)
//        } else {
//            for i in 1...9 {
//                if(checkInsertion(board: board, row: row, col: col, number: i)) {
//                    self.board[row][col].number = i
//                    if(solveBoard(board: board, row: row, col: col+1)) {
//                        return true
//                    } else {
//                        self.board[row][col].number = 0
//                    }
//                }
//            }
//            return false
//        }
//    }
//
//    func checkBoard() -> Bool {
//        for row in 0...8 {
//            for col in 0...8 {
//                if (self.board[row][col].number == 0) {
//                    return false
//                }
//
//                if (!checkInsertion(board: self.board, row: row, col: col, number: self.board[row][col].number)) {
//                    return false
//                }
//            }
//        }
//        return true
//    }
