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
        VStack(spacing: 0) {
            HStack {
                ForEach(self.gameVM.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                        self.gameVM.choose(card: card)
                    }
                }
            }
                .padding([.horizontal])
                .foregroundColor(Color.orange)
                .font(Font.largeTitle)
            Spacer()
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke()
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(gameVM: EmojiMemoryGame())
    }
}
