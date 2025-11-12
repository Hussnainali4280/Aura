//
//  RealmManager.swift
//  simply-english
//
//  Created by Max Dolensky on 2/26/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmManager {
    
    func getLetterCombos (from ipaLetter: String?) -> [String]? {
        var letterComboArray = [String]()
        
        guard let ipaLetter = ipaLetter else { return nil }
        
        do {
            let realm = try Realm()
            let ipaProfile = realm.objects(IPALetter.self).filter("ipaLetter = '\(ipaLetter)'")
            
            if ipaProfile.count > 0 {
                
                for letterCombo in ipaProfile[0].letterCombos {
                    letterComboArray.append(letterCombo.letterCombo)
                }
                //print(letterComboArray)
                return letterComboArray
                
            } else {return nil}
            
        } catch {
            print("Error initialising new realm, \(error)")
            return nil
        }
    }
    
    func getColorSchemeForLetterCombo(ipaParent: String, letterCombo: String) -> [LetterColor] {
        var letterColorArray = [LetterColor]()
        do {
            let realm = try Realm()
            let colorMapList = realm.objects(ColorMap.self).filter("ipaParent = '\(ipaParent)' AND LetterComboParent = \"\(letterCombo)\"")
            
            for letter in colorMapList {
                let color = getColor(for: letter.color)
                let newLetterColor = LetterColor(red: Double(color.redValue), green: Double(color.greenValue), blue: Double(color.blueValue))
                letterColorArray.append(newLetterColor)
            }
            
            //print(letterColorArray)
            return letterColorArray
            
        } catch {
            print("Error initialising new realm, \(error)")
            return []
        }
    }
    
    func getWildcardNumberValue(ipaCombo: String, letterCombo: String) -> String? {
        
        do {
            let realm = try Realm()
            let wildCardList = realm.objects(WildCardModel.self).filter("ipaCombo = '\(ipaCombo)' AND letterCombo = \"\(letterCombo)\"")
            if wildCardList.count > 0 {
                return wildCardList[0].numberValue
            } else {return nil}
       
        } catch {
            print("Error initialising new realm, \(error)")
            return nil
        }
    }
    
    func getColor(for colorString: String) -> UIColor {
        switch colorString {
        case "red":
            return K.Colors.red
        case "green":
            return K.Colors.green
        case "blue":
            return K.Colors.blue
        case "lightGreen":
            return K.Colors.lightGreen
        case "seaBlue":
            return K.Colors.seaBlue
        case "darkGreen":
            return K.Colors.darkGreen
        case "lightPink":
            return K.Colors.lightPink
        case "orange":
            return K.Colors.orange
        case "pink":
            return K.Colors.pink
        case "purple":
            return K.Colors.purple
        case "lightBlue":
            return K.Colors.lightBlue
        case "darkBlue":
            return K.Colors.darkBlue
        case "turquoise":
            return K.Colors.turquoise
        case "brownPurple":
            return K.Colors.brownPurple
        case "brownRed":
            return K.Colors.brownRed
        case "tan":
            return K.Colors.tan
        case "brownYellow":
            return K.Colors.brownYellow
        case "black":
            return K.Colors.black
        case "darkGrey":
            return K.Colors.darkGrey
        case "lightGrey":
            return K.Colors.lightGrey
        case "yellow":
            return K.Colors.yellow
        case "blueGrey":
            return K.Colors.blueGrey
        case "maroon":
            return K.Colors.maroon
        default:
            return K.Colors.black
        }
    }
}
