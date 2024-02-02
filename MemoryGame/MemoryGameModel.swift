//
//  MemoryGameModel.swift
//  MemoryGame
//
//  Created by cn333 on 2/2/24.
//

import Foundation

struct MemoryGameModel<CardContentType> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContentType) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        shuffle()
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    private func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0;
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContentType
        let id = UUID()
    }
}

//var card = MemoryGameModel.Card(content: "X")


