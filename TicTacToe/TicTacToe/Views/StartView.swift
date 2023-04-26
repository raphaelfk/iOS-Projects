//
//  StartView.swift
//  TicTacToe
//
//  Created by Raphael Ferezin Kitahara on 16/03/23.
//

import SwiftUI

struct StartView: View {
    
    @StateObject var ticTacToeModel = TicTacToeModel()
    
    var body: some View {
        VStack{
            Spacer()
            
            Image("appName")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Spacer()
            
            NavigationLink(destination: ContentView()) {
                Text("Single Player")
                    .foregroundColor(.white)
                    .padding()
            }
                .background(Color.accentColor)
                .cornerRadius(15)
            
            NavigationLink(destination: TwoPlayersView()) {
                Text(" Two Players ")
                    .foregroundColor(.white)
                    .padding()
            }
                .background(Color.accentColor)
                .cornerRadius(15)
            
            Spacer()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
