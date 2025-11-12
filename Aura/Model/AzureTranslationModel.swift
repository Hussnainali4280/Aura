//
//  AzureTranslationModel.swift
//  Aura
//
//  Created by Max Dolensky on 9/9/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation

// Response Struct for Translation Request
struct TranslationResponse: Codable {
    var detectedLanguage: DetectedLanguage?
    var translations: [TranslatedStrings]
}

struct TranslatedStrings: Codable {
    var text: String
    var to: String
}

struct DetectedLanguage: Codable {
    var language: String
    var score: Float
}

//*****
//**********
//*****

// Response Struct for Dictionary Request
struct DictionaryResponse: Codable {
    var normalizedSource: String
    var displaySource: String
    var translations: [Translations]
}

struct Translations: Codable {
    var normalizedTarget: String
    var displayTarget: String
    var posTag: String
    var confidence: Float
    var prefixWord: String
    var backTranslations: [BackTranslations]
}

struct BackTranslations: Codable {
    var normalizedText: String
    var displayText: String
    var numExamples: Int
    var frequencyCount: Int
}

// Used for moving the Data Around, Not for Network Request
struct DictionaryResult {
    
    var displayTarget: String
    var backTranslations: [String]
}

//*****
//**********
//*****

// Response Struct for Example Request
struct ExampleResponse: Codable {
    var normalizedSource: String
    var normalizedTarget: String
    var examples: [Examples]
}

struct Examples: Codable {
    var sourcePrefix: String
    var sourceTerm: String
    var sourceSuffix: String
    var targetPrefix: String
    var targetTerm: String
    var targetSuffix: String
}

//*****
//**********
//*****

// Structs for parsing dictionary request supported languages JSON
struct Dictionary: Codable {
    var dictionary: [String: LanguageNames]
}

// Source Language
struct LanguageNames: Codable {
    var name: String
    var nativeName: String
    var dir: String
    var translations: [TranslationsTo]
}

// Tranlations-To Languages that are supported for a given Source Language
struct TranslationsTo: Codable {
    var name: String
    var nativeName: String
    var dir: String
    var code: String
}

// Model For Storing a list of the supported Languages
struct SupportedLanguage {
    var name: String
    var nativeName: String
    var code: String
}
