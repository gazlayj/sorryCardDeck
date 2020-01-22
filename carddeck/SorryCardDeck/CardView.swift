//
//  ContentView.swift
//  SorryCardDeck
//
//  Created by Justin Gazlay on 9/20/19.
//  Copyright © 2019 Justin Gazlay. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var faceUp = false
    var image: Image {
        return faceUp ? card.image : Image("back")
    }
    
    var body: some View {
        image
        .resizable()
        .cornerRadius(10.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(image: Image("two")))
    }
}
