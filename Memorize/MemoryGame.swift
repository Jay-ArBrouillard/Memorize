//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jay-Ar Brouillard on 9/12/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import Foundation

//Model
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card> //Other classes allowed to read cards
    private var indexOfOneAndOnlyOneFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
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
//        print("card choosen: \(card)")
        //If chosenIndex returns not nil then flip the card
        //Ignore cards that are already face up or already matched
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched  {
            //If indexOfOneAndOnlyOneFaceUpCard is not nil
            if let potentialMatchIndex = indexOfOneAndOnlyOneFaceUpCard {
                //Found a match
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyOneFaceUpCard = chosenIndex
            }
        }
    }
    
    // MARK: - Memory Game specific card
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
        init(pairIndex: Int, content: CardContent) {
            isFaceUp = false
            isMatched = false
            id = pairIndex
            self.content = content
        }
    }
}
