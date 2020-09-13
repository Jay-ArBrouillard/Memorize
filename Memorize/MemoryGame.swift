//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jay-Ar Brouillard on 9/12/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<numPairsOfCards {
            let content = cardContentFactory(index)
            cards.append(Card(pairIndex: index*2, content: content))
            cards.append(Card(pairIndex: index*2+1, content: content))
        }
        cards = cards.shuffled()
    }
    
    // MARK: - Choose a card
    mutating func choose(card: Card) {
        print("card choosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return -1 // TODO: shouldn't happen
    }
    
    // MARK: - Memory Game specific card
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
        init(pairIndex: Int, content: CardContent) {
            isFaceUp = true
            isMatched = false
            id = pairIndex
            self.content = content
        }
    }
}
