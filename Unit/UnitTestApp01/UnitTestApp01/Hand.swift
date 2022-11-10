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
        //return true   // 仮実装
        
        return self.cards[0].rank == self.cards[1].rank   // cards の長さが2ではない時 や Handが0枚の時 を考慮できていない → TODOに記載しておく
    }
}

