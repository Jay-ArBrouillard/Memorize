//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jay-Ar Brouillard on 9/12/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😂", "😏", "😈", "😀"]
        return MemoryGame<String>(numPairsOfCards: emojis.count) { pairIndex in emojis[pairIndex] }
    }
    
    // MARK: - Access the model cards
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Choose a card
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
