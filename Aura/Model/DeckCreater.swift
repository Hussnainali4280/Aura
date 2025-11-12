//
//  DeckCreater.swift
//  Aura
//
//  Created by Maxwell Dolensky on 3/3/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import UIKit

class DeckCreater: NSObject {
    
    static let shared = DeckCreater()
    
    let dispatchGroup = DispatchGroup()
    
    // Japanese is ja
    // Call this to create a deck with EHD on one side, and a language of choice on the other
    // Have a list of the words wanted in the deck to be in a txt file, each word on own line
    func createDeck(deckName: String, translationLang: String = "en", filename: String = "flashcards") {
        
        
//        // Use this to put take last deck and put it as the first
//        guard let deck = Utilities.shared.superUser!.decks.popLast() else { return }
//        Utilities.shared.superUser!.decks.insert(deck, at: 0)
//        FirebaseManager.shared.updateUser(user: Utilities.shared.superUser!)
        
        let newDeck = DeckModel(name: deckName)

        Utilities.shared.superUser?.decks.append(newDeck)

        let words = parseFile(fileName: filename)

        let searchInfo = SearchInfo(searchType: .englishToNative,
                                    sourceLanguageCode: "en",
                                    sourceLanguageName: "",
                                    targetLanguageCode: translationLang,
                                    targetLanguageName: "")

        var cardIndex = 0

        for word in words {
            print(word)
            dispatchGroup.enter()
            startSearchSequence(searchText: word, searchInfo: searchInfo, cardIndex: cardIndex)
            cardIndex += 1
        }
        dispatchGroup.notify(queue: .main) {
            FirebaseManager.shared.updateUser(user: Utilities.shared.superUser!)
        }
    }
    
    // This will parse the file and return and array of words
    func parseFile(fileName: String) -> [String] {
        
        // Get File URL
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
            return []
        }
        
        // Get Contents of File URL
        guard let data = try? String(contentsOf: fileURL) else {
            return []
        }
        
        // Break up document line by line
        return data.components(separatedBy: "\n")
    }
    
    func startSearchSequence(searchText: String, searchInfo: SearchInfo, ipaIndex: Int = 0, cardIndex: Int) {
        
        // Set Language Codes
        AzureTranslationManager.shared.sourceLanguageCode = searchInfo.sourceLanguageCode
        AzureTranslationManager.shared.targetLanguageCode = searchInfo.targetLanguageCode
        
        runSearchsequence(searchText: searchText, searchInfo: searchInfo, cardIndex: cardIndex) { (searchStatus, card) in
            
            self.dispatchGroup.leave()
            
            if searchStatus == .success {
                let idx = Utilities.shared.superUser!.decks.count - 1
                Utilities.shared.superUser!.decks[idx].cards.append(card)
                Utilities.shared.superUser!.decks[idx].numberOfCards += 1
                print(Utilities.shared.superUser!.decks[idx].numberOfCards)
                
            }
        }

    }
    
    func runSearchsequence(searchText: String, searchInfo: SearchInfo, cardIndex: Int, completion: @escaping(_ status: SearchStatus,_ card: FlashcardModel) -> Void) {
        
        var wordArray = [String]()
        var myWordModelArray = [WordModel?]()
        var bottomLabelText: String = ""

        // If Target Lang is English, retrieve word models from database
        if AzureTranslationManager.shared.targetLanguageCode == "en" {
            
            bottomLabelText = searchText
            
            wordArray = searchText.replacingOccurrences(of: "’", with: "'").split(separator: " ").map {String($0)}
           
            FirebaseManager.shared.readEnglishDocumentByWord(words: wordArray) { (wordModelArray) in
                
                myWordModelArray = wordModelArray
                
                let filteredArray = myWordModelArray.filter { $0 != nil }
                
                // All Word Models Found
                if myWordModelArray.count > 0 && myWordModelArray.count == filteredArray.count {
                    
                    let card = FlashcardModel(wordArray: wordArray,
                                              wordModelArray: myWordModelArray,
                                              ipaIndex: 0,
                                              bottomLabelText: bottomLabelText,
                                              score: -1,
                                              numRight: 0,
                                              numSeen: 0,
                                              cardIndex: cardIndex)
                    
                    completion(.success, card)
                }
                
                // Some Word Models Found
                else if myWordModelArray.count > 0 && filteredArray.count > 0 {
                    
                    let card = FlashcardModel(wordArray: wordArray,
                                              wordModelArray: myWordModelArray,
                                              ipaIndex: 0,
                                              bottomLabelText: bottomLabelText,
                                              score: -1,
                                              numRight: 0,
                                              numSeen: 0,
                                              cardIndex: cardIndex)
                    
                    completion(.missingSomeWordModels, card)
                }
                
                // No Word Models Found
                else {
                    
                    let card = FlashcardModel(wordArray: wordArray,
                                              wordModelArray: myWordModelArray,
                                              ipaIndex: 0,
                                              bottomLabelText: bottomLabelText,
                                              score: -1,
                                              numRight: 0,
                                              numSeen: 0,
                                              cardIndex: cardIndex)
                    
                    completion(.noExistingWordModels, card)
                }
            }
        }
        
        // Otherwise get translations and then retrieve word models from database
        else {
            
            var isEmptyTranslation = true
            
            AzureTranslationManager.shared.textToTranslate = searchText
            AzureTranslationManager.shared.fetchTranslation { (translation) in
                
                guard var translation = translation else {
                    print("Translation is nil")
                    //self.searchOutput = searchText
                    wordArray = searchText.split(separator: " ").map { String($0) }
                    
                    let card = FlashcardModel(wordArray: wordArray,
                                              wordModelArray: myWordModelArray,
                                              ipaIndex: 0,
                                              bottomLabelText: bottomLabelText,
                                              score: -1,
                                              numRight: 0,
                                              numSeen: 0,
                                              cardIndex: cardIndex)
                    completion(.nilTranslation, card)
                    return
                }
                
                // If the Translation Returns an empty string we want the result to be the original searched Text
                if translation == "" {
                    
                    translation = searchText
                    
                } else { isEmptyTranslation = false }
                
                //self.searchOutput = translation
                
                bottomLabelText = translation
                
                wordArray = searchText.split(separator: " ").map { String($0) }
                
                // Retrieve word models from database
                FirebaseManager.shared.readEnglishDocumentByWord(words: wordArray) { (wordModelArray) in
                    
                    myWordModelArray = wordModelArray
                    
                    let filteredArray = myWordModelArray.filter { $0 != nil }
                    
                    // All  Word Models Found
                    if myWordModelArray.count > 0 && myWordModelArray.count == filteredArray.count {
                        
                        if isEmptyTranslation {
                            let card = FlashcardModel(wordArray: wordArray,
                                                      wordModelArray: wordModelArray,
                                                      ipaIndex: 0,
                                                      bottomLabelText: bottomLabelText,
                                                      score: -1,
                                                      numRight: 0,
                                                      numSeen: 0,
                                                      cardIndex: cardIndex)
                            
                            completion(.emptyTranslationWithAllWordModels, card)
                        }
                            
                        else {
                            let card = FlashcardModel(wordArray: wordArray,
                                                      wordModelArray: wordModelArray,
                                                      ipaIndex: 0,
                                                      bottomLabelText: bottomLabelText,
                                                      score: -1,
                                                      numRight: 0,
                                                      numSeen: 0,
                                                      cardIndex: cardIndex)
                            completion(.success, card)
                        }
                        
                    }
                    
                    // Some Word Models Found
                    else if myWordModelArray.count > 0 && filteredArray.count > 0 {
                        
                        if isEmptyTranslation {
                            let card = FlashcardModel(wordArray: wordArray,
                                                      wordModelArray: wordModelArray,
                                                      ipaIndex: 0,
                                                      bottomLabelText: bottomLabelText,
                                                      score: -1,
                                                      numRight: 0,
                                                      numSeen: 0,
                                                      cardIndex: cardIndex)
                            completion(.emptyTranslationMissingSomeWordModels, card)
                        }
                        
                        else {
                            let card = FlashcardModel(wordArray: wordArray,
                                                      wordModelArray: wordModelArray,
                                                      ipaIndex: 0,
                                                      bottomLabelText: bottomLabelText,
                                                      score: -1,
                                                      numRight: 0,
                                                      numSeen: 0,
                                                      cardIndex: cardIndex)
                            completion(.missingSomeWordModels, card)
                        }
                        
                    }
                    
                    // No Word Models Found
                    else {
                        
                        if isEmptyTranslation {
                            let card = FlashcardModel(wordArray: wordArray,
                                                      wordModelArray: wordModelArray,
                                                      ipaIndex: 0,
                                                      bottomLabelText: bottomLabelText,
                                                      score: -1,
                                                      numRight: 0,
                                                      numSeen: 0,
                                                      cardIndex: cardIndex)
                            completion(.emptyTranslationNoExistingWordModels, card)
                        }
                        
                        else {
                            let card = FlashcardModel(wordArray: wordArray,
                                                      wordModelArray: wordModelArray,
                                                      ipaIndex: 0,
                                                      bottomLabelText: bottomLabelText,
                                                      score: -1,
                                                      numRight: 0,
                                                      numSeen: 0,
                                                      cardIndex: cardIndex)
                            completion(.noExistingWordModels, card)
                        }
                    }
                }
            }
        }
    }
    
}
