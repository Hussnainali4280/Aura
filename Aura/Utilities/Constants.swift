//
//  Constants.swift
//  Aura
//
//  Created by Max Dolensky on 7/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//
import UIKit

struct K {
    
    // Firebase Collection Names
    struct FBConstants {
        static let dictionaryCollectionName = "Words"
        static let usersCollectionName = "Users"
        static let ccPurchasesCollectionName = "CC_Purchases"
        static let lessonsCollectionName = NSLocalizedString("lessonNameForRegion", comment: "")
        static let colorErrorsCollectionName = "Coloring_Error"
        static let translationErrorCollectionName = "Translation_Error"
        static let superUser = "4vCef03V7SMdjTDq5EyYYqCiLsk2"
        static var baseCourseIDs: [String] {
            return ["ehd_master_course", "kyg_course"]
        }
    }
    
    struct RCConstants {
        static let introBaseID = "intro_baseID"
        static let minuteToShowBuyBtn = "min_show_buy_btn"
        static let secondToShowBuyBtn = "sec_show_buy_btn"
        static let minimumFetchTime = 60.0 * 60.0 * 4.0
    }
    
    struct FunnelConstants {
        static let minuteToShowBuyBtn = RCManager.shared.value(forKey: RCConstants.minuteToShowBuyBtn).intValue
        static let secondToShowBuyBtn = RCManager.shared.value(forKey: RCConstants.secondToShowBuyBtn).intValue
        static let secondToShowBuyIfIntroSeen = 15
        static let minToShowKYGBuyBtnAfterPurchase = 7
        static let secToShowKYGBuyBtnAfterPurchase = 5
        static let minToShowKYGBuyBtn = 6
        static let secToShowKYGBuyBtn = 57
    }
    
    struct VideoConstants {
        static let secondsToMarkVideoFinished = 15
    }
    
    // English HD Colors
    struct Colors {
        
        // Vowel Sounds
        static let red         = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        static let green       = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        static let blue        = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        static let lightGreen  = UIColor(red: 0.5843, green: 0.8275, blue: 0.3098, alpha: 1.0)
        static let seaBlue     = UIColor(red: 0.0, green: 0.5176, blue: 0.5843, alpha: 1.0)
        static let darkGreen   = UIColor(red: 0.0, green: 0.3450, blue: 0.0, alpha: 1.0)
        static let lightPink   = UIColor(red: 0.9647, green: 0.6196, blue: 0.8627, alpha: 1.0)
        static let orange      = UIColor(red: 1.0, green: 0.5137, blue: 0.1608, alpha: 1.0)
        static let pink        = UIColor(red: 1.0, green: 0.0588, blue: 0.7765, alpha: 1.0)
        static let purple      = UIColor(red: 0.8275, green: 0.0667, blue: 1.0, alpha: 1.0)
        static let lightBlue   = UIColor(red: 0.5176, green: 0.5176, blue: 1.0, alpha: 1.0)
        static let darkBlue    = UIColor(red: 0.0, green: 0.0, blue: 0.4863, alpha: 1.0)
        static let turquoise   = UIColor(red: 0.0, green: 1.0, blue: 0.7568, alpha: 1.0)
        
        // Fluid Consonant Sounds
        static let brownPurple = UIColor(red: 0.4823, green: 0.1019, blue: 0.4117, alpha: 1.0)
        static let brownRed    = UIColor(red: 0.6196, green: 0.3098, blue: 0.2745, alpha: 1.0)
        static let tan         = UIColor(red: 1.0, green: 0.7568, blue: 0.5176, alpha: 1.0)
        static let brownYellow = UIColor(red: 0.7176, green: 0.6235, blue: 0.1922, alpha: 1.0)
        
        // Other Sounds
        static let black       = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        static let darkGrey    = UIColor(red: 0.5215, green: 0.5215, blue: 0.5215, alpha: 1.0)
        static let lightGrey   = UIColor(red: 0.9215, green: 0.9215, blue: 0.9215, alpha: 1.0)
        static let yellow      = UIColor(red: 255.0/255.0, green: 222.0/255.0, blue: 3.0/255.0, alpha: 1.0)
        static let blueGrey    = UIColor(red: 0.7882, green: 0.9294, blue: 0.9333, alpha: 1.0)
        static let maroon      = UIColor(red: 0.6588, green: 0.0314, blue: 0.0, alpha: 1.0)
    }
    
    // Design Colors
    struct DesignColors {
        
        static let background   = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
        static let primary      = UIColor(red: 98.0/255.0, green: 0.0, blue: 238.0/255.0, alpha: 1.0)
        static let darkVariant  = UIColor(red: 55.0/255.0, green: 0.0, blue: 179.0/255.0, alpha: 1.0)
        static let lightVariant = UIColor(red: 187.0/255.0, green: 134.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        static let purpleGrey   = UIColor(red: 140.0/255.0, green: 125.0/255.0, blue: 151.0/255.0, alpha: 1.0)
        static let error        = UIColor(red: 176.0/255.0, green: 0.0, blue: 32.0/255.0, alpha: 1.0)
    }
    
    // Font Names
    struct Fonts {
        
        static let didot = "Didot"
        static let didotBold = "Didot-Bold"
        static let avenirBlack = "Avenir-Black"
        
    }
    
    // Cell Ids
    struct Cells {
        static let prevSearchCell = "PrevSearchCell"
        static let supportedLanguageCell = "SupportedLanguageCell"
        static let deckCell = "DeckCell"
        static let flashcardCell = "FlashcardCell"
    }
    
    struct productIdentifiers {
        static let ehdMasterCourse = "com.iai.Aura.EHDMasterCourse"
        static let kygCourse = "kyg_course"
        static let kygCourseNoDiscount = "kyg_course_no_discount"
        static let EHD_KYG_Bundle = "ehd_kyg_bundle"
    }
    
    struct productNames {
        static let ehdMasterCourse = "EHDMasterCourse"
        static let kygCourse = "KYGCourse"
    }
        
    // Key Data For Populating the Key Controller
    struct KeyInfo {
        
        // Info for vowelKey cards
        static let vowelSoundAndColor = [("BOT", K.Colors.green), ("BAT", K.Colors.red), ("BOUT", K.Colors.blue),
                              ("BOOT", K.Colors.lightGreen), ("BUT", K.Colors.lightPink), ("BOOK", K.Colors.lightBlue),
                              ("BEAT", K.Colors.seaBlue), ("BIT", K.Colors.orange), ("BET", K.Colors.darkGreen),
                              ("BAIT", K.Colors.pink), ("BITE", K.Colors.darkBlue), ("BOAT", K.Colors.purple),
                              ("BOYD", K.Colors.turquoise)]
        
        // Info for fluidConsonantsKey cards
        static let fluidSoundAndColor = [("MISSION", K.Colors.tan), ("VISION", K.Colors.brownPurple),
                              ("CHOKE", K.Colors.brownRed), ("JOKE", K.Colors.brownYellow),
                              ("Y", K.Colors.blueGrey)]
        
        // Info for trueConsonantsKey cards
        static let trueSoundAndText = [("B", "Bb"), ("K", "Cc"), ("D", "Dd"), ("F", "Ff"), ("G", "Gg"), ("H", "Hh"), ("K", "Kk"),
                                ("L", "Ll"), ("M", "Mm"), ("N", "Nn"), ("P", "Pp"), ("Q", "qu"), ("R", "Rr"), ("S", "Ss"), ("T", "Tt"),
                                ("TH", "th"), ("V", "Vv"), ("W", "Ww"), ("KS", "Xx"), ("Z", "Zz")]
        
        // Info for flipConsonantsKey cards
        static let flipSoundAndText = [("S", "Cc"), ("T", "Dd"), ("V", "Ff"), ("DarkL", "Ll"), ("NSoft", "Nn"), ("DarkR", "Rr"),
                                ("Z", "Ss"), ("D", "Tt"), ("THunvoiced", "th"), ("GZ", "Xx"), ("S", "Zz")]
        
        // Might Use to give the full key view sound options
        static let colorToSoundDictionary = [K.Colors.green: "BOT", K.Colors.red: "BAT", K.Colors.blue: "BOUT",
                                             K.Colors.lightGreen: "BOOT", K.Colors.lightPink: "BUT", K.Colors.lightBlue: "BOOK",
                                             K.Colors.seaBlue: "BEAT", K.Colors.orange: "BIT", K.Colors.darkGreen: "BET",
                                             K.Colors.pink: "BAIT", K.Colors.darkBlue: "BITE", K.Colors.purple: "BOAT",
                                             K.Colors.turquoise: "BOYD", K.Colors.brownPurple: "VISION", K.Colors.brownYellow: "JOKE",
                                             K.Colors.brownRed: "CHOKE", K.Colors.tan: "MISSION", K.Colors.blueGrey: "Y"]
        
    }
    
    struct UserDefaultKeys {
        
        static let voiceGender = "voiceGender"
        static let isRepeat = "isRepeat"
        static let langCode = "langCode"
        static let langName = "langName"
        
    }
    
    static let EHDMasterCourseDeckTitle = ["Vowel - BOT", "Vowel - BAT", "Vowel - BOUT", "Vowel - BOOT",
                                           "Vowel - BUT", "Vowel - BOOK", "Vowel - BEAT", "Vowel - BIT",
                                           "Vowel - BET", "Vowel - BAIT", "Vowel - BITE", "Vowel - BOAT",
                                           "Vowel - BOYD", "True - B", "True - C", "True - D", "True - F",
                                           "True - G", "True - H", "True - K", "True - L", "True - M",
                                           "True - N", "True - P", "True - QU", "True - R", "True - S",
                                           "True - T", "True - TH", "True - V", "True - W", "True - X",
                                           "True - Z", "Flip - C", "Flip - D", "Flip - F", "Flip - L",
                                           "Flip - N", "Flip - R", "Flip - S", "Flip - T", "Flip - TH",
                                           "Flip - X", "Flip - Z", "Fluid - MISSION", "Fluid - VISION",
                                           "Fluid - CHOKE", "Fluid - JOKE", "Fluid - YOU", "Silents", "Wildcards"]
    
    
    // Number Identifiers for Wildcards
    static let linkToWildCardDictionary: [String: NSMutableAttributedString] = {
        
        var dictionary = [String: NSMutableAttributedString]()
        
        let wild1 = NSMutableAttributedString(string: "z")
        dictionary["1"] = wild1
        
        let wild2 = NSMutableAttributedString(string: "ya")
        wild2.addAttribute(.foregroundColor, value: K.Colors.blueGrey, range: NSRange(location: 0, length: 1))
        wild2.addAttribute(.foregroundColor, value: K.Colors.lightPink, range: NSRange(location: 1, length: 1))
        dictionary["2"] = wild2
        
        let wild3 = NSMutableAttributedString(string: "yu")
        wild3.addAttribute(.foregroundColor, value: K.Colors.blueGrey, range: NSRange(location: 0, length: 1))
        wild3.addAttribute(.foregroundColor, value: K.Colors.lightPink, range: NSRange(location: 1, length: 1))
        dictionary["3"] = wild3
        
        let wild4 = NSMutableAttributedString(string: "yew")
        wild4.addAttribute(.foregroundColor, value: K.Colors.blueGrey, range: NSRange(location: 0, length: 1))
        wild4.addAttribute(.foregroundColor, value: K.Colors.lightGreen, range: NSRange(location: 1, length: 2))
        dictionary["4"] = wild4
        
        
        let wild5 = NSMutableAttributedString(string: "yu")
        wild5.addAttribute(.foregroundColor, value: K.Colors.blueGrey, range: NSRange(location: 0, length: 1))
        wild5.addAttribute(.foregroundColor, value: K.Colors.lightGreen, range: NSRange(location: 1, length: 1))
        dictionary["5"] = wild5
        
        let wild6 = NSMutableAttributedString(string: "ksh")
        wild6.addAttribute(.foregroundColor, value: K.Colors.tan, range: NSRange(location: 1, length: 2))
        dictionary["6"] = wild6
        
        let wild7 = NSMutableAttributedString(string: "wa")
        wild7.addAttribute(.foregroundColor, value: K.Colors.pink, range: NSRange(location: 1, length: 1))
        dictionary["7"] = wild7
        
        let wild8 = NSMutableAttributedString(string: "wo")
        wild8.addAttribute(.foregroundColor, value: K.Colors.lightPink, range: NSRange(location: 1, length: 1))
        dictionary["8"] = wild8
        
        let wild9 = NSMutableAttributedString(string: "wa")
        wild9.addAttribute(.foregroundColor, value: K.Colors.orange, range: NSRange(location: 1, length: 1))
        dictionary["9"] = wild9
        

        let wild10 = NSMutableAttributedString(string: "f")
        dictionary["10"] = wild10
        
        let wild11 = NSMutableAttributedString(string: "h")
        dictionary["11"] = wild11
        
        let wild12 = NSMutableAttributedString(string: "k")
        dictionary["12"] = wild12
        
        let wild13 = NSMutableAttributedString(string: "w")
        dictionary["13"] = wild13
        
        let wild14 = NSMutableAttributedString(string: "t")
        dictionary["14"] = wild14
        
        let wild15 = NSMutableAttributedString(string: "v")
        dictionary["15"] = wild15
        
        let wild16 = NSMutableAttributedString(string: "r")
        wild16.addAttribute(.foregroundColor, value: K.Colors.darkGrey, range: NSRange(location: 0, length: 1))
        dictionary["16"] = wild16
        
        let wild17 = NSMutableAttributedString(string: "g")
        dictionary["17"] = wild17
        
        return dictionary
        
    }()
    
    // Language Codes For Translation
    //    struct LanguageCodes {
    //
    //        static let languageDict =  ["en" : "English",     "en-GB" : "English",      "en-AU" : "English",
    //                                    "en-CA" : "English",  "en-IN" : "English",      "fr" : "Français",
    //                                    "fr-CA" : "Français",   "es" : "Español",           "es-MX" : "Español",
    //                                    "pt" : "Português",     "pt-BR" : "Português",      "it" : "Italiano",
    //                                    "de" : "Deutsch",      "zh-Hans" : "简体中文",        "zh-Hant" : "繁體中文",
    //                                    "zh-HK" : "繁體中文",      "ja" : "日本語",                "nl" : "Nederlands",
    //                                    "ko" : "한국어",           "vi" : "Tiếng Việt",       "ru" : "Pусский",
    //                                    "sv" : "Svenska",       "da" : "Dansk",               "fi" : "Suomi",
    //                                    "nb" : "Norsk",         "tr" : "Türkçe",                "el" : "Eλληνικά",
    //                                    "id" : "Indonesia",    "ms" : "Melayu",             "th" : "ภาษาไทย",
    //                                    "hi" : "हिंदी",              "hu" : "Magyar",             "pl" : "Polski",
    //                                    "cs" : "čeština",       "sk" : "Slovenčina",         "uk" : "українська",
    //                                    "ca" : "Català",      "ro" : "Română",             "hr" : "Hrvatski",
    //                                    "he" : "עברית",           "ar" : "العربية"]
    //
    //        static let iosToGoogleLangCode = ["en-GB" : "en", "en-AU" : "en", "en-CA" : "en",
    //                                          "en-IN" : "en", "fr-CA" : "fr", "es-MX" : "es",
    //                                          "pt-BR" : "pt","zh-Hans" : "zh-CN", "zh-Hant" : "zh-TW",
    //                                          "zh-HK" : "zh-TW", "nb" : "no"]
    //    }
}

