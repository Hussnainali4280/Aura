//
//  ColoringDataStructures.swift
//  simply-english
//
//  Created by Max Dolensky on 2/25/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation

// =========================================================================================
// STRUCT DEFINITION:
// This structure will be used to keep track of the letters as it moves through the function
// color_word. Any array of this structure will capture the word. Each element of the array
// will contain a letter, a boolean variable for whether the letter has been matched or not
// and the color. The boolean variable is initialized to false and the color is initialized
// to black
// =========================================================================================
struct letterAndAttributes: Codable {
    var letter: String
    var ipaParent: String?
    var matched: Bool = false
    var color: [Double] = [0.0,0.0,0.0]
    var linkNumberValue:  String?
}

// ===================================
// Used to describe a UIColor
// ===================================
struct LetterColor {
    var red: Double
    var green: Double
    var blue: Double
}

// ==========================================================================================
// This is used so the ipa letters are not matched multiple times
// ==========================================================================================
struct IpaLetter {
    var letter: String
    var matched: Bool = false
}
