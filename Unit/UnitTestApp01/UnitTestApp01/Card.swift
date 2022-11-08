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
    
    // 同じenum同士なら等価判定が可能
    // Equatableプロトコルへの準拠は不要
    enum Suit: String {
        case spade   = "♠️"
        case heart   = "❤️"
        case club    = "♣️"
        case diamond = "🔷"
    }
    
    enum Rank: String {
        case ace    = "A"
        case two    = "2"
        case three  = "3"
        case four   = "4"
        case five   = "5"
        case six    = "6"
        case seven  = "7"
        case eight  = "8"
        case nine   = "9"
        case ten    = "10"
        case jack   = "J"
        case queen  = "Q"
        case king   = "K"
    }
    
    var notation: String {
        return suit.rawValue + rank.rawValue   // enum は rawValue を使うと要素に割り当てられた値を取得可能
    }
    
    func hasSameSuit(card: Card) -> Bool {
        return self.suit == card.suit
    }
}

