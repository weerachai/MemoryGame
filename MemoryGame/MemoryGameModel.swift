//
//  MemoryGameModel.swift
//  MemoryGame
//
//  Created by cn333 on 2/2/24.
//

import Foundation

struct MemoryGameModel<CardContentType: Equatable> {
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
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    private mutating func faceDownAll() {
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                faceDownAll()
            }
            cards[chosenIndex].isFaceUp = true
        }
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
    
    struct Card: Identifiable, Equatable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContentType
        let id = UUID()
    }
}

//var card = MemoryGameModel.Card(content: "X")


