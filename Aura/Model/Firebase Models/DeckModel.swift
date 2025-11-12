//
//  DeckModel.swift
//  Aura
//
//  Created by Max Dolensky on 8/8/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation

struct DeckModel: Codable {
    
    var name: String
    var numberOfCards: Int
    var avgScore: Double
    @DecodableDefault.NegativeOne var prevTestScore: Double
    var numRight: Int
    var numSeen: Int
    var cards: [FlashcardModel]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case numberOfCards
        case avgScore = "prevScore"
        case prevTestScore
        case numRight
        case numSeen
        case cards
    }
}

extension DeckModel {
    
    init(name: String) {
        
        self.name = name
        numberOfCards = 0
        avgScore = -1
        prevTestScore = -1
        numRight = 0
        numSeen = 0
        cards = []
        
    }
    
}

struct FlashcardModel: Codable {
    
    let wordArray: [String]
    let wordModelArray: [WordModel?]
    let ipaIndex: Int
    let bottomLabelText: String
    var score: Double
    var numRight: Int
    var numSeen: Int
    var cardIndex: Int
    
}
