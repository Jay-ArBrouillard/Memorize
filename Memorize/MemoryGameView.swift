//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Jay-Ar Brouillard on 9/12/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var gameVM: EmojiMemoryGame
    
    // Our view is always reflecting what is in our model
    var body: some View {
        Grid(self.gameVM.cards) { card in
            CardView(card: card).onTapGesture {
                self.gameVM.choose(card: card)
            }
        }
            .padding([.horizontal])
            .foregroundColor(Color.orange)
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body (for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: RECTANGLE_CORNER_RADIUS).fill(Color.white)
                RoundedRectangle(cornerRadius: RECTANGLE_CORNER_RADIUS).stroke(lineWidth: LINE_WIDTH)
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: RECTANGLE_CORNER_RADIUS)
                    .fill()
            }
        }
        .font(Font.system(size: min(size.width, size.height) * FONT_SCALE_FACTOR))
    }

    // MARK: - Drawing Constants
    let RECTANGLE_CORNER_RADIUS: CGFloat = 10.0
    let LINE_WIDTH: CGFloat = 3.0
    let FONT_SCALE_FACTOR: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(gameVM: EmojiMemoryGame())
    }
}
