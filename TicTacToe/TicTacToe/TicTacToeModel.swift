//
//  TicTacToeModel.swift
//  TicTacToe
//
//  Created by Raphael Ferezin Kitahara on 16/03/23.
//

import SwiftUI
import Foundation

class TicTacToeModel: ObservableObject {
    @Published var tiles = [Tile]() // array that will keep all of the tiles
    @Published var gameType = 1 // 1 for single player and 2 for two players
    @Published var player: TileStatus = .xPlayer
    
    init() {
        // filling the tiles array
        for _ in 0...8 {
            tiles.append(Tile(tileStatus: .empty))
        }
    }
    
    var gameOver: (TileStatus, Bool) {
        get {
            if thereIsAWinner != .empty {
                return (thereIsAWinner, true)
            } else {
                for i in 0...8 {
                    if tiles[i].tileStatus == .empty {
                        return(.empty, false)
                    }
                }
                return (.empty, true)
            }
        }
    }
    
    private var thereIsAWinner: TileStatus {
        get {
            if let check = self.checkIndexes([0, 1, 2]) {
                return check
            } else if let check = self.checkIndexes([3, 4, 5]) {
                return check
            } else if let check = self.checkIndexes([6, 7, 8]) {
                return check
            } else if let check = self.checkIndexes([0, 3, 6]) {
                return check
            } else if let check = self.checkIndexes([1, 4, 7]) {
                return check
            } else if let check = self.checkIndexes([2, 5, 8]) {
                return check
            } else if let check = self.checkIndexes([0, 4, 8]) {
                return check
            } else if let check = self.checkIndexes([2, 4, 6]) {
                return check
            }
            return .empty
        }
    }
    
    // function that restarts the board
    func restart() {
        for i in 0...8 {
            tiles[i].tileStatus = .empty
        }
    }
    
    // checks the tiles of three indexes that are listed and returns the winning player, if all of the tiles are the same, or returns nil, if there is still no winner
    private func checkIndexes(_ indexes: [Int]) -> TileStatus? {
        var xPlayerCounter: Int = 0
        var yPlayerCounter: Int = 0
        for index in indexes {
            let tile = tiles[index]
            if tile.tileStatus == .xPlayer {
                xPlayerCounter += 1
            } else if tile.tileStatus == .yPlayer {
                yPlayerCounter += 1
            }
        }
        if xPlayerCounter == 3 {
            return .xPlayer
        } else if yPlayerCounter == 3 {
            return .yPlayer
        }
        return nil
    }
    
    // generates a random number, checks the tile availability and makes a move aggainst the player
    private func moveAI() {
        var index = Int.random(in: 0...8)
        while tilePress(index: index, player: .yPlayer) == false && gameOver.1 == false {
            index = Int.random(in: 0...8)
        }
    }
    
    // sets the tile related to the passed index to the current player's symbol
    func tilePress(index: Int, player: TileStatus) -> Bool {
        if tiles[index].tileStatus == .empty {
            tiles[index].tileStatus = player
            if player == .xPlayer && gameType == 1 {
                moveAI()
            }
            return true
        }
        return false
    }
}
