//
//  GameView.swift
//  Sudoku
//
//  Created by Raphael Ferezin Kitahara on 18/03/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var sudokuModel: SudokuModel
    @State var gameOver: Bool = false
    @State var gameWon: Bool = false
    @State var selectedNumber: Int = 0
    
    
    func selectNumber(_ number: Int) {
        // checking completion of all numbers
        for number in 1...9 {
            if (sudokuModel.numberCount[number] == 9) {
                self.sudokuModel.numberPad[number-1].completed = true
            }
        }
        
        // if the number is already selected, deselect
        if self.selectedNumber == number {
            // updating number pad
            sudokuModel.numberPad[number - 1].selected = false
            
            // updating board
            for i in 0...8 {
                for j in 0...8 {
                    if sudokuModel.board[i][j].number == selectedNumber {
                        sudokuModel.board[i][j].selected = false
                    }
                }
            }
            
            // updating variable
            self.selectedNumber = 0
            
        // if the number was not already selected
        } else {
            // updating variable
            self.selectedNumber = number
            
            // updating number pad
            if (sudokuModel.numberCount[number] == 9) {
                self.sudokuModel.numberPad[number-1].completed = true
            }
            self.sudokuModel.numberPad[number-1].selected = true
            
            for i in 0...8 {
                if i != number-1 {
                    sudokuModel.numberPad[i].selected = false
                }
            }
            
            // updating board
            for i in 0...8 {
                for j in 0...8 {
                    if sudokuModel.board[i][j].number == selectedNumber {
                        if (sudokuModel.numberCount[number] == 9) {
                            sudokuModel.board[i][j].completed = true
                        }
                        sudokuModel.board[i][j].selected = true
                    } else {
                        sudokuModel.board[i][j].selected = false
                    }
                }
            }
        }
    }
    
    
    func selectTile(row: Int, col: Int) {
        if selectedNumber != 0 {
            if self.sudokuModel.board[row][col].number == 0 {
                sudokuModel.registerBoard()
                sudokuModel.board[row][col].number = selectedNumber
                sudokuModel.board[row][col].selected = true
                sudokuModel.numberCount[selectedNumber] += 1
            }
        }
        
        // updating board completion
        for i in 0...8 {
            for j in 0...8 {
                if (sudokuModel.numberCount[selectedNumber] == 9) {
                    if (sudokuModel.board[i][j].number == selectedNumber) {
                        sudokuModel.board[i][j].completed = true
                    }
                }
            }
        }
        
        // updating number pad completion
        if (sudokuModel.numberCount[selectedNumber] == 9) {
            self.sudokuModel.numberPad[selectedNumber-1].completed = true
        }
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("selected: \(selectedNumber)")
                .onAppear() {
                    Api().getData()
                }
            
            Spacer()
            
            HStack {
                Spacer()
                
                ZStack{
                    Image("board")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    VStack(spacing: 0){
                        ForEach(0...8, id: \.self, content: { i in
                            HStack(spacing: 0){
                                ForEach(0...8, id: \.self, content: { j in
                                    TileView(tile: sudokuModel.board[i][j], tilePress: {selectTile(row: i, col: j)})
                                })
                                
                            }
                            
                        })
                    }
                    
                }
                Spacer()
            }
            
            HStack {
                Spacer()
                
                VStack {
                    // undo button
                    Button(action: {
                        sudokuModel.undo()

                    }, label: {
                        Text(" Undo   ")
                            .foregroundColor(.white)
                            .padding()
                    })
                    .background(Color.accentColor)
                    .cornerRadius(15)
                    
                    // check board button
                    Button(action: {
                        if (sudokuModel.checkBoard()) {
                            self.gameWon = true
                        } else {
                            self.gameOver = true
                        }

                    }, label: {
                        Text("Check \nsolution")
                            .foregroundColor(.white)
                            .padding()
                    })
                    .background(Color.accentColor)
                    .cornerRadius(15)
                    
                    .alert(isPresented: self.$gameOver, content: {
                        Alert(title: Text("Your board is wrong :("),
                              message: Text("don't worry, you can always try again!") , dismissButton: Alert.Button.destructive(Text("Ok"), action: {
                            self.sudokuModel.restart()
                              }))
                        })
                    
                    
                }
                
                Spacer()
                
                ZStack {
                    Image("number_pad")
                    
                    VStack(spacing: 0){
                        ForEach(0...2, id: \.self, content: { i in
                            HStack(spacing: 0){
                                ForEach(0...2, id: \.self, content: { j in
                                    PadTileView(padTile: sudokuModel.numberPad[j + i * 3], action: {selectNumber(j + i * 3 + 1)})
                                })
                                
                            }
                            
                        })
                    }
                    
                }
                .alert(isPresented: self.$gameWon, content: {
                    Alert(title: Text("You win! 🥳"),
                          message: Text("you solved the entire puzzle!") , dismissButton: Alert.Button.destructive(Text("Ok"), action: {
                        self.sudokuModel.restart()
                          }))
                    })
                
                Spacer()
            }
            
            Spacer()
            
        }
        
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        // GameView()
//    }
//}
