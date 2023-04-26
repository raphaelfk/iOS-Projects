//
//  BoardView.swift
//  TicTacToe
//
//  Created by Raphael Ferezin Kitahara on 17/03/23.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var ticTacToeModel: TicTacToeModel

    
    func buttonAction(_ index: Int) {
        _ = self.ticTacToeModel.tilePress(index: index, player: .xPlayer)
        self.gameOver = self.ticTacToeModel.gameOver.1
    }

    var body: some View {
        ZStack {
            Image("board")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack{
                ForEach(0 ..< ticTacToeModel.tiles.count / 3, content: { row in
                    HStack {
                        ForEach(0 ..< 3, content: { column in
                            let index = row * 3 + column
                            let tile = ticTacToeModel.tiles[index]
                            let action = self.buttonAction(index)

                            // TileView(dataSource: tile, action: {action})
                        })
                    }
                })
                    
            }
//                .alert(isPresented: self.$gameOver, content: {
//                Alert(title: Text("Game Over"),
//                      message: Text(self.ticTacToeModel.gameOver.0 != .empty ? self.ticTacToeModel.gameOver.0 == .xPlayer ? "You Win!": "AI Wins!" : "Nobody Wins" ) , dismissButton: Alert.Button.destructive(Text("Ok"), action: {
//                        self.ticTacToeModel.restart()
//                      }))
//                })
            
        }.padding()
    }
}
