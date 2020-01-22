//
//  CardDeck.swift
//  SorryCardDeck
//
//  Created by Justin Gazlay on 9/20/19.
//  Copyright © 2019 Justin Gazlay. All rights reserved.
//

import SwiftUI

struct CardDeckView: View {
    @EnvironmentObject var cardDeck: CardDeck
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    ForEach(self.cardDeck.allCards) { card in
                        CardView(card: card, faceUp: self.isInDiscardPile(card))
                            .rotationEffect(Angle(degrees: Double.random(in: (-5..<5))))
                            .aspectRatio(2/3, contentMode: .fit)
                            .frame(width: self.cardWidth(for: geometry.size))
                            .offset(x: self.isInDiscardPile(card) ? -(geometry.size.width * 0.4) : 0)
                            .zIndex(self.cardDeck.lastMovedCard?.id == card.id ? 1 : 0)
                            .animation(.easeInOut)
                    }
                    
                    Button(action: {
                        self.cardDeck.flipNextCard()
                    }) {
                        Color.clear
                    }
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: self.cardWidth(for: geometry.size) * 1.15)
                    .zIndex(Double(self.cardDeck.allCards.count) + 2)
                    
                    Button(action: {
                        self.cardDeck.flipPreviousCard()
                    }) {
                        Color.clear
                    }
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: self.cardWidth(for: geometry.size) * 1.15)
                    .offset(x: -(geometry.size.width * 0.4))
                    .zIndex(Double(self.cardDeck.allCards.count) + 2)
                }
                .offset(x: (geometry.size.width * 0.4) / 2)
            }
            
            Button(action: {
                self.cardDeck.shuffle()
            }) {
                Text("Shuffle")
            }
        }
        .padding()  
        
    }
    
    func isInDiscardPile(_ card: Card) -> Bool {
        return cardDeck.discardedCards.contains(where:  { card.id == $0.id })
    }
    
    func cardWidth(for size: CGSize) -> CGFloat {
        let maxWidth = size.width * 0.3
        let maxHeight = size.height * 0.9
        let aspectRatio: CGFloat = 2/3
        let preferredHieght = maxWidth / aspectRatio
        return preferredHieght <= maxHeight ? maxWidth : maxHeight * aspectRatio
    }
}

struct CardDeck_Previews: PreviewProvider {
    static var previews: some View {
        CardDeckView()
            .environmentObject(SorryDeckFactory.makeDeck())
    }
}
