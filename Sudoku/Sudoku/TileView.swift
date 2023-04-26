//
//  TileView.swift
//  Sudoku
//
//  Created by Raphael Ferezin Kitahara on 18/03/23.
//

import SwiftUI

class Tile: ObservableObject {
    @Published var number: Int // will store the number of the tile. if 0, then tile is empty
    
    var image: Image {
        get {
            switch number {
            case 1:
                return Image("1")
            case 2:
                return Image("2")
            case 3:
                return Image("3")
            case 4:
                return Image("4")
            case 5:
                return Image("5")
            case 6:
                return Image("6")
            case 7:
                return Image("7")
            case 8:
                return Image("8")
            case 9:
                return Image("9")
            default:
                return Image("empty")
            }
        }
    }
    
    @Published var selected: Bool = false
    @Published var completed: Bool = false
    
    var background: Image {
        get {
            if selected == false {
                return Image("empty")
            } else {
                if completed {
                    return Image("completed_tile_bg")
                } else {
                    return Image("selected_tile_bg")
                }
            }
        }
    }
    
    init(number: Int) {
        self.number = number
    }
}

struct TileView: View {
    @ObservedObject var tile: Tile
    var tilePress: () -> Void
    
    var body: some View {
        Button(action: {
            tilePress()
        }, label: {
            ZStack {
                tile.background
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                tile.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        })
    }
}
