//
//  Card.swift
//  UnitTestApp01
//
//  Created by 濵田　悠樹 on 2022/10/22.
//

import Foundation

struct Card {
    let suit: Suit
    let rank: Rank
    
    enum Suit {
        case spade
        case heart
        case club
        case diamond
    }
    
    enum Rank {
        case ace
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case jack
        case queen
        case king
    }
    
    var notation: String {
        return "3❤️"
    }
}

