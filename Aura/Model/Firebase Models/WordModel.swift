//
//  CombinedModel.swift
//  simply-english
//
//  Created by Max Dolensky on 2/11/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation

struct WordModel: Codable {
    
    let id: String
    let number: Int
    var partOfSpeech: [String]?
    var ipa: [String?]
    var audio: [String?]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case number
        case partOfSpeech
        case ipa
        case audio
    }
}

