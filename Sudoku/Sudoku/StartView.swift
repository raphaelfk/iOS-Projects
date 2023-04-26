//
//  ContentView.swift
//  Sudoku
//
//  Created by Raphael Ferezin Kitahara on 18/03/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("logo")
                .imageScale(.large)
            
            Spacer()
            
            NavigationLink(destination: GameView(sudokuModel: SudokuModel(dificulty: .easy))) {
                Text("Easy             ")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.accentColor)
            .cornerRadius(15)
            
            NavigationLink(destination: GameView(sudokuModel: SudokuModel(dificulty: .medium))) {
                Text(" Medium      ")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.accentColor)
            .cornerRadius(15)
            
            NavigationLink(destination: GameView(sudokuModel: SudokuModel(dificulty: .hard))) {
                Text(" Hard           ")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.accentColor)
            .cornerRadius(15)
            
            Spacer()
            
        }
        .padding()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
