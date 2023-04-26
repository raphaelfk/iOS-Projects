//
//  PadTileView.swift
//  Sudoku
//
//  Created by Raphael Ferezin Kitahara on 24/03/23.
//

import SwiftUI

class PadTile: ObservableObject {
    @Published var number: Int
    @Published var selected: Bool = false
    @Published var completed: Bool = false
    var image: Image {
        get {
            switch number {
            case 1:
                return Image("1_pad")
            case 2:
                return Image("2_pad")
            case 3:
                return Image("3_pad")
            case 4:
                return Image("4_pad")
            case 5:
                return Image("5_pad")
            case 6:
                return Image("6_pad")
            case 7:
                return Image("7_pad")
            case 8:
                return Image("8_pad")
            case 9:
                return Image("9_pad")
            default:
                return Image("empty")
            }
        }
    }
    
    var background: Image {
        get {
            if completed {
                return Image("completed_tile_pad_bg")
            } else if selected {
                return Image("selected_tile_pad_bg")
            } else {
                return Image("empty")
            }
        }
    }
    
    init(number: Int) {
        self.number = number
    }
    

    
}

struct PadTileView: View {
    @ObservedObject var padTile: PadTile
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            ZStack {
                padTile.background
                padTile.image
            }
        })
    }
}
