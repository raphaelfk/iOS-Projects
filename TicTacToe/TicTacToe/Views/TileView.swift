//
//  TileView.swift
//  TicTacToe
//
//  Created by Raphael Ferezin Kitahara on 16/03/23.
//

import SwiftUI

enum TileStatus {
    case empty
    case xPlayer // player - home
    case yPlayer // AI - visitor
}

class Tile: ObservableObject {
    @Published var tileStatus: TileStatus
    
    init(tileStatus: TileStatus) {
        self.tileStatus = tileStatus
    }
}

struct TileView: View {
    @ObservedObject var dataSource: Tile
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            if(self.dataSource.tileStatus == .empty) {
                Image("empty")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if(self.dataSource.tileStatus == .xPlayer) {
                Image("cross")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image("circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        })
    }
}
