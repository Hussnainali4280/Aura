//
//  WordColoringManager.swift
//  simply-english
//
//  Created by Max Dolensky on 4/13/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation
import UIKit

class WordColoringManager {
    
    static let shared = WordColoringManager()
    var realmManager = RealmManager()
    
    let vowelsList = ["æ", "ɑ","ə", "ɛ", "i", "ɪ", "ɔ", "u", "ʊ"]
    
    let consonantsList = ["b","ɡ","l","m","n","p","r","d","ð","t","ʔ","v","z","θ","f","h","j","k","ŋ","s","ʃ","w","ʒ"]
    
    let dipthongList = ["oʊl","æŋ","aɪ","aʊ","ɑr","dʒ","eɪ","əl","wɪ","ər","ɛŋ","ɛr","ɡz","ɪŋ","ɪr",
                        "jə","ju","ks","kʃ","kw","oʊ","ɔɪ","ɔr","tʃ","ʊr","wə","ʊl"]
    
    let tripthongList = ["weɪ"]
   
    let lettersList = ["oʊl","weɪ","æŋ","aɪ","aʊ","ɑr","dʒ","eɪ","əl","wɪ","ər","ɛŋ","ɛr","ɡz","ɪŋ","ɪr",
                       "jə","ju","ks","kʃ","kw","oʊ","ɔɪ","ɔr","tʃ","ʊr","wə","ʊl",
                       "æ", "ɑ","ə", "ɛ", "i", "ɪ", "ɔ", "u", "ʊ",
                       "b","ɡ","l","m","n","p","r","d","ð","t","ʔ","v","z","θ","f","h","j","k","ŋ","s","ʃ","w","ʒ"]
    
    func colorWord(word: String, ipa: String) -> (NSMutableAttributedString, Bool) {
       
        var wordArray = [letterAndAttributes]()
        var ipaArray = [IpaLetter]()
        
        for letter in word {
            wordArray.append(letterAndAttributes(letter: String(letter)))
        }
        for letter in ipa {
            ipaArray.append(IpaLetter(letter: String(letter)))
        }
        
        getMatches(&wordArray, &ipaArray, for: word, with: ipa)
        
//        for letter in wordArray {
//            print("\(letter.letter) -> \(letter.ipaParent ?? "nil")")
//        }
        
        return addAttributes(word: word, wordArray: wordArray)
    }
    
    // This is only used to find example words for specific letter combo to ipa pairs
    func getWordArray(word: String, ipa: String) -> [letterAndAttributes] {
        
        var wordArray = [letterAndAttributes]()
        var ipaArray = [IpaLetter]()
        
        for letter in word {
            wordArray.append(letterAndAttributes(letter: String(letter)))
        }
        for letter in ipa {
            ipaArray.append(IpaLetter(letter: String(letter)))
        }
        
        getMatches(&wordArray, &ipaArray, for: word, with: ipa)
        
        return wordArray
    }
    
    func getMatches(_ wordArray: inout [letterAndAttributes], _ ipaArray: inout [IpaLetter], for word: String, with ipa: String) {
        
        for thisCombo in lettersList {
            
            let comboIndices = ipa.indicesOf(string: thisCombo).filter { (index) -> Bool in
                for i in index..<(index + thisCombo.count) {
                    if ipaArray[i].matched == true { return false }
                }
                return true
            }
            
            if comboIndices.count == 0 {continue}
            
            let currIpaLetter = thisCombo
            let currIpaLength = thisCombo.count
            
            for matchIndex in comboIndices {
                
                let prevIpaTriple = getPrevLetterCombo(from: currIpaLetter, with: matchIndex, in: ipa, using: tripthongList) // Just for "weɪ"
                let prevPrevIpaTripleFromTriple = getPrevPrevLetterCombo(from: prevIpaTriple, with: matchIndex - (prevIpaTriple?.count ?? 100), in: ipa, using: tripthongList)
                let prevPrevIpaComboFromTriple = getPrevPrevLetterCombo(from: prevIpaTriple, with: matchIndex - (prevIpaTriple?.count ?? 100), in: ipa, using: dipthongList)
                let prevPrevIpaLetterFromTriple = getPrevPrevLetter(from: prevIpaTriple, with: matchIndex - (prevIpaTriple?.count ?? 100), in: ipa)
                
                
                let prevIpaCombo = getPrevLetterCombo(from: currIpaLetter, with: matchIndex, in: ipa, using: dipthongList)
                let prevPrevIpaTripleFromCombo = getPrevPrevLetterCombo(from: prevIpaCombo, with: matchIndex - (prevIpaCombo?.count ?? 100), in: ipa, using: tripthongList)
                let prevPrevIpaComboFromCombo = getPrevPrevLetterCombo(from: prevIpaCombo, with: matchIndex - (prevIpaCombo?.count ?? 100), in: ipa, using: dipthongList)
                let prevPrevIpaLetterFromCombo = getPrevPrevLetter(from: prevIpaCombo, with: matchIndex - (prevIpaCombo?.count ?? 100) , in: ipa)
                
                
                let prevIpaLetter = getPrevLetter(from: currIpaLetter, with: matchIndex, in: ipa)
                let prevPrevIpaTripleFromLetter = getPrevPrevLetterCombo(from: prevIpaLetter, with: matchIndex - (prevIpaLetter?.count ?? 100), in: ipa, using: tripthongList)
                let prevPrevIpaComboFromLetter = getPrevPrevLetterCombo(from: prevIpaLetter, with: matchIndex - (prevIpaLetter?.count ?? 100), in: ipa, using: dipthongList)
                let prevPrevIpaLetterFromLetter = getPrevPrevLetter(from: prevIpaLetter, with: matchIndex - (prevIpaLetter?.count ?? 100) , in: ipa)
                
                
                let nextIpaTriple = getNextLetterCombo(from: currIpaLetter, with: matchIndex, and: currIpaLength, in: ipa, using: tripthongList)
                let nextNextIpaTripleFromTriple = getNextNextLetterCombo(from: nextIpaTriple, with: matchIndex + currIpaLength, and: nextIpaTriple?.count ?? 100, in : ipa, using: tripthongList)
                let nextNextIpaComboFromTriple = getNextNextLetterCombo(from: nextIpaTriple, with: matchIndex + currIpaLength, and: nextIpaTriple?.count ?? 100, in : ipa, using: dipthongList)
                let nextNextIpaLetterFromTriple = getNextNextLetter(from: nextIpaTriple, with: matchIndex + currIpaLength, and: nextIpaTriple?.count ?? 100, in : ipa)
                
                
                let nextIpaCombo = getNextLetterCombo(from: currIpaLetter, with: matchIndex, and: currIpaLength, in: ipa, using: dipthongList)
                let nextNextIpaTripleFromCombo = getNextNextLetterCombo(from: nextIpaCombo, with: matchIndex + currIpaLength, and: nextIpaCombo?.count ?? 100, in : ipa, using: tripthongList)
                let nextNextIpaComboFromCombo = getNextNextLetterCombo(from: nextIpaCombo, with: matchIndex + currIpaLength, and: nextIpaCombo?.count ?? 100, in : ipa, using: dipthongList)
                let nextNextIpaLetterFromCombo = getNextNextLetter(from: nextIpaCombo, with: matchIndex + currIpaLength, and: nextIpaCombo?.count ?? 100, in : ipa)
                
                
                let nextIpaLetter = getNextLetter(from: currIpaLetter, with: matchIndex, and: currIpaLength, in: ipa)
                let nextNextIpaTripleFromLetter = getNextNextLetterCombo(from: nextIpaLetter, with: matchIndex + currIpaLength, and: nextIpaLetter?.count ?? 100, in : ipa, using: tripthongList)
                let nextNextIpaComboFromLetter = getNextNextLetterCombo(from: nextIpaLetter, with: matchIndex + currIpaLength, and: nextIpaLetter?.count ?? 100, in : ipa, using: dipthongList)
                let nextNextIpaLetterFromLetter = getNextNextLetter(from: nextIpaLetter, with: matchIndex + currIpaLength, and: nextIpaLetter?.count ?? 100, in : ipa)
                
                mapIpaToEnglish(in: word, given: currIpaLetter, with: currIpaLength, and: matchIndex,
                                 
                                 having: prevIpaTriple, prevPrevIpaTripleFromTriple, prevPrevIpaComboFromTriple, prevPrevIpaLetterFromTriple,
                                 
                                 having: prevIpaCombo, prevPrevIpaTripleFromCombo, prevPrevIpaComboFromCombo, prevPrevIpaLetterFromCombo,
                                 
                                 having: prevIpaLetter, prevPrevIpaTripleFromLetter, prevPrevIpaComboFromLetter, prevPrevIpaLetterFromLetter,
                                 
                                 having: nextIpaTriple, nextNextIpaTripleFromTriple, nextNextIpaComboFromTriple, nextNextIpaLetterFromTriple,
                                 
                                 having: nextIpaCombo, nextNextIpaTripleFromCombo, nextNextIpaComboFromCombo, nextNextIpaLetterFromCombo,
                                 
                                 having: nextIpaLetter, nextNextIpaTripleFromLetter, nextNextIpaComboFromLetter, nextNextIpaLetterFromLetter,
                                 
                                 update: &wordArray, &ipaArray)
            }
        }
    }
        
    func getPrevLetterCombo(from currLetter: String, with index: Int, in ipa: String, using ipaList: [String]) -> String? {
        
        if index == 0 {return nil}
        
        var thisIpa = ipa
        var thisIndex = index
        
        if thisIpa[thisIndex - 1] == "'" {
            thisIpa.remove(at: thisIpa.index(thisIpa.startIndex, offsetBy: thisIndex - 1))
            thisIndex -= 1
        }
        
        for IpaCombo in ipaList {
            
            if (thisIndex - IpaCombo.count >= 0) && thisIpa[NSRange(location: (thisIndex - IpaCombo.count), length: IpaCombo.count)] == IpaCombo {
                return IpaCombo
            }
        }
        return nil
    }
    
    func getNextLetterCombo(from currLetter: String, with index: Int, and length: Int, in ipa: String, using ipaList: [String]) -> String? {
        
        if index + length == ipa.count {return nil}
        
        var thisIpa = ipa
        
        if thisIpa[index + length] == "'" {
            thisIpa.remove(at: thisIpa.index(thisIpa.startIndex, offsetBy: index + length))
        }
        
        for IpaCombo in ipaList {
            
            if ((index + length + IpaCombo.count) <= thisIpa.count) && (ipa[NSRange(location: (index + length), length: IpaCombo.count)] == IpaCombo) {
                return IpaCombo
            }
        }
        
        return nil
    }
    
    func getPrevLetter(from currLetter: String, with index: Int, in ipa: String) -> String? {
        
        if index == 0 { return nil }
        
        var thisIpa = ipa
        var thisIndex = index
        
        if thisIpa[thisIndex - 1] == "'" {
            thisIpa.remove(at: thisIpa.index(thisIpa.startIndex, offsetBy: thisIndex - 1))
            thisIndex -= 1
        }
        
        if ((thisIndex - 1) >= 0) {
            return String(thisIpa[thisIndex - 1])
        } else { return nil }
    }
    
    func getNextLetter(from currLetter: String, with index: Int, and length: Int, in ipa: String) -> String? {
        
        if index + length == ipa.count {return nil}
        
        var thisIpa = ipa
        
        if thisIpa[index + length] == "'" {
            thisIpa.remove(at: thisIpa.index(thisIpa.startIndex, offsetBy: index + length))
        }
        
        if (index + length) < thisIpa.count {
            return String(thisIpa[index + length])
        } else { return nil }
    }
    
    func getPrevPrevLetterCombo(from prevIpaCombo: String?, with index: Int, in ipa: String, using ipaList : [String]) -> String? {
        
        guard let prevIpaCombo = prevIpaCombo else { return nil }
        
        var index = index
        
        if ipa[index + prevIpaCombo.count - 1] == "'" { index -= 1 }
        
        return getPrevLetterCombo(from: prevIpaCombo, with: index, in: ipa, using: ipaList)
    }
    
    func getNextNextLetterCombo(from nextIpaCombo: String?, with index: Int, and length: Int, in ipa: String, using ipaList: [String]) -> String? {
        
        guard let nextIpaCombo = nextIpaCombo else { return nil }
        
        var index = index
        
        if ipa[index] == "'" { index += 1}
        
        return getNextLetterCombo(from: nextIpaCombo, with: index, and: length, in: ipa, using: ipaList)
    }
    
    func getPrevPrevLetter(from prevIpaCombo: String?, with index: Int, in ipa: String) -> String? {
        
        guard let prevIpaCombo = prevIpaCombo else { return nil }
        
        var index = index
        
        if ipa[index + prevIpaCombo.count - 1] == "'" { index -= 1}
        
        return getPrevLetter(from: prevIpaCombo, with: index, in: ipa)
    }
    
    func getNextNextLetter(from nextIpaCombo: String?, with index: Int, and length: Int, in ipa: String) -> String? {
        
        guard let nextIpaCombo = nextIpaCombo else { return nil }
        
        var index = index
        
        if ipa[index] == "'" { index += 1}

        return getNextLetter(from: nextIpaCombo, with: index, and: length, in: ipa)
    }
    
    func mapIpaToEnglish(in word: String, given currIpaLetter: String, with currIpaLength: Int, and matchIndex: Int,
                          
                          having prevIpaTriple: String?,_ prevPrevIpaTripleFromTriple: String?,_ prevPrevIpaComboFromTriple: String?,_ prevPrevIpaLetterFromTriple: String?,
                          
                          having prevIpaCombo: String?,_ prevPrevIpaTripleFromCombo: String?,_ prevPrevIpaComboFromCombo: String?,_ prevPrevIpaLetterFromCombo: String?,
                          
                          having prevIpaLetter: String?,_ prevPrevIpaTripleFromLetter: String?,_ prevPrevIpaComboFromLetter: String?,_ prevPrevIpaLetterFromLetter: String?,
                          
                          having nextIpaTriple: String?,_ nextNextIpaTripleFromTriple: String?,_ nextNextIpaComboFromTriple: String?,_ nextNextIpaLetterFromTriple: String?,
                          
                          having nextIpaCombo: String?,_ nextNextIpaTripleFromCombo: String?,_ nextNextIpaComboFromCombo: String?,_ nextNextIpaLetterFromCombo: String?,
                          
                          having nextIpaLetter: String?,_ nextNextIpaTripleFromLetter: String?,_ nextNextIpaComboFromLetter: String?,_ nextNextIpaLetterFromLetter: String?,
                          
                          update wordArray: inout [letterAndAttributes],_ ipaArray: inout [IpaLetter]) {
        
        guard let engLetterCombosFromCurrIpa = realmManager.getLetterCombos(from: currIpaLetter) else { return }
        
        let engLetterCombosFromPrevIpaTriple = realmManager.getLetterCombos(from: prevIpaTriple)
        let engLetterCombosFromPrevIpaCombo = realmManager.getLetterCombos(from: prevIpaCombo)
        let engLetterCombosFromPrevIpaLetter = realmManager.getLetterCombos(from: prevIpaLetter)
        
        let engLetterCombosFromNextIpaTriple = realmManager.getLetterCombos(from: nextIpaTriple)
        let engLetterCombosFromNextIpaCombo = realmManager.getLetterCombos(from: nextIpaCombo)
        let engLetterCombosFromNextIpaLetter = realmManager.getLetterCombos(from: nextIpaLetter)
        
        for engLetterComboFromCurrIpa in engLetterCombosFromCurrIpa {
            
            let currEngLetterComboIndices = word.indicesOf(string: engLetterComboFromCurrIpa).filter { (index) -> Bool in
                for i in index..<(index + engLetterComboFromCurrIpa.count) {
                    if wordArray[i].matched == true { return false }
                }
                return true
            }
            
            if currEngLetterComboIndices.count == 0 { continue }
            
            for currEngLetterComboIndex in currEngLetterComboIndices {
                var foundPrevMatch = false
                var foundNextMatch = false
                
                foundPrevMatch = canFindPrevMatch(from: engLetterCombosFromPrevIpaTriple, given: currEngLetterComboIndex, word, prevPrevIpaTripleFromTriple, prevPrevIpaComboFromTriple, prevPrevIpaLetterFromTriple, indicator: true) || canFindPrevMatch(from: engLetterCombosFromPrevIpaCombo, given: currEngLetterComboIndex, word, prevPrevIpaTripleFromCombo, prevPrevIpaComboFromCombo, prevPrevIpaLetterFromCombo, indicator: true) || canFindPrevMatch(from: engLetterCombosFromPrevIpaLetter, given: currEngLetterComboIndex, word, prevPrevIpaTripleFromLetter, prevPrevIpaComboFromLetter, prevPrevIpaLetterFromLetter, indicator: false)
                
                foundNextMatch = canFindNextMatch(from: engLetterCombosFromNextIpaTriple, given: currEngLetterComboIndex, with: engLetterComboFromCurrIpa.count, word, nextNextIpaTripleFromTriple, nextNextIpaComboFromTriple, nextNextIpaLetterFromTriple, indicator: true) || canFindNextMatch(from: engLetterCombosFromNextIpaCombo, given: currEngLetterComboIndex, with: engLetterComboFromCurrIpa.count, word, nextNextIpaTripleFromCombo, nextNextIpaComboFromCombo, nextNextIpaLetterFromCombo, indicator: true) || canFindNextMatch(from: engLetterCombosFromNextIpaLetter, given: currEngLetterComboIndex, with: engLetterComboFromCurrIpa.count, word, nextNextIpaTripleFromLetter, nextNextIpaComboFromLetter, nextNextIpaLetterFromLetter, indicator: false)
            
                if foundPrevMatch && foundNextMatch {
                    // Update wordArray and return from the function because we have found a match for this current letter
                    let colorSchemeForMatch = realmManager.getColorSchemeForLetterCombo(ipaParent: currIpaLetter, letterCombo: engLetterComboFromCurrIpa)
                    let linkNumberValue = realmManager.getWildcardNumberValue(ipaCombo: currIpaLetter, letterCombo: engLetterComboFromCurrIpa)
                    
                    for i in 0 ..< engLetterComboFromCurrIpa.count {
                        wordArray[i + currEngLetterComboIndex].color = [colorSchemeForMatch[i].red, colorSchemeForMatch[i].green, colorSchemeForMatch[i].blue]
                        wordArray[i + currEngLetterComboIndex].ipaParent = currIpaLetter
                        wordArray[i + currEngLetterComboIndex].matched = true
                        wordArray[i + currEngLetterComboIndex].linkNumberValue = linkNumberValue
                    }
                    
                    for i in matchIndex ..< (matchIndex + currIpaLength) {
                        ipaArray[i].matched = true
                    }
                    
                    return
                }
            }
            
        }
    }
        
    func canFindPrevMatch(from prevPossibleEngCombos: [String]?, given currEngLetterComboIndex: Int,_ word: String,_ prevPrevIpaTriple: String?,_ prevPrevIpaCombo: String?,_ prevPrevIpaLetter: String?, indicator: Bool) -> Bool {
        
        guard let prevPossibleEngCombos = prevPossibleEngCombos else {
            if currEngLetterComboIndex == 0 && indicator == false { return true }
            else { return false }
        }
        
        for prevCombo in prevPossibleEngCombos {
            
            if (currEngLetterComboIndex - prevCombo.count) >= 0 && String(word[(currEngLetterComboIndex - prevCombo.count) ..< currEngLetterComboIndex]) == prevCombo {
                
                if canFindPrevPrevMatch(prevPrevIpaTriple, currEngLetterComboIndex, prevCombo.count, word, indicator: true) ||
                   canFindPrevPrevMatch(prevPrevIpaCombo, currEngLetterComboIndex, prevCombo.count, word, indicator: true) ||
                   canFindPrevPrevMatch(prevPrevIpaLetter, currEngLetterComboIndex, prevCombo.count, word, indicator: false) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func canFindNextMatch(from nextPossibleEngCombos: [String]?, given currEngLetterComboIndex: Int, with engLetterComboFromCurrIpaLength: Int,_ word: String,_ nextNextIpaTriple: String?,_ nextNextIpaCombo: String?,_ nextNextIpaLetter: String?, indicator: Bool) -> Bool {
        
        guard let nextPossibleEngCombos = nextPossibleEngCombos else {
            if (currEngLetterComboIndex + engLetterComboFromCurrIpaLength) == word.count && indicator == false { return true }
            else { return false }
        }
        
        for nextCombo in nextPossibleEngCombos {
            
            if (currEngLetterComboIndex + engLetterComboFromCurrIpaLength + nextCombo.count) <= word.count && String(word[(currEngLetterComboIndex + engLetterComboFromCurrIpaLength) ..< (currEngLetterComboIndex + engLetterComboFromCurrIpaLength + nextCombo.count)]) == nextCombo {
                
                if canFindNextNextMatch(nextNextIpaTriple, currEngLetterComboIndex, engLetterComboFromCurrIpaLength, nextCombo.count, word, indicator: true) ||
                   canFindNextNextMatch(nextNextIpaCombo, currEngLetterComboIndex, engLetterComboFromCurrIpaLength, nextCombo.count, word, indicator: true) ||
                   canFindNextNextMatch(nextNextIpaLetter, currEngLetterComboIndex, engLetterComboFromCurrIpaLength, nextCombo.count, word, indicator: false) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func canFindPrevPrevMatch(_ prevPrevIpaCombo: String?,_ currEngLetterComboIndex: Int,_ currPrevEngComboLength: Int,_ word: String, indicator: Bool) -> Bool {
        
        guard let prevPrevIpaCombo = prevPrevIpaCombo, let engLetterCombosFromPrevPrevIpaCombo = realmManager.getLetterCombos(from: prevPrevIpaCombo) else {
            if currEngLetterComboIndex - currPrevEngComboLength == 0 && indicator == false { return true }
            else { return false }
        }
        
        for prevPrevCombo in engLetterCombosFromPrevPrevIpaCombo {
            
            if (currEngLetterComboIndex - currPrevEngComboLength - prevPrevCombo.count) >= 0 && String(word[(currEngLetterComboIndex - currPrevEngComboLength - prevPrevCombo.count) ..< (currEngLetterComboIndex - currPrevEngComboLength)]) == prevPrevCombo {
                return true
            }
        }
        return false
    }
    
    func canFindNextNextMatch(_ nextNextIpaCombo: String?,_ currEngLetterComboIndex: Int,_ engLetterComboFromCurrIpaLength: Int,_ currNextEngComboLength: Int,_ word: String, indicator: Bool) -> Bool {
        
        guard let nextNextIpaCombo = nextNextIpaCombo, let engLetterCombosFromNextNextIpaCombo = realmManager.getLetterCombos(from: nextNextIpaCombo) else {
            if currEngLetterComboIndex + engLetterComboFromCurrIpaLength + currNextEngComboLength == word.count && indicator == false { return true }
            else { return false }
        }
        
        for nextNextCombo in engLetterCombosFromNextNextIpaCombo {
            
            if (currEngLetterComboIndex + engLetterComboFromCurrIpaLength + currNextEngComboLength + nextNextCombo.count) <= word.count && String(word[(currEngLetterComboIndex + engLetterComboFromCurrIpaLength + currNextEngComboLength) ..< (currEngLetterComboIndex + engLetterComboFromCurrIpaLength + currNextEngComboLength + nextNextCombo.count)]) == nextNextCombo { return true }
        }
        return false
    }
    
    func addAttributes(word: String, wordArray: [letterAndAttributes]) -> (NSMutableAttributedString, Bool) {
        
        let attributedQuote = NSMutableAttributedString(string: word)
        var isFullyMatched = true
        
        for i in 0..<wordArray.count {
            let color = UIColor(red: CGFloat(wordArray[i].color[0]), green: CGFloat(wordArray[i].color[1]), blue: CGFloat(wordArray[i].color[2]), alpha: 1)
            
            if !wordArray[i].matched {
                isFullyMatched = false
            }
            
            attributedQuote.addAttribute(.foregroundColor, value: color, range: NSRange(location: i, length: 1))
            
            if let ipaID = wordArray[i].ipaParent {
                attributedQuote.addAttribute(.id, value: ipaID, range: NSRange(location: i, length: 1))
            }
            
            if wordArray[i].linkNumberValue != nil {
                attributedQuote.addAttribute(.linkNumber, value: wordArray[i].linkNumberValue!, range: NSRange(location: i, length: 1))
                
            }
        }
        
        return (attributedQuote, isFullyMatched)
    }
}


