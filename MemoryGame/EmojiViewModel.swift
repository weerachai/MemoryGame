//
//  EmojiViewModel.swift
//  MemoryGame
//
//  Created by cn333 on 2/2/24.
//

import Foundation

class EmojiViewModel: ObservableObject {
    static let emojis = ["👻", "🎃", "🕷", "🍭", "🕸", "🍬"]
    
    @Published private var model = MemoryGameModel<String>(numberOfPairsOfCards: emojis.count) { index in
        emojis[index]
    }
    
    var cards: [MemoryGameModel<String>.Card] { // .card
        return model.cards
    }
    
    func shuffle() { // .shuffle()
        model.shuffle()
    }
    
    func choose(_ card: MemoryGameModel<String>.Card) {
        model.choose(card)
    
}
    
    
}
