//
//  SearchInfo.swift
//  Aura
//
//  Created by Max Dolensky on 7/23/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation

struct SearchInfo {
    
    var searchType = SearchType.nativeToEnglish
    var sourceLanguageCode: String
    var sourceLanguageName: String
    var targetLanguageCode: String = "en"
    var targetLanguageName: String = "English"
    
}

enum SearchType {
    case englishToNative
    case nativeToEnglish
}

// This will be used to store data for Prev Search History
struct FBSearchInfo: Codable {
    
    var searchType: Int  // 0 is native to english : 1 is english to native
    var sourceLanguageCode: String
    var sourceLanguageName: String
    var targetLanguageCode: String = "en"
    var targetLanguageName: String = "English"
    
}
