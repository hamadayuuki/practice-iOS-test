//
//  Hand.swift
//  UnitTestApp01
//
//  Created by 濵田　悠樹 on 2022/11/10.
//

import Foundation

struct Hand {
    let cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    var isPair: Bool {
        return true   // 仮実装
    }
}

