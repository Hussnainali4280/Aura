//
//  UserModel.swift
//  Aura
//
//  Created by Max Dolensky on 7/20/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var UID: String
    var decks: [DeckModel]
    var prevSearches: [SearchAndResult]
    var purchases: [String : Bool]
    @DecodableDefault.EmptyMap var purchaseIDs : [String: String]
}

struct SearchAndResult: Codable {
    
    let searchText: String
    let resultText: String
    let searchInfo: FBSearchInfo
    
}
