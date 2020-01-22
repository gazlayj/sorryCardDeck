//
//  Aligment+Utils.swift
//  SorryCardDeck
//
//  Created by Justin Gazlay on 1/2/20.
//  Copyright © 2020 Justin Gazlay. All rights reserved.
//

import Foundation
import SwiftUI

extension Alignment {
    static let anchor = Alignment(horizontal: .anchor, vertical: .anchor)
}

extension HorizontalAlignment {
    enum Anchor: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat { d[HorizontalAlignment.center] }
    }
    static let anchor = HorizontalAlignment(Anchor.self)
}

extension VerticalAlignment {
    enum Anchor: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat { d[VerticalAlignment.center] }
    }
    static let anchor = VerticalAlignment(Anchor.self)
}
