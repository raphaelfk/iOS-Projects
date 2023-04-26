//
//  ContentView.swift
//  TicTacToe
//
//  Created by Raphael Ferezin Kitahara on 16/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var ticTacToeModel = TicTacToeModel()
    @State var gameOver : Bool = false
    
    func buttonAction(_ index: Int) {
        _ = self.ticTacToeModel.tilePress(index: index, player: .xPlayer)
        self.gameOver = self.ticTacToeModel.gameOver.1
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Single Player")
                .bold()
                .font(.title)
            
            Spacer()
            
            ZStack {
                Image("board")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack{
                    ForEach(0 ..< ticTacToeModel.tiles.count / 3, content: {
                        row in
                        HStack {
                            ForEach(0 ..< 3, content: {
                                column in
                                let index = row * 3 + column
                                TileView(dataSource: ticTacToeModel.tiles[index], action: {self.buttonAction(index)})
                            })
                        }
                    })

                }
                    .alert(isPresented: self.$gameOver, content: {
                    Alert(title: Text("Game Over"),
                          message: Text(self.ticTacToeModel.gameOver.0 != .empty ? self.ticTacToeModel.gameOver.0 == .xPlayer ? "You Win!": "AI Wins!" : "Nobody Wins" ) , dismissButton: Alert.Button.destructive(Text("Ok"), action: {
                            self.ticTacToeModel.restart()
                          }))
                    })
                    .onAppear {
                        ticTacToeModel.gameType = 1
                    }

                }.padding()
            
            Spacer()
            
            Button("Restart") {
                self.ticTacToeModel.restart()
                
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(15)
            
            Spacer()
            
        }
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
