//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Jay-Ar Brouillard on 9/12/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import SwiftUI

//View
struct MemoryGameView: View {
    @ObservedObject var gameVM: EmojiMemoryGame
    
    // Our view is always reflecting what is in our model
    var body: some View {
        Grid(self.gameVM.cards) { card in
            CardView(card: card).onTapGesture {
                self.gameVM.choose(card: card)
            }
                .padding(5)
        }
            .padding()
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
    
    @ViewBuilder
    func body (for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(self.card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
                .cardify(isFaceUp: card.isFaceUp)
        }
    }

    // MARK: - Drawing Constants
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.70
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return MemoryGameView(gameVM: game)
    }
}
