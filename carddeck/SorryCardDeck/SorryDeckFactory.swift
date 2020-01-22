//
//  SorryDeckFactory.swift
//  SorryCardDeck
//
//  Created by Justin Gazlay on 9/21/19.
//  Copyright © 2019 Justin Gazlay. All rights reserved.
//

import Foundation
import SwiftUI

struct SorryDeckFactory {
    private static let countForCard: [SorryCard: Int] = {
        var countForCard = [SorryCard: Int]()
        SorryCard.allCases.forEach { card in
            switch card {
            case .one: countForCard[card] = 5
            case .seven: countForCard[card] = 3
            default: countForCard[card] = 4
            }
        }
        return countForCard
    }()
    
    static func makeDeck() -> CardDeck {
        let cards = SorryCard.allCases.flatMap { card -> [Card] in
            let cardCount = countForCard[card] ?? 0
            return (0..<cardCount).map { _ in Card(image: card.image) }
        }
        
        return CardDeck(cards)
    }
}

enum SorryCard: String, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case seven
    case eight
    case ten
    case eleven
    case twelve
    case sorry
    
    var image: Image {
        return Image(self.rawValue)
    }
}
