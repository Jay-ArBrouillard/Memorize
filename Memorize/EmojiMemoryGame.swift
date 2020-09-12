//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jay-Ar Brouillard on 9/12/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import Foundation

class EmojiMemoryGame {
    private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😂", "🎃", "😈"]
        return MemoryGame<String>(numPairsOfCards: emojis.count) { pairIndex in emojis[pairIndex] }
    }
    
    //Access the model cards
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    //Choose a card
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
