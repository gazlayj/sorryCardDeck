//
//  CardDeck.swift
//  SorryCardDeck
//
//  Created by Justin Gazlay on 9/20/19.
//  Copyright © 2019 Justin Gazlay. All rights reserved.
//

import Combine
import SwiftUI

class CardDeck: ObservableObject {
    var remainingCards: [Card]
    var discardedCards: [Card]
    var allCards: [Card] {
        return remainingCards + discardedCards
    }
    
    @Published var lastMovedCard: Card?
    
    init(_ cards: [Card]) {
        remainingCards = cards.shuffled()
        discardedCards = []
    }
    
    func shuffle() {
        let allCards = remainingCards + discardedCards
        
        discardedCards.removeAll()
        remainingCards = allCards.shuffled()
        lastMovedCard = nil
    }
    
    func flipNextCard() {
        guard let nextCard = remainingCards.popLast() else {
            shuffle()
            return
        }
        
        discardedCards.append(nextCard)
        lastMovedCard = nextCard
    }
    
    func flipPreviousCard() {
        guard let previousCard = discardedCards.popLast() else {
            return
        }
        
        remainingCards.append(previousCard)
        lastMovedCard = previousCard
    }
}
