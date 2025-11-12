//
//  RealmPopulater.swift
//  Aura
//
//  Created by Max Dolensky on 7/17/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmPopulater {
    
    static func populateRealm () {
        // ========================================
        // MARK: - "b"
        // ========================================
        let newIPALetter0 = IPALetter()
        newIPALetter0.ipaLetter = "b"
        
        //===================================
        let newLetterCombo0 = LetterCombo()
        newLetterCombo0.letterCombo = "bb"
        newLetterCombo0.ipaParent = "b"
        
        let newColorMap0 = ColorMap()
        newColorMap0.LetterComboParent = "bb"
        newColorMap0.ipaParent = "b"
        newColorMap0.color = "black"
        
        let newColorMap1 = ColorMap()
        newColorMap1.LetterComboParent = "bb"
        newColorMap1.ipaParent = "b"
        newColorMap1.color = "black"
        
        newLetterCombo0.colorMapList.append(objectsIn: [newColorMap0,newColorMap1])
        newIPALetter0.letterCombos.append(objectsIn: [newLetterCombo0])
        //=======================================
        let newLetterCombo1 = LetterCombo()
        newLetterCombo1.letterCombo = "be"
        newLetterCombo1.ipaParent = "b"
        
        let newColorMap2 = ColorMap()
        newColorMap2.LetterComboParent = "be"
        newColorMap2.ipaParent = "b"
        newColorMap2.color = "black"
        
        let newColorMap3 = ColorMap()
        newColorMap3.LetterComboParent = "be"
        newColorMap3.ipaParent = "b"
        newColorMap3.color = "lightGrey"
        
        newLetterCombo1.colorMapList.append(objectsIn: [newColorMap2,newColorMap3])
        newIPALetter0.letterCombos.append(objectsIn: [newLetterCombo1])
        //=======================================
        let newLetterCombo2 = LetterCombo()
        newLetterCombo2.letterCombo = "bh"
        newLetterCombo2.ipaParent = "b"
        
        let newColorMap4 = ColorMap()
        newColorMap4.LetterComboParent = "bh"
        newColorMap4.ipaParent = "b"
        newColorMap4.color = "black"
        
        let newColorMap5 = ColorMap()
        newColorMap5.LetterComboParent = "bh"
        newColorMap5.ipaParent = "b"
        newColorMap5.color = "lightGrey"
        
        newLetterCombo2.colorMapList.append(objectsIn: [newColorMap4,newColorMap5])
        newIPALetter0.letterCombos.append(objectsIn: [newLetterCombo2])
        //=======================================
        let newLetterCombo3 = LetterCombo()
        newLetterCombo3.letterCombo = "pb"
        newLetterCombo3.ipaParent = "b"
        
        let newColorMap6 = ColorMap()
        newColorMap6.LetterComboParent = "pb"
        newColorMap6.ipaParent = "b"
        newColorMap6.color = "lightGrey"
        
        let newColorMap7 = ColorMap()
        newColorMap7.LetterComboParent = "pb"
        newColorMap7.ipaParent = "b"
        newColorMap7.color = "black"
        
        newLetterCombo3.colorMapList.append(objectsIn: [newColorMap6,newColorMap7])
        newIPALetter0.letterCombos.append(objectsIn: [newLetterCombo3])
        //=======================================
        let newLetterCombo4 = LetterCombo()
        newLetterCombo4.letterCombo = "b"
        newLetterCombo4.ipaParent = "b"
        
        let newColorMap8 = ColorMap()
        newColorMap8.LetterComboParent = "b"
        newColorMap8.ipaParent = "b"
        newColorMap8.color = "black"
        
        newLetterCombo4.colorMapList.append(objectsIn: [newColorMap8])
        newIPALetter0.letterCombos.append(objectsIn: [newLetterCombo4])
        
        // =========================================
        // MARK: - "ɡ"
        // =========================================
        let newIPALetter1 = IPALetter()
        newIPALetter1.ipaLetter = "ɡ"
        
        //===================================
        let newLetterCombo5 = LetterCombo()
        newLetterCombo5.letterCombo = "gue"
        newLetterCombo5.ipaParent = "ɡ"
        
        let newColorMap9 = ColorMap()
        newColorMap9.LetterComboParent = "gue"
        newColorMap9.ipaParent = "ɡ"
        newColorMap9.color = "black"
        
        let newColorMap10 = ColorMap()
        newColorMap10.LetterComboParent = "gue"
        newColorMap10.ipaParent = "ɡ"
        newColorMap10.color = "lightGrey"
        
        let newColorMap11 = ColorMap()
        newColorMap11.LetterComboParent = "gue"
        newColorMap11.ipaParent = "ɡ"
        newColorMap11.color = "lightGrey"
        
        newLetterCombo5.colorMapList.append(objectsIn: [newColorMap9,newColorMap10,newColorMap11])
        newIPALetter1.letterCombos.append(objectsIn: [newLetterCombo5])
        //=======================================
        let newLetterCombo6 = LetterCombo()
        newLetterCombo6.letterCombo = "gg"
        newLetterCombo6.ipaParent = "ɡ"
        
        let newColorMap12 = ColorMap()
        newColorMap12.LetterComboParent = "gg"
        newColorMap12.ipaParent = "ɡ"
        newColorMap12.color = "black"
        
        let newColorMap13 = ColorMap()
        newColorMap13.LetterComboParent = "gg"
        newColorMap13.ipaParent = "ɡ"
        newColorMap13.color = "black"
        
        newLetterCombo6.colorMapList.append(objectsIn: [newColorMap12,newColorMap13])
        newIPALetter1.letterCombos.append(objectsIn: [newLetterCombo6])
        //=======================================
        let newLetterCombo7 = LetterCombo()
        newLetterCombo7.letterCombo = "gh"
        newLetterCombo7.ipaParent = "ɡ"
        
        let newColorMap14 = ColorMap()
        newColorMap14.LetterComboParent = "gh"
        newColorMap14.ipaParent = "ɡ"
        newColorMap14.color = "black"
        
        let newColorMap15 = ColorMap()
        newColorMap15.LetterComboParent = "gh"
        newColorMap15.ipaParent = "ɡ"
        newColorMap15.color = "lightGrey"
        
        newLetterCombo7.colorMapList.append(objectsIn: [newColorMap14,newColorMap15])
        newIPALetter1.letterCombos.append(objectsIn: [newLetterCombo7])
        //=======================================
        let newLetterCombo8 = LetterCombo()
        newLetterCombo8.letterCombo = "ck"
        newLetterCombo8.ipaParent = "ɡ"
        
        let newColorMap16 = ColorMap()
        newColorMap16.LetterComboParent = "ck"
        newColorMap16.ipaParent = "ɡ"
        newColorMap16.color = "yellow"
        
        let newColorMap17 = ColorMap()
        newColorMap17.LetterComboParent = "ck"
        newColorMap17.ipaParent = "ɡ"
        newColorMap17.color = "yellow"
        
        newLetterCombo8.colorMapList.append(objectsIn: [newColorMap16,newColorMap17])
        newIPALetter1.letterCombos.append(objectsIn: [newLetterCombo8])
        //=======================================
        let newLetterCombo9 = LetterCombo()
        newLetterCombo9.letterCombo = "g"
        newLetterCombo9.ipaParent = "ɡ"
        
        let newColorMap18 = ColorMap()
        newColorMap18.LetterComboParent = "g"
        newColorMap18.ipaParent = "ɡ"
        newColorMap18.color = "black"
        
        newLetterCombo9.colorMapList.append(objectsIn: [newColorMap18])
        newIPALetter1.letterCombos.append(objectsIn: [newLetterCombo9])
        
        // =========================================
        // MARK: - "l"
        // =========================================
        let newIPALetter2 = IPALetter()
        newIPALetter2.ipaLetter = "l"
        
        //===================================
        let newLetterCombo10 = LetterCombo()
        newLetterCombo10.letterCombo = "lle"
        newLetterCombo10.ipaParent = "l"
        
        let newColorMap19 = ColorMap()
        newColorMap19.LetterComboParent = "lle"
        newColorMap19.ipaParent = "l"
        newColorMap19.color = "black"
        
        let newColorMap20 = ColorMap()
        newColorMap20.LetterComboParent = "lle"
        newColorMap20.ipaParent = "l"
        newColorMap20.color = "black"
        
        let newColorMap21 = ColorMap()
        newColorMap21.LetterComboParent = "lle"
        newColorMap21.ipaParent = "l"
        newColorMap21.color = "lightGrey"
        
        newLetterCombo10.colorMapList.append(objectsIn: [newColorMap19,newColorMap20,newColorMap21])
        newIPALetter2.letterCombos.append(objectsIn: [newLetterCombo10])
        //=======================================
        let newLetterCombo11 = LetterCombo()
        newLetterCombo11.letterCombo = "ll"
        newLetterCombo11.ipaParent = "l"
        
        let newColorMap22 = ColorMap()
        newColorMap22.LetterComboParent = "ll"
        newColorMap22.ipaParent = "l"
        newColorMap22.color = "black"
        
        let newColorMap23 = ColorMap()
        newColorMap23.LetterComboParent = "ll"
        newColorMap23.ipaParent = "l"
        newColorMap23.color = "black"
        
        newLetterCombo11.colorMapList.append(objectsIn: [newColorMap22,newColorMap23])
        newIPALetter2.letterCombos.append(objectsIn: [newLetterCombo11])
        //=======================================
        let newLetterCombo12 = LetterCombo()
        newLetterCombo12.letterCombo = "le"
        newLetterCombo12.ipaParent = "l"
        
        let newColorMap24 = ColorMap()
        newColorMap24.LetterComboParent = "le"
        newColorMap24.ipaParent = "l"
        newColorMap24.color = "black"
        
        let newColorMap25 = ColorMap()
        newColorMap25.LetterComboParent = "le"
        newColorMap25.ipaParent = "l"
        newColorMap25.color = "lightGrey"
        
        newLetterCombo12.colorMapList.append(objectsIn: [newColorMap24,newColorMap25])
        newIPALetter2.letterCombos.append(objectsIn: [newLetterCombo12])
        //=======================================
        let newLetterCombo13 = LetterCombo()
        newLetterCombo13.letterCombo = "el"
        newLetterCombo13.ipaParent = "l"
        
        let newColorMap26 = ColorMap()
        newColorMap26.LetterComboParent = "el"
        newColorMap26.ipaParent = "l"
        newColorMap26.color = "lightGrey"
        
        let newColorMap27 = ColorMap()
        newColorMap27.LetterComboParent = "el"
        newColorMap27.ipaParent = "l"
        newColorMap27.color = "black"
        
        newLetterCombo13.colorMapList.append(objectsIn: [newColorMap26,newColorMap27])
        newIPALetter2.letterCombos.append(objectsIn: [newLetterCombo13])
        //=======================================
        let newLetterCombo14 = LetterCombo()
        newLetterCombo14.letterCombo = "yl"
        newLetterCombo14.ipaParent = "l"
        
        let newColorMap28 = ColorMap()
        newColorMap28.LetterComboParent = "yl"
        newColorMap28.ipaParent = "l"
        newColorMap28.color = "lightGrey"
        
        let newColorMap29 = ColorMap()
        newColorMap29.LetterComboParent = "yl"
        newColorMap29.ipaParent = "l"
        newColorMap29.color = "black"
        
        newLetterCombo14.colorMapList.append(objectsIn: [newColorMap28,newColorMap29])
        newIPALetter2.letterCombos.append(objectsIn: [newLetterCombo14])
        //=======================================
        let newLetterCombo15 = LetterCombo()
        newLetterCombo15.letterCombo = "l"
        newLetterCombo15.ipaParent = "l"
        
        let newColorMap30 = ColorMap()
        newColorMap30.LetterComboParent = "l"
        newColorMap30.ipaParent = "l"
        newColorMap30.color = "black"
        
        newLetterCombo15.colorMapList.append(objectsIn: [newColorMap30])
        newIPALetter2.letterCombos.append(objectsIn: [newLetterCombo15])
        
        // =========================================
        // MARK: - "m"
        // =========================================
        let newIPALetter3 = IPALetter()
        newIPALetter3.ipaLetter = "m"
        
        //===================================
        let newLetterCombo16 = LetterCombo()
        newLetterCombo16.letterCombo = "mm"
        newLetterCombo16.ipaParent = "m"
        
        let newColorMap31 = ColorMap()
        newColorMap31.LetterComboParent = "mm"
        newColorMap31.ipaParent = "m"
        newColorMap31.color = "black"
        
        let newColorMap32 = ColorMap()
        newColorMap32.LetterComboParent = "mm"
        newColorMap32.ipaParent = "m"
        newColorMap32.color = "black"
        
        newLetterCombo16.colorMapList.append(objectsIn: [newColorMap31,newColorMap32])
        newIPALetter3.letterCombos.append(objectsIn: [newLetterCombo16])
        //===================================
        let newLetterCombo17 = LetterCombo()
        newLetterCombo17.letterCombo = "lm"
        newLetterCombo17.ipaParent = "m"
        
        let newColorMap33 = ColorMap()
        newColorMap33.LetterComboParent = "lm"
        newColorMap33.ipaParent = "m"
        newColorMap33.color = "lightGrey"
        
        let newColorMap34 = ColorMap()
        newColorMap34.LetterComboParent = "lm"
        newColorMap34.ipaParent = "m"
        newColorMap34.color = "black"
        
        newLetterCombo17.colorMapList.append(objectsIn: [newColorMap33,newColorMap34])
        newIPALetter3.letterCombos.append(objectsIn: [newLetterCombo17])
        //=======================================
        let newLetterCombo18 = LetterCombo()
        newLetterCombo18.letterCombo = "mb"
        newLetterCombo18.ipaParent = "m"
        
        let newColorMap35 = ColorMap()
        newColorMap35.LetterComboParent = "mb"
        newColorMap35.ipaParent = "m"
        newColorMap35.color = "black"
        
        let newColorMap36 = ColorMap()
        newColorMap36.LetterComboParent = "mb"
        newColorMap36.ipaParent = "m"
        newColorMap36.color = "lightGrey"
        
        newLetterCombo18.colorMapList.append(objectsIn: [newColorMap35,newColorMap36])
        newIPALetter3.letterCombos.append(objectsIn: [newLetterCombo18])
        //=======================================
        let newLetterCombo19 = LetterCombo()
        newLetterCombo19.letterCombo = "me"
        newLetterCombo19.ipaParent = "m"
        
        let newColorMap37 = ColorMap()
        newColorMap37.LetterComboParent = "me"
        newColorMap37.ipaParent = "m"
        newColorMap37.color = "black"
        
        let newColorMap38 = ColorMap()
        newColorMap38.LetterComboParent = "me"
        newColorMap38.ipaParent = "m"
        newColorMap38.color = "lightGrey"
        
        newLetterCombo19.colorMapList.append(objectsIn: [newColorMap37,newColorMap38])
        newIPALetter3.letterCombos.append(objectsIn: [newLetterCombo19])
        //=======================================
        let newLetterCombo20 = LetterCombo()
        newLetterCombo20.letterCombo = "mn"
        newLetterCombo20.ipaParent = "m"
        
        let newColorMap39 = ColorMap()
        newColorMap39.LetterComboParent = "mn"
        newColorMap39.ipaParent = "m"
        newColorMap39.color = "black"
        
        let newColorMap40 = ColorMap()
        newColorMap40.LetterComboParent = "mn"
        newColorMap40.ipaParent = "m"
        newColorMap40.color = "lightGrey"
        
        newLetterCombo20.colorMapList.append(objectsIn: [newColorMap39,newColorMap40])
        newIPALetter3.letterCombos.append(objectsIn: [newLetterCombo20])
        //=======================================
        let newLetterCombo734 = LetterCombo()
        newLetterCombo734.letterCombo = "gm"
        newLetterCombo734.ipaParent = "m"
        
        let newColorMap2416 = ColorMap()
        newColorMap2416.LetterComboParent = "gm"
        newColorMap2416.ipaParent = "m"
        newColorMap2416.color = "lightGrey"
        
        let newColorMap2417 = ColorMap()
        newColorMap2417.LetterComboParent = "gm"
        newColorMap2417.ipaParent = "m"
        newColorMap2417.color = "black"
        
        newLetterCombo734.colorMapList.append(objectsIn: [newColorMap2416,newColorMap2417])
        newIPALetter3.letterCombos.append(objectsIn: [newLetterCombo734])
        //=======================================
        let newLetterCombo568 = LetterCombo()
        newLetterCombo568.letterCombo = "'m"
        newLetterCombo568.ipaParent = "m"
        
        let newColorMap2031 = ColorMap()
        newColorMap2031.LetterComboParent = "'m"
        newColorMap2031.ipaParent = "m"
        newColorMap2031.color = "lightGrey"
        
        let newColorMap2032 = ColorMap()
        newColorMap2032.LetterComboParent = "'m"
        newColorMap2032.ipaParent = "m"
        newColorMap2032.color = "black"
        
        newLetterCombo568.colorMapList.append(objectsIn: [newColorMap2031,newColorMap2032])
        newIPALetter3.letterCombos.append(objectsIn: [newLetterCombo568])
        //=======================================
        let newLetterCombo21 = LetterCombo()
        newLetterCombo21.letterCombo = "m"
        newLetterCombo21.ipaParent = "m"
        
        let newColorMap41 = ColorMap()
        newColorMap41.LetterComboParent = "m"
        newColorMap41.ipaParent = "m"
        newColorMap41.color = "black"
        
        newLetterCombo21.colorMapList.append(objectsIn: [newColorMap41])
        newIPALetter3.letterCombos.append(objectsIn: [newLetterCombo21])
        
        // =========================================
        // MARK: - "n"
        // =========================================
        let newIPALetter4 = IPALetter()
        newIPALetter4.ipaLetter = "n"
        
        //===================================
        let newLetterCombo22 = LetterCombo()
        newLetterCombo22.letterCombo = "dne"
        newLetterCombo22.ipaParent = "n"
        
        let newColorMap42 = ColorMap()
        newColorMap42.LetterComboParent = "dne"
        newColorMap42.ipaParent = "n"
        newColorMap42.color = "lightGrey"
        
        let newColorMap43 = ColorMap()
        newColorMap43.LetterComboParent = "dne"
        newColorMap43.ipaParent = "n"
        newColorMap43.color = "black"
        
        let newColorMap44 = ColorMap()
        newColorMap44.LetterComboParent = "dne"
        newColorMap44.ipaParent = "n"
        newColorMap44.color = "lightGrey"
        
        newLetterCombo22.colorMapList.append(objectsIn: [newColorMap42,newColorMap43,newColorMap44])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo22])
        //===================================
        let newLetterCombo23 = LetterCombo()
        newLetterCombo23.letterCombo = "gne"
        newLetterCombo23.ipaParent = "n"
        
        let newColorMap45 = ColorMap()
        newColorMap45.LetterComboParent = "gne"
        newColorMap45.ipaParent = "n"
        newColorMap45.color = "lightGrey"
        
        let newColorMap46 = ColorMap()
        newColorMap46.LetterComboParent = "gne"
        newColorMap46.ipaParent = "n"
        newColorMap46.color = "black"
        
        let newColorMap47 = ColorMap()
        newColorMap47.LetterComboParent = "gne"
        newColorMap47.ipaParent = "n"
        newColorMap47.color = "lightGrey"
        
        newLetterCombo23.colorMapList.append(objectsIn: [newColorMap45,newColorMap46,newColorMap47])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo23])
        //===================================
        let newLetterCombo24 = LetterCombo()
        newLetterCombo24.letterCombo = "nn"
        newLetterCombo24.ipaParent = "n"
        
        let newColorMap48 = ColorMap()
        newColorMap48.LetterComboParent = "nn"
        newColorMap48.ipaParent = "n"
        newColorMap48.color = "black"
        
        let newColorMap49 = ColorMap()
        newColorMap49.LetterComboParent = "nn"
        newColorMap49.ipaParent = "n"
        newColorMap49.color = "black"
        
        newLetterCombo24.colorMapList.append(objectsIn: [newColorMap48,newColorMap49])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo24])
        //===================================
        let newLetterCombo25 = LetterCombo()
        newLetterCombo25.letterCombo = "gn"
        newLetterCombo25.ipaParent = "n"
        
        let newColorMap50 = ColorMap()
        newColorMap50.LetterComboParent = "gn"
        newColorMap50.ipaParent = "n"
        newColorMap50.color = "lightGrey"
        
        let newColorMap51 = ColorMap()
        newColorMap51.LetterComboParent = "gn"
        newColorMap51.ipaParent = "n"
        newColorMap51.color = "black"
        
        newLetterCombo25.colorMapList.append(objectsIn: [newColorMap50,newColorMap51])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo25])
        //===================================
        let newLetterCombo569 = LetterCombo()
        newLetterCombo569.letterCombo = "dn"
        newLetterCombo569.ipaParent = "n"
        
        let newColorMap2033 = ColorMap()
        newColorMap2033.LetterComboParent = "dn"
        newColorMap2033.ipaParent = "n"
        newColorMap2033.color = "lightGrey"
        
        let newColorMap2034 = ColorMap()
        newColorMap2034.LetterComboParent = "dn"
        newColorMap2034.ipaParent = "n"
        newColorMap2034.color = "black"
        
        newLetterCombo569.colorMapList.append(objectsIn: [newColorMap2033,newColorMap2034])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo569])
        //===================================
        let newLetterCombo26 = LetterCombo()
        newLetterCombo26.letterCombo = "kn"
        newLetterCombo26.ipaParent = "n"
        
        let newColorMap52 = ColorMap()
        newColorMap52.LetterComboParent = "kn"
        newColorMap52.ipaParent = "n"
        newColorMap52.color = "lightGrey"
        
        let newColorMap53 = ColorMap()
        newColorMap53.LetterComboParent = "kn"
        newColorMap53.ipaParent = "n"
        newColorMap53.color = "black"
        
        newLetterCombo26.colorMapList.append(objectsIn: [newColorMap52,newColorMap53])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo26])
        //===================================
        let newLetterCombo27 = LetterCombo()
        newLetterCombo27.letterCombo = "ln"
        newLetterCombo27.ipaParent = "n"
        
        let newColorMap54 = ColorMap()
        newColorMap54.LetterComboParent = "ln"
        newColorMap54.ipaParent = "n"
        newColorMap54.color = "lightGrey"
        
        let newColorMap55 = ColorMap()
        newColorMap55.LetterComboParent = "ln"
        newColorMap55.ipaParent = "n"
        newColorMap55.color = "black"
        
        newLetterCombo27.colorMapList.append(objectsIn: [newColorMap54,newColorMap55])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo27])
        //===================================
        let newLetterCombo28 = LetterCombo()
        newLetterCombo28.letterCombo = "mn"
        newLetterCombo28.ipaParent = "n"
        
        let newColorMap56 = ColorMap()
        newColorMap56.LetterComboParent = "mn"
        newColorMap56.ipaParent = "n"
        newColorMap56.color = "lightGrey"
        
        let newColorMap57 = ColorMap()
        newColorMap57.LetterComboParent = "mn"
        newColorMap57.ipaParent = "n"
        newColorMap57.color = "black"
        
        newLetterCombo28.colorMapList.append(objectsIn: [newColorMap56,newColorMap57])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo28])
        //===================================
        let newLetterCombo29 = LetterCombo()
        newLetterCombo29.letterCombo = "nd"
        newLetterCombo29.ipaParent = "n"
        
        let newColorMap58 = ColorMap()
        newColorMap58.LetterComboParent = "nd"
        newColorMap58.ipaParent = "n"
        newColorMap58.color = "black"
        
        let newColorMap59 = ColorMap()
        newColorMap59.LetterComboParent = "nd"
        newColorMap59.ipaParent = "n"
        newColorMap59.color = "lightGrey"
        
        newLetterCombo29.colorMapList.append(objectsIn: [newColorMap58,newColorMap59])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo29])
        //===================================
        let newLetterCombo30 = LetterCombo()
        newLetterCombo30.letterCombo = "ne"
        newLetterCombo30.ipaParent = "n"
        
        let newColorMap60 = ColorMap()
        newColorMap60.LetterComboParent = "ne"
        newColorMap60.ipaParent = "n"
        newColorMap60.color = "black"
        
        let newColorMap61 = ColorMap()
        newColorMap61.LetterComboParent = "ne"
        newColorMap61.ipaParent = "n"
        newColorMap61.color = "lightGrey"
        
        newLetterCombo30.colorMapList.append(objectsIn: [newColorMap60,newColorMap61])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo30])
        //===================================
        let newLetterCombo31 = LetterCombo()
        newLetterCombo31.letterCombo = "pn"
        newLetterCombo31.ipaParent = "n"
        
        let newColorMap62 = ColorMap()
        newColorMap62.LetterComboParent = "pn"
        newColorMap62.ipaParent = "n"
        newColorMap62.color = "lightGrey"
        
        let newColorMap63 = ColorMap()
        newColorMap63.LetterComboParent = "pn"
        newColorMap63.ipaParent = "n"
        newColorMap63.color = "black"
        
        newLetterCombo31.colorMapList.append(objectsIn: [newColorMap62,newColorMap63])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo31])
        //===================================
        let newLetterCombo570 = LetterCombo()
        newLetterCombo570.letterCombo = "nt"
        newLetterCombo570.ipaParent = "n"
        
        let newColorMap2035 = ColorMap()
        newColorMap2035.LetterComboParent = "nt"
        newColorMap2035.ipaParent = "n"
        newColorMap2035.color = "black"
        
        let newColorMap2036 = ColorMap()
        newColorMap2036.LetterComboParent = "nt"
        newColorMap2036.ipaParent = "n"
        newColorMap2036.color = "lightGrey"
        
        newLetterCombo570.colorMapList.append(objectsIn: [newColorMap2035,newColorMap2036])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo570])
        //===================================
        let newLetterCombo32 = LetterCombo()
        newLetterCombo32.letterCombo = "n"
        newLetterCombo32.ipaParent = "n"
        
        let newColorMap64 = ColorMap()
        newColorMap64.LetterComboParent = "n"
        newColorMap64.ipaParent = "n"
        newColorMap64.color = "black"
        
        newLetterCombo32.colorMapList.append(objectsIn: [newColorMap64])
        newIPALetter4.letterCombos.append(objectsIn: [newLetterCombo32])
        
        // =========================================
        // MARK: - "p"
        // =========================================
        let newIPALetter5 = IPALetter()
        newIPALetter5.ipaLetter = "p"
        
        //===================================
        let newLetterCombo33 = LetterCombo()
        newLetterCombo33.letterCombo = "pp"
        newLetterCombo33.ipaParent = "p"
        
        let newColorMap65 = ColorMap()
        newColorMap65.LetterComboParent = "pp"
        newColorMap65.ipaParent = "p"
        newColorMap65.color = "black"
        
        let newColorMap66 = ColorMap()
        newColorMap66.LetterComboParent = "pp"
        newColorMap66.ipaParent = "p"
        newColorMap66.color = "black"
        
        newLetterCombo33.colorMapList.append(objectsIn: [newColorMap65,newColorMap66])
        newIPALetter5.letterCombos.append(objectsIn: [newLetterCombo33])
        //===================================
        let newLetterCombo34 = LetterCombo()
        newLetterCombo34.letterCombo = "pe"
        newLetterCombo34.ipaParent = "p"
        
        let newColorMap67 = ColorMap()
        newColorMap67.LetterComboParent = "pe"
        newColorMap67.ipaParent = "p"
        newColorMap67.color = "black"
        
        let newColorMap68 = ColorMap()
        newColorMap68.LetterComboParent = "pe"
        newColorMap68.ipaParent = "p"
        newColorMap68.color = "lightGrey"
        
        newLetterCombo34.colorMapList.append(objectsIn: [newColorMap67,newColorMap68])
        newIPALetter5.letterCombos.append(objectsIn: [newLetterCombo34])
        //===================================
        let newLetterCombo35 = LetterCombo()
        newLetterCombo35.letterCombo = "ph"
        newLetterCombo35.ipaParent = "p"
        
        let newColorMap69 = ColorMap()
        newColorMap69.LetterComboParent = "ph"
        newColorMap69.ipaParent = "p"
        newColorMap69.color = "black"
        
        let newColorMap70 = ColorMap()
        newColorMap70.LetterComboParent = "ph"
        newColorMap70.ipaParent = "p"
        newColorMap70.color = "lightGrey"
        
        newLetterCombo35.colorMapList.append(objectsIn: [newColorMap69,newColorMap70])
        newIPALetter5.letterCombos.append(objectsIn: [newLetterCombo35])
        //===================================
        let newLetterCombo571 = LetterCombo()
        newLetterCombo571.letterCombo = "pt"
        newLetterCombo571.ipaParent = "p"
        
        let newColorMap2037 = ColorMap()
        newColorMap2037.LetterComboParent = "pt"
        newColorMap2037.ipaParent = "p"
        newColorMap2037.color = "black"
        
        let newColorMap2038 = ColorMap()
        newColorMap2038.LetterComboParent = "pt"
        newColorMap2038.ipaParent = "p"
        newColorMap2038.color = "lightGrey"
        
        newLetterCombo571.colorMapList.append(objectsIn: [newColorMap2037,newColorMap2038])
        newIPALetter5.letterCombos.append(objectsIn: [newLetterCombo571])
        //===================================
        let newLetterCombo36 = LetterCombo()
        newLetterCombo36.letterCombo = "p"
        newLetterCombo36.ipaParent = "p"
        
        let newColorMap71 = ColorMap()
        newColorMap71.LetterComboParent = "p"
        newColorMap71.ipaParent = "p"
        newColorMap71.color = "black"
        
        newLetterCombo36.colorMapList.append(objectsIn: [newColorMap71])
        newIPALetter5.letterCombos.append(objectsIn: [newLetterCombo36])
        
        // =========================================
        // MARK: - "r"
        // =========================================
        let newIPALetter6 = IPALetter()
        newIPALetter6.ipaLetter = "r"
        
        //===================================
        let newLetterCombo38 = LetterCombo()
        newLetterCombo38.letterCombo = "rr"
        newLetterCombo38.ipaParent = "r"
        
        let newColorMap75 = ColorMap()
        newColorMap75.LetterComboParent = "rr"
        newColorMap75.ipaParent = "r"
        newColorMap75.color = "black"
        
        let newColorMap76 = ColorMap()
        newColorMap76.LetterComboParent = "rr"
        newColorMap76.ipaParent = "r"
        newColorMap76.color = "black"
        
        newLetterCombo38.colorMapList.append(objectsIn: [newColorMap75,newColorMap76])
        newIPALetter6.letterCombos.append(objectsIn: [newLetterCombo38])
        //===================================
        let newLetterCombo40 = LetterCombo()
        newLetterCombo40.letterCombo = "rh"
        newLetterCombo40.ipaParent = "r"
        
        let newColorMap79 = ColorMap()
        newColorMap79.LetterComboParent = "rh"
        newColorMap79.ipaParent = "r"
        newColorMap79.color = "black"
        
        let newColorMap80 = ColorMap()
        newColorMap80.LetterComboParent = "rh"
        newColorMap80.ipaParent = "r"
        newColorMap80.color = "lightGrey"
        
        newLetterCombo40.colorMapList.append(objectsIn: [newColorMap79,newColorMap80])
        newIPALetter6.letterCombos.append(objectsIn: [newLetterCombo40])
        //===================================
        let newLetterCombo42 = LetterCombo()
        newLetterCombo42.letterCombo = "wr"
        newLetterCombo42.ipaParent = "r"
        
        let newColorMap83 = ColorMap()
        newColorMap83.LetterComboParent = "wr"
        newColorMap83.ipaParent = "r"
        newColorMap83.color = "lightGrey"
        
        let newColorMap84 = ColorMap()
        newColorMap84.LetterComboParent = "wr"
        newColorMap84.ipaParent = "r"
        newColorMap84.color = "black"
        
        newLetterCombo42.colorMapList.append(objectsIn: [newColorMap83,newColorMap84])
        newIPALetter6.letterCombos.append(objectsIn: [newLetterCombo42])
        //===================================
        let newLetterCombo43 = LetterCombo()
        newLetterCombo43.letterCombo = "r"
        newLetterCombo43.ipaParent = "r"
        
        let newColorMap85 = ColorMap()
        newColorMap85.LetterComboParent = "r"
        newColorMap85.ipaParent = "r"
        newColorMap85.color = "black"
        
        newLetterCombo43.colorMapList.append(objectsIn: [newColorMap85])
        newIPALetter6.letterCombos.append(objectsIn: [newLetterCombo43])
        // =========================================
        // MARK: - "d"
        // =========================================
        let newIPALetter7 = IPALetter()
        newIPALetter7.ipaLetter = "d"
        
        //===================================
        let newLetterCombo45 = LetterCombo()
        newLetterCombo45.letterCombo = "dd"
        newLetterCombo45.ipaParent = "d"
        
        let newColorMap87 = ColorMap()
        newColorMap87.LetterComboParent = "dd"
        newColorMap87.ipaParent = "d"
        newColorMap87.color = "black"
        
        let newColorMap88 = ColorMap()
        newColorMap88.LetterComboParent = "dd"
        newColorMap88.ipaParent = "d"
        newColorMap88.color = "black"
        
        newLetterCombo45.colorMapList.append(objectsIn: [newColorMap87,newColorMap88])
        newIPALetter7.letterCombos.append(objectsIn: [newLetterCombo45])
        //===================================
        let newLetterCombo46 = LetterCombo()
        newLetterCombo46.letterCombo = "de"
        newLetterCombo46.ipaParent = "d"
        
        let newColorMap89 = ColorMap()
        newColorMap89.LetterComboParent = "de"
        newColorMap89.ipaParent = "d"
        newColorMap89.color = "black"
        
        let newColorMap90 = ColorMap()
        newColorMap90.LetterComboParent = "de"
        newColorMap90.ipaParent = "d"
        newColorMap90.color = "lightGrey"
        
        newLetterCombo46.colorMapList.append(objectsIn: [newColorMap89,newColorMap90])
        newIPALetter7.letterCombos.append(objectsIn: [newLetterCombo46])
        //===================================
        let newLetterCombo47 = LetterCombo()
        newLetterCombo47.letterCombo = "ed"
        newLetterCombo47.ipaParent = "d"
        
        let newColorMap91 = ColorMap()
        newColorMap91.LetterComboParent = "ed"
        newColorMap91.ipaParent = "d"
        newColorMap91.color = "lightGrey"
        
        let newColorMap92 = ColorMap()
        newColorMap92.LetterComboParent = "ed"
        newColorMap92.ipaParent = "d"
        newColorMap92.color = "black"
        
        newLetterCombo47.colorMapList.append(objectsIn: [newColorMap91,newColorMap92])
        newIPALetter7.letterCombos.append(objectsIn: [newLetterCombo47])
        //===================================
        let newLetterCombo48 = LetterCombo()
        newLetterCombo48.letterCombo = "ld"
        newLetterCombo48.ipaParent = "d"
        
        let newColorMap93 = ColorMap()
        newColorMap93.LetterComboParent = "ld"
        newColorMap93.ipaParent = "d"
        newColorMap93.color = "lightGrey"
        
        let newColorMap94 = ColorMap()
        newColorMap94.LetterComboParent = "ld"
        newColorMap94.ipaParent = "d"
        newColorMap94.color = "black"
        
        newLetterCombo48.colorMapList.append(objectsIn: [newColorMap93,newColorMap94])
        newIPALetter7.letterCombos.append(objectsIn: [newLetterCombo48])
        //===================================
        let newLetterCombo49 = LetterCombo()
        newLetterCombo49.letterCombo = "tt"
        newLetterCombo49.ipaParent = "d"
        
        let newColorMap95 = ColorMap()
        newColorMap95.LetterComboParent = "tt"
        newColorMap95.ipaParent = "d"
        newColorMap95.color = "darkGrey"
        
        let newColorMap96 = ColorMap()
        newColorMap96.LetterComboParent = "tt"
        newColorMap96.ipaParent = "d"
        newColorMap96.color = "darkGrey"
        
        newLetterCombo49.colorMapList.append(objectsIn: [newColorMap95,newColorMap96])
        newIPALetter7.letterCombos.append(objectsIn: [newLetterCombo49])
        //===================================
        let newLetterCombo572 = LetterCombo()
        newLetterCombo572.letterCombo = "ct"
        newLetterCombo572.ipaParent = "d"
        
        let newColorMap2039 = ColorMap()
        newColorMap2039.LetterComboParent = "ct"
        newColorMap2039.ipaParent = "d"
        newColorMap2039.color = "lightGrey"
        
        let newColorMap2040 = ColorMap()
        newColorMap2040.LetterComboParent = "ct"
        newColorMap2040.ipaParent = "d"
        newColorMap2040.color = "darkGrey"
        
        newLetterCombo572.colorMapList.append(objectsIn: [newColorMap2039,newColorMap2040])
        newIPALetter7.letterCombos.append(objectsIn: [newLetterCombo572])
        //===================================
        let newLetterCombo573 = LetterCombo()
        newLetterCombo573.letterCombo = "'d"
        newLetterCombo573.ipaParent = "d"
        
        let newColorMap2041 = ColorMap()
        newColorMap2041.LetterComboParent = "'d"
        newColorMap2041.ipaParent = "d"
        newColorMap2041.color = "lightGrey"
        
        let newColorMap2042 = ColorMap()
        newColorMap2042.LetterComboParent = "'d"
        newColorMap2042.ipaParent = "d"
        newColorMap2042.color = "black"
        
        newLetterCombo573.colorMapList.append(objectsIn: [newColorMap2041,newColorMap2042])
        newIPALetter7.letterCombos.append(objectsIn: [newLetterCombo573])
        //===================================
        let newLetterCombo50 = LetterCombo()
        newLetterCombo50.letterCombo = "d"
        newLetterCombo50.ipaParent = "d"
        
        let newColorMap97 = ColorMap()
        newColorMap97.LetterComboParent = "d"
        newColorMap97.ipaParent = "d"
        newColorMap97.color = "black"
        
        newLetterCombo50.colorMapList.append(objectsIn: [newColorMap97])
        newIPALetter7.letterCombos.append(objectsIn: [newLetterCombo50])
        //===================================
        let newLetterCombo51 = LetterCombo()
        newLetterCombo51.letterCombo = "t"
        newLetterCombo51.ipaParent = "d"
        
        let newColorMap98 = ColorMap()
        newColorMap98.LetterComboParent = "t"
        newColorMap98.ipaParent = "d"
        newColorMap98.color = "darkGrey"
        
        newLetterCombo51.colorMapList.append(objectsIn: [newColorMap98])
        newIPALetter7.letterCombos.append(objectsIn: [newLetterCombo51])
        
        // =========================================
        // MARK: - "ð"
        // =========================================
        let newIPALetter8 = IPALetter()
        newIPALetter8.ipaLetter = "ð"
        
        //===================================
        let newLetterCombo52 = LetterCombo()
        newLetterCombo52.letterCombo = "the"
        newLetterCombo52.ipaParent = "ð"
        
        let newColorMap99 = ColorMap()
        newColorMap99.LetterComboParent = "the"
        newColorMap99.ipaParent = "ð"
        newColorMap99.color = "black"
        
        let newColorMap100 = ColorMap()
        newColorMap100.LetterComboParent = "the"
        newColorMap100.ipaParent = "ð"
        newColorMap100.color = "black"
        
        let newColorMap101 = ColorMap()
        newColorMap101.LetterComboParent = "the"
        newColorMap101.ipaParent = "ð"
        newColorMap101.color = "lightGrey"
        
        newLetterCombo52.colorMapList.append(objectsIn: [newColorMap99,newColorMap100,newColorMap101])
        newIPALetter8.letterCombos.append(objectsIn: [newLetterCombo52])
        //===================================
        let newLetterCombo53 = LetterCombo()
        newLetterCombo53.letterCombo = "th"
        newLetterCombo53.ipaParent = "ð"
        
        let newColorMap102 = ColorMap()
        newColorMap102.LetterComboParent = "th"
        newColorMap102.ipaParent = "ð"
        newColorMap102.color = "black"
        
        let newColorMap103 = ColorMap()
        newColorMap103.LetterComboParent = "th"
        newColorMap103.ipaParent = "ð"
        newColorMap103.color = "black"
        
        newLetterCombo53.colorMapList.append(objectsIn: [newColorMap102,newColorMap103])
        newIPALetter8.letterCombos.append(objectsIn: [newLetterCombo53])
        
        // =========================================
        // MARK: - "t"
        // =========================================
        let newIPALetter9 = IPALetter()
        newIPALetter9.ipaLetter = "t"
        
        //===================================
        let newLetterCombo54 = LetterCombo()
        newLetterCombo54.letterCombo = "tte"
        newLetterCombo54.ipaParent = "t"
        
        let newColorMap104 = ColorMap()
        newColorMap104.LetterComboParent = "tte"
        newColorMap104.ipaParent = "t"
        newColorMap104.color = "black"
        
        let newColorMap105 = ColorMap()
        newColorMap105.LetterComboParent = "tte"
        newColorMap105.ipaParent = "t"
        newColorMap105.color = "black"
        
        let newColorMap106 = ColorMap()
        newColorMap106.LetterComboParent = "tte"
        newColorMap106.ipaParent = "t"
        newColorMap106.color = "lightGrey"
        
        newLetterCombo54.colorMapList.append(objectsIn: [newColorMap104,newColorMap105,newColorMap106])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo54])
        //===================================
        let newLetterCombo55 = LetterCombo()
        newLetterCombo55.letterCombo = "cht"
        newLetterCombo55.ipaParent = "t"
        
        let newColorMap107 = ColorMap()
        newColorMap107.LetterComboParent = "cht"
        newColorMap107.ipaParent = "t"
        newColorMap107.color = "lightGrey"
        
        let newColorMap108 = ColorMap()
        newColorMap108.LetterComboParent = "cht"
        newColorMap108.ipaParent = "t"
        newColorMap108.color = "lightGrey"
        
        let newColorMap109 = ColorMap()
        newColorMap109.LetterComboParent = "cht"
        newColorMap109.ipaParent = "t"
        newColorMap109.color = "black"
        
        newLetterCombo55.colorMapList.append(objectsIn: [newColorMap107,newColorMap108,newColorMap109])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo55])
        //===================================
        let newLetterCombo56 = LetterCombo()
        newLetterCombo56.letterCombo = "tt"
        newLetterCombo56.ipaParent = "t"
        
        let newColorMap110 = ColorMap()
        newColorMap110.LetterComboParent = "tt"
        newColorMap110.ipaParent = "t"
        newColorMap110.color = "black"
        
        let newColorMap111 = ColorMap()
        newColorMap111.LetterComboParent = "tt"
        newColorMap111.ipaParent = "t"
        newColorMap111.color = "black"
        
        newLetterCombo56.colorMapList.append(objectsIn: [newColorMap110,newColorMap111])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo56])
        //===================================
        let newLetterCombo57 = LetterCombo()
        newLetterCombo57.letterCombo = "bt"
        newLetterCombo57.ipaParent = "t"
        
        let newColorMap112 = ColorMap()
        newColorMap112.LetterComboParent = "bt"
        newColorMap112.ipaParent = "t"
        newColorMap112.color = "lightGrey"
        
        let newColorMap113 = ColorMap()
        newColorMap113.LetterComboParent = "bt"
        newColorMap113.ipaParent = "t"
        newColorMap113.color = "black"
        
        newLetterCombo57.colorMapList.append(objectsIn: [newColorMap112,newColorMap113])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo57])
        //===================================
        let newLetterCombo58 = LetterCombo()
        newLetterCombo58.letterCombo = "ed"
        newLetterCombo58.ipaParent = "t"
        
        let newColorMap114 = ColorMap()
        newColorMap114.LetterComboParent = "ed"
        newColorMap114.ipaParent = "t"
        newColorMap114.color = "lightGrey"
        
        let newColorMap115 = ColorMap()
        newColorMap115.LetterComboParent = "ed"
        newColorMap115.ipaParent = "t"
        newColorMap115.color = "darkGrey"
        
        newLetterCombo58.colorMapList.append(objectsIn: [newColorMap114,newColorMap115])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo58])
        //===================================
        let newLetterCombo59 = LetterCombo()
        newLetterCombo59.letterCombo = "te"
        newLetterCombo59.ipaParent = "t"
        
        let newColorMap116 = ColorMap()
        newColorMap116.LetterComboParent = "te"
        newColorMap116.ipaParent = "t"
        newColorMap116.color = "black"
        
        let newColorMap117 = ColorMap()
        newColorMap117.LetterComboParent = "te"
        newColorMap117.ipaParent = "t"
        newColorMap117.color = "lightGrey"
        
        newLetterCombo59.colorMapList.append(objectsIn: [newColorMap116,newColorMap117])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo59])
        //===================================
        let newLetterCombo60 = LetterCombo()
        newLetterCombo60.letterCombo = "pt"
        newLetterCombo60.ipaParent = "t"
        
        let newColorMap118 = ColorMap()
        newColorMap118.LetterComboParent = "pt"
        newColorMap118.ipaParent = "t"
        newColorMap118.color = "lightGrey"
        
        let newColorMap119 = ColorMap()
        newColorMap119.LetterComboParent = "pt"
        newColorMap119.ipaParent = "t"
        newColorMap119.color = "black"
        
        newLetterCombo60.colorMapList.append(objectsIn: [newColorMap118,newColorMap119])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo60])
        //===================================
        let newLetterCombo61 = LetterCombo()
        newLetterCombo61.letterCombo = "th"
        newLetterCombo61.ipaParent = "t"
        
        let newColorMap120 = ColorMap()
        newColorMap120.LetterComboParent = "th"
        newColorMap120.ipaParent = "t"
        newColorMap120.color = "black"
        
        let newColorMap121 = ColorMap()
        newColorMap121.LetterComboParent = "th"
        newColorMap121.ipaParent = "t"
        newColorMap121.color = "lightGrey"
        
        newLetterCombo61.colorMapList.append(objectsIn: [newColorMap120,newColorMap121])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo61])
        //===================================
        let newLetterCombo574 = LetterCombo()
        newLetterCombo574.letterCombo = "ct"
        newLetterCombo574.ipaParent = "t"
        
        let newColorMap2043 = ColorMap()
        newColorMap2043.LetterComboParent = "ct"
        newColorMap2043.ipaParent = "t"
        newColorMap2043.color = "lightGrey"
        
        let newColorMap2044 = ColorMap()
        newColorMap2044.LetterComboParent = "ct"
        newColorMap2044.ipaParent = "t"
        newColorMap2044.color = "black"
        
        newLetterCombo574.colorMapList.append(objectsIn: [newColorMap2043,newColorMap2044])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo574])
        //===================================
        let newLetterCombo575 = LetterCombo()
        newLetterCombo575.letterCombo = "'t"
        newLetterCombo575.ipaParent = "t"
        
        let newColorMap2045 = ColorMap()
        newColorMap2045.LetterComboParent = "'t"
        newColorMap2045.ipaParent = "t"
        newColorMap2045.color = "lightGrey"
        
        let newColorMap2046 = ColorMap()
        newColorMap2046.LetterComboParent = "'t"
        newColorMap2046.ipaParent = "t"
        newColorMap2046.color = "black"
        
        newLetterCombo575.colorMapList.append(objectsIn: [newColorMap2045,newColorMap2046])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo575])
        //===================================
        let newLetterCombo62 = LetterCombo()
        newLetterCombo62.letterCombo = "t"
        newLetterCombo62.ipaParent = "t"
        
        let newColorMap122 = ColorMap()
        newColorMap122.LetterComboParent = "t"
        newColorMap122.ipaParent = "t"
        newColorMap122.color = "black"
        
        newLetterCombo62.colorMapList.append(objectsIn: [newColorMap122])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo62])
        //===================================
        let newLetterCombo63 = LetterCombo()
        newLetterCombo63.letterCombo = "d"
        newLetterCombo63.ipaParent = "t"
        
        let newColorMap123 = ColorMap()
        newColorMap123.LetterComboParent = "d"
        newColorMap123.ipaParent = "t"
        newColorMap123.color = "darkGrey"
        
        newLetterCombo63.colorMapList.append(objectsIn: [newColorMap123])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo63])
        //===================================
        let newLetterCombo64 = LetterCombo()
        newLetterCombo64.letterCombo = "z"
        newLetterCombo64.ipaParent = "t"
        
        let newColorMap124 = ColorMap()
        newColorMap124.LetterComboParent = "z"
        newColorMap124.ipaParent = "t"
        newColorMap124.color = "yellow"
        
        newLetterCombo64.colorMapList.append(objectsIn: [newColorMap124])
        newIPALetter9.letterCombos.append(objectsIn: [newLetterCombo64])
        // =========================================
        // MARK: - "v"
        // =========================================
        let newIPALetter10 = IPALetter()
        newIPALetter10.ipaLetter = "v"
        
        //===================================
        let newLetterCombo65 = LetterCombo()
        newLetterCombo65.letterCombo = "lve"
        newLetterCombo65.ipaParent = "v"
        
        let newColorMap125 = ColorMap()
        newColorMap125.LetterComboParent = "lve"
        newColorMap125.ipaParent = "v"
        newColorMap125.color = "lightGrey"
        
        let newColorMap126 = ColorMap()
        newColorMap126.LetterComboParent = "lve"
        newColorMap126.ipaParent = "v"
        newColorMap126.color = "black"
        
        let newColorMap127 = ColorMap()
        newColorMap127.LetterComboParent = "lve"
        newColorMap127.ipaParent = "v"
        newColorMap127.color = "lightGrey"
        
        newLetterCombo65.colorMapList.append(objectsIn: [newColorMap125,newColorMap126,newColorMap127])
        newIPALetter10.letterCombos.append(objectsIn: [newLetterCombo65])
        //===================================
        let newLetterCombo576 = LetterCombo()
        newLetterCombo576.letterCombo = "'ve"
        newLetterCombo576.ipaParent = "v"
        
        let newColorMap2047 = ColorMap()
        newColorMap2047.LetterComboParent = "'ve"
        newColorMap2047.ipaParent = "v"
        newColorMap2047.color = "lightGrey"
        
        let newColorMap2048 = ColorMap()
        newColorMap2048.LetterComboParent = "'ve"
        newColorMap2048.ipaParent = "v"
        newColorMap2048.color = "black"
        
        let newColorMap2049 = ColorMap()
        newColorMap2049.LetterComboParent = "'ve"
        newColorMap2049.ipaParent = "v"
        newColorMap2049.color = "lightGrey"
        
        newLetterCombo576.colorMapList.append(objectsIn: [newColorMap2047,newColorMap2048,newColorMap2049])
        newIPALetter10.letterCombos.append(objectsIn: [newLetterCombo576])
        //===================================
        let newLetterCombo66 = LetterCombo()
        newLetterCombo66.letterCombo = "ve"
        newLetterCombo66.ipaParent = "v"
        
        let newColorMap128 = ColorMap()
        newColorMap128.LetterComboParent = "ve"
        newColorMap128.ipaParent = "v"
        newColorMap128.color = "black"
        
        let newColorMap129 = ColorMap()
        newColorMap129.LetterComboParent = "ve"
        newColorMap129.ipaParent = "v"
        newColorMap129.color = "lightGrey"
        
        newLetterCombo66.colorMapList.append(objectsIn: [newColorMap128,newColorMap129])
        newIPALetter10.letterCombos.append(objectsIn: [newLetterCombo66])
        //===================================
        let newLetterCombo67 = LetterCombo()
        newLetterCombo67.letterCombo = "ph"
        newLetterCombo67.ipaParent = "v"
        
        let newColorMap130 = ColorMap()
        newColorMap130.LetterComboParent = "ph"
        newColorMap130.ipaParent = "v"
        newColorMap130.color = "yellow"
        
        let newColorMap131 = ColorMap()
        newColorMap131.LetterComboParent = "ph"
        newColorMap131.ipaParent = "v"
        newColorMap131.color = "yellow"
        
        newLetterCombo67.colorMapList.append(objectsIn: [newColorMap130,newColorMap131])
        newIPALetter10.letterCombos.append(objectsIn: [newLetterCombo67])
        //===================================
        let newLetterCombo577 = LetterCombo()
        newLetterCombo577.letterCombo = "rv"
        newLetterCombo577.ipaParent = "v"
        
        let newColorMap2050 = ColorMap()
        newColorMap2050.LetterComboParent = "rv"
        newColorMap2050.ipaParent = "v"
        newColorMap2050.color = "lightGrey"
        
        let newColorMap2051 = ColorMap()
        newColorMap2051.LetterComboParent = "rv"
        newColorMap2051.ipaParent = "v"
        newColorMap2051.color = "black"
        
        newLetterCombo577.colorMapList.append(objectsIn: [newColorMap2050,newColorMap2051])
        newIPALetter10.letterCombos.append(objectsIn: [newLetterCombo577])
        //===================================
        let newLetterCombo740 = LetterCombo()
        newLetterCombo740.letterCombo = "vv"
        newLetterCombo740.ipaParent = "v"
        
        let newColorMap2428 = ColorMap()
        newColorMap2428.LetterComboParent = "vv"
        newColorMap2428.ipaParent = "v"
        newColorMap2428.color = "black"
        
        let newColorMap2429 = ColorMap()
        newColorMap2429.LetterComboParent = "vv"
        newColorMap2429.ipaParent = "v"
        newColorMap2429.color = "black"
        
        newLetterCombo740.colorMapList.append(objectsIn: [newColorMap2428,newColorMap2429])
        newIPALetter10.letterCombos.append(objectsIn: [newLetterCombo740])
        //===================================
        let newLetterCombo68 = LetterCombo()
        newLetterCombo68.letterCombo = "v"
        newLetterCombo68.ipaParent = "v"
        
        let newColorMap132 = ColorMap()
        newColorMap132.LetterComboParent = "v"
        newColorMap132.ipaParent = "v"
        newColorMap132.color = "black"
        
        newLetterCombo68.colorMapList.append(objectsIn: [newColorMap132])
        newIPALetter10.letterCombos.append(objectsIn: [newLetterCombo68])
        //===================================
        let newLetterCombo69 = LetterCombo()
        newLetterCombo69.letterCombo = "f"
        newLetterCombo69.ipaParent = "v"
        
        let newColorMap133 = ColorMap()
        newColorMap133.LetterComboParent = "f"
        newColorMap133.ipaParent = "v"
        newColorMap133.color = "darkGrey"
        
        newLetterCombo69.colorMapList.append(objectsIn: [newColorMap133])
        newIPALetter10.letterCombos.append(objectsIn: [newLetterCombo69])
        
        // =========================================
        // MARK: - "z"
        // =========================================
        let newIPALetter11 = IPALetter()
        newIPALetter11.ipaLetter = "z"
        
        //===================================
        let newLetterCombo70 = LetterCombo()
        newLetterCombo70.letterCombo = "sth"
        newLetterCombo70.ipaParent = "z"
        
        let newColorMap134 = ColorMap()
        newColorMap134.LetterComboParent = "sth"
        newColorMap134.ipaParent = "z"
        newColorMap134.color = "darkGrey"
        
        let newColorMap135 = ColorMap()
        newColorMap135.LetterComboParent = "sth"
        newColorMap135.ipaParent = "z"
        newColorMap135.color = "lightGrey"
        
        let newColorMap136 = ColorMap()
        newColorMap136.LetterComboParent = "sth"
        newColorMap136.ipaParent = "z"
        newColorMap136.color = "lightGrey"
        
        newLetterCombo70.colorMapList.append(objectsIn: [newColorMap134,newColorMap135,newColorMap136])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo70])
        //===================================
        let newLetterCombo71 = LetterCombo()
        newLetterCombo71.letterCombo = "se"
        newLetterCombo71.ipaParent = "z"
        
        let newColorMap137 = ColorMap()
        newColorMap137.LetterComboParent = "se"
        newColorMap137.ipaParent = "z"
        newColorMap137.color = "darkGrey"
        
        let newColorMap138 = ColorMap()
        newColorMap138.LetterComboParent = "se"
        newColorMap138.ipaParent = "z"
        newColorMap138.color = "lightGrey"
        
        newLetterCombo71.colorMapList.append(objectsIn: [newColorMap137,newColorMap138])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo71])
        //===================================
        let newLetterCombo72 = LetterCombo()
        newLetterCombo72.letterCombo = "ze"
        newLetterCombo72.ipaParent = "z"
        
        let newColorMap139 = ColorMap()
        newColorMap139.LetterComboParent = "ze"
        newColorMap139.ipaParent = "z"
        newColorMap139.color = "black"
        
        let newColorMap140 = ColorMap()
        newColorMap140.LetterComboParent = "ze"
        newColorMap140.ipaParent = "z"
        newColorMap140.color = "lightGrey"
        
        newLetterCombo72.colorMapList.append(objectsIn: [newColorMap139,newColorMap140])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo72])
        //===================================
        let newLetterCombo73 = LetterCombo()
        newLetterCombo73.letterCombo = "zz"
        newLetterCombo73.ipaParent = "z"
        
        let newColorMap141 = ColorMap()
        newColorMap141.LetterComboParent = "zz"
        newColorMap141.ipaParent = "z"
        newColorMap141.color = "black"
        
        let newColorMap142 = ColorMap()
        newColorMap142.LetterComboParent = "zz"
        newColorMap142.ipaParent = "z"
        newColorMap142.color = "black"
        
        newLetterCombo73.colorMapList.append(objectsIn: [newColorMap141,newColorMap142])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo73])
        //===================================
        let newLetterCombo74 = LetterCombo()
        newLetterCombo74.letterCombo = "sp"
        newLetterCombo74.ipaParent = "z"
        
        let newColorMap143 = ColorMap()
        newColorMap143.LetterComboParent = "sp"
        newColorMap143.ipaParent = "z"
        newColorMap143.color = "darkGrey"
        
        let newColorMap144 = ColorMap()
        newColorMap144.LetterComboParent = "sp"
        newColorMap144.ipaParent = "z"
        newColorMap144.color = "lightGrey"
        
        newLetterCombo74.colorMapList.append(objectsIn: [newColorMap143,newColorMap144])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo74])
        //===================================
        let newLetterCombo75 = LetterCombo()
        newLetterCombo75.letterCombo = "ss"
        newLetterCombo75.ipaParent = "z"
        
        let newColorMap145 = ColorMap()
        newColorMap145.LetterComboParent = "ss"
        newColorMap145.ipaParent = "z"
        newColorMap145.color = "darkGrey"
        
        let newColorMap146 = ColorMap()
        newColorMap146.LetterComboParent = "ss"
        newColorMap146.ipaParent = "z"
        newColorMap146.color = "darkGrey"
        
        newLetterCombo75.colorMapList.append(objectsIn: [newColorMap145,newColorMap146])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo75])
        //===================================
        let newLetterCombo76 = LetterCombo()
        newLetterCombo76.letterCombo = "si"
        newLetterCombo76.ipaParent = "z"
        
        let newColorMap147 = ColorMap()
        newColorMap147.LetterComboParent = "si"
        newColorMap147.ipaParent = "z"
        newColorMap147.color = "darkGrey"
        
        let newColorMap148 = ColorMap()
        newColorMap148.LetterComboParent = "si"
        newColorMap148.ipaParent = "z"
        newColorMap148.color = "lightGrey"
        
        newLetterCombo76.colorMapList.append(objectsIn: [newColorMap147,newColorMap148])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo76])
        //===================================
        let newLetterCombo578 = LetterCombo()
        newLetterCombo578.letterCombo = "es"
        newLetterCombo578.ipaParent = "z"
        
        let newColorMap2052 = ColorMap()
        newColorMap2052.LetterComboParent = "es"
        newColorMap2052.ipaParent = "z"
        newColorMap2052.color = "lightGrey"
        
        let newColorMap2053 = ColorMap()
        newColorMap2053.LetterComboParent = "es"
        newColorMap2053.ipaParent = "z"
        newColorMap2053.color = "darkGrey"
        
        newLetterCombo578.colorMapList.append(objectsIn: [newColorMap2052,newColorMap2053])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo578])
        //===================================
        let newLetterComb579 = LetterCombo()
        newLetterComb579.letterCombo = "'s"
        newLetterComb579.ipaParent = "z"
        
        let newColorMap2054 = ColorMap()
        newColorMap2054.LetterComboParent = "'s"
        newColorMap2054.ipaParent = "z"
        newColorMap2054.color = "lightGrey"
        
        let newColorMap2055 = ColorMap()
        newColorMap2055.LetterComboParent = "'s"
        newColorMap2055.ipaParent = "z"
        newColorMap2055.color = "darkGrey"
        
        newLetterComb579.colorMapList.append(objectsIn: [newColorMap2054,newColorMap2055])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterComb579])
        //===================================
        let newLetterCombo580 = LetterCombo()
        newLetterCombo580.letterCombo = "s'"
        newLetterCombo580.ipaParent = "z"
        
        let newColorMap2056 = ColorMap()
        newColorMap2056.LetterComboParent = "s'"
        newColorMap2056.ipaParent = "z"
        newColorMap2056.color = "darkGrey"
        
        let newColorMap2057 = ColorMap()
        newColorMap2057.LetterComboParent = "s'"
        newColorMap2057.ipaParent = "z"
        newColorMap2057.color = "lightGrey"
        
        newLetterCombo580.colorMapList.append(objectsIn: [newColorMap2056,newColorMap2057])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo580])
        //===================================
        let newLetterCombo77 = LetterCombo()
        newLetterCombo77.letterCombo = "z"
        newLetterCombo77.ipaParent = "z"
        
        let newColorMap149 = ColorMap()
        newColorMap149.LetterComboParent = "z"
        newColorMap149.ipaParent = "z"
        newColorMap149.color = "black"
        
        newLetterCombo77.colorMapList.append(objectsIn: [newColorMap149])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo77])
        //===================================
        let newLetterCombo78 = LetterCombo()
        newLetterCombo78.letterCombo = "s"
        newLetterCombo78.ipaParent = "z"
        
        let newColorMap150 = ColorMap()
        newColorMap150.LetterComboParent = "s"
        newColorMap150.ipaParent = "z"
        newColorMap150.color = "darkGrey"
        
        newLetterCombo78.colorMapList.append(objectsIn: [newColorMap150])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo78])
        //===================================
        let newLetterCombo79 = LetterCombo()
        newLetterCombo79.letterCombo = "x"
        newLetterCombo79.ipaParent = "z"
        
        let newColorMap151 = ColorMap()
        newColorMap151.LetterComboParent = "x"
        newColorMap151.ipaParent = "z"
        newColorMap151.color = "yellow"
        
        newLetterCombo79.colorMapList.append(objectsIn: [newColorMap151])
        newIPALetter11.letterCombos.append(objectsIn: [newLetterCombo79])
        
        // =========================================
        // MARK: - "θ"
        // =========================================
        let newIPALetter12 = IPALetter()
        newIPALetter12.ipaLetter = "θ"
        
        //===================================
        let newLetterCombo80 = LetterCombo()
        newLetterCombo80.letterCombo = "th"
        newLetterCombo80.ipaParent = "θ"
        
        let newColorMap152 = ColorMap()
        newColorMap152.LetterComboParent = "th"
        newColorMap152.ipaParent = "θ"
        newColorMap152.color = "darkGrey"
        
        let newColorMap153 = ColorMap()
        newColorMap153.LetterComboParent = "th"
        newColorMap153.ipaParent = "θ"
        newColorMap153.color = "darkGrey"
        
        newLetterCombo80.colorMapList.append(objectsIn: [newColorMap152,newColorMap153])
        newIPALetter12.letterCombos.append(objectsIn: [newLetterCombo80])
        
        // =========================================
        // MARK: - "æŋ"
        // =========================================
        let newIPALetter13 = IPALetter()
        newIPALetter13.ipaLetter = "æŋ"
        
        //===================================
        let newLetterCombo81 = LetterCombo()
        newLetterCombo81.letterCombo = "ang"
        newLetterCombo81.ipaParent = "æŋ"
        
        let newColorMap154 = ColorMap()
        newColorMap154.LetterComboParent = "ang"
        newColorMap154.ipaParent = "æŋ"
        newColorMap154.color = "pink"
        
        let newColorMap155 = ColorMap()
        newColorMap155.LetterComboParent = "ang"
        newColorMap155.ipaParent = "æŋ"
        newColorMap155.color = "darkGrey"
        
        let newColorMap156 = ColorMap()
        newColorMap156.LetterComboParent = "ang"
        newColorMap156.ipaParent = "æŋ"
        newColorMap156.color = "darkGrey"
        
        newLetterCombo81.colorMapList.append(objectsIn: [newColorMap154,newColorMap155,newColorMap156])
        newIPALetter13.letterCombos.append(objectsIn: [newLetterCombo81])
        //===================================
        let newLetterCombo745 = LetterCombo()
        newLetterCombo745.letterCombo = "and"
        newLetterCombo745.ipaParent = "æŋ"
        
        let newColorMap2440 = ColorMap()
        newColorMap2440.LetterComboParent = "and"
        newColorMap2440.ipaParent = "æŋ"
        newColorMap2440.color = "pink"
        
        let newColorMap2441 = ColorMap()
        newColorMap2441.LetterComboParent = "and"
        newColorMap2441.ipaParent = "æŋ"
        newColorMap2441.color = "darkGrey"
        
        let newColorMap2442 = ColorMap()
        newColorMap2442.LetterComboParent = "and"
        newColorMap2442.ipaParent = "æŋ"
        newColorMap2442.color = "lightGrey"
        
        newLetterCombo745.colorMapList.append(objectsIn: [newColorMap2440,newColorMap2441,newColorMap2442])
        newIPALetter13.letterCombos.append(objectsIn: [newLetterCombo745])
        //===================================
        let newLetterCombo82 = LetterCombo()
        newLetterCombo82.letterCombo = "an"
        newLetterCombo82.ipaParent = "æŋ"
        
        let newColorMap157 = ColorMap()
        newColorMap157.LetterComboParent = "an"
        newColorMap157.ipaParent = "æŋ"
        newColorMap157.color = "pink"
        
        let newColorMap158 = ColorMap()
        newColorMap158.LetterComboParent = "an"
        newColorMap158.ipaParent = "æŋ"
        newColorMap158.color = "darkGrey"
        
        newLetterCombo82.colorMapList.append(objectsIn: [newColorMap157,newColorMap158])
        newIPALetter13.letterCombos.append(objectsIn: [newLetterCombo82])
        
        // =========================================
        // MARK: - "aɪ"
        // =========================================
        let newIPALetter14 = IPALetter()
        newIPALetter14.ipaLetter = "aɪ"
        
        //===================================
        let newLetterCombo83 = LetterCombo()
        newLetterCombo83.letterCombo = "eigh"
        newLetterCombo83.ipaParent = "aɪ"
        
        let newColorMap159 = ColorMap()
        newColorMap159.LetterComboParent = "eigh"
        newColorMap159.ipaParent = "aɪ"
        newColorMap159.color = "darkBlue"
        
        let newColorMap160 = ColorMap()
        newColorMap160.LetterComboParent = "eigh"
        newColorMap160.ipaParent = "aɪ"
        newColorMap160.color = "darkBlue"
        
        let newColorMap161 = ColorMap()
        newColorMap161.LetterComboParent = "eigh"
        newColorMap161.ipaParent = "aɪ"
        newColorMap161.color = "lightGrey"
        
        let newColorMap162 = ColorMap()
        newColorMap162.LetterComboParent = "eigh"
        newColorMap162.ipaParent = "aɪ"
        newColorMap162.color = "lightGrey"
        
        newLetterCombo83.colorMapList.append(objectsIn: [newColorMap159,newColorMap160,newColorMap161,newColorMap162])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo83])
        //===================================
        let newLetterCombo84 = LetterCombo()
        newLetterCombo84.letterCombo = "eye"
        newLetterCombo84.ipaParent = "aɪ"
        
        let newColorMap163 = ColorMap()
        newColorMap163.LetterComboParent = "eye"
        newColorMap163.ipaParent = "aɪ"
        newColorMap163.color = "darkBlue"
        
        let newColorMap164 = ColorMap()
        newColorMap164.LetterComboParent = "eye"
        newColorMap164.ipaParent = "aɪ"
        newColorMap164.color = "darkBlue"
        
        let newColorMap165 = ColorMap()
        newColorMap165.LetterComboParent = "eye"
        newColorMap165.ipaParent = "aɪ"
        newColorMap165.color = "darkBlue"
        
        newLetterCombo84.colorMapList.append(objectsIn: [newColorMap163,newColorMap164,newColorMap165])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo84])
        //===================================
        let newLetterCombo85 = LetterCombo()
        newLetterCombo85.letterCombo = "igh"
        newLetterCombo85.ipaParent = "aɪ"
        
        let newColorMap166 = ColorMap()
        newColorMap166.LetterComboParent = "igh"
        newColorMap166.ipaParent = "aɪ"
        newColorMap166.color = "darkBlue"
        
        let newColorMap167 = ColorMap()
        newColorMap167.LetterComboParent = "igh"
        newColorMap167.ipaParent = "aɪ"
        newColorMap167.color = "lightGrey"
        
        let newColorMap168 = ColorMap()
        newColorMap168.LetterComboParent = "igh"
        newColorMap168.ipaParent = "aɪ"
        newColorMap168.color = "lightGrey"
        
        newLetterCombo85.colorMapList.append(objectsIn: [newColorMap166,newColorMap167,newColorMap168])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo85])
        //===================================
        let newLetterCombo86 = LetterCombo()
        newLetterCombo86.letterCombo = "ais"
        newLetterCombo86.ipaParent = "aɪ"
        
        let newColorMap169 = ColorMap()
        newColorMap169.LetterComboParent = "ais"
        newColorMap169.ipaParent = "aɪ"
        newColorMap169.color = "darkBlue"
        
        let newColorMap170 = ColorMap()
        newColorMap170.LetterComboParent = "ais"
        newColorMap170.ipaParent = "aɪ"
        newColorMap170.color = "darkBlue"
        
        let newColorMap171 = ColorMap()
        newColorMap171.LetterComboParent = "ais"
        newColorMap171.ipaParent = "aɪ"
        newColorMap171.color = "lightGrey"
        
        newLetterCombo86.colorMapList.append(objectsIn: [newColorMap169,newColorMap170,newColorMap171])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo86])
        //===================================
        let newLetterCombo88 = LetterCombo()
        newLetterCombo88.letterCombo = "uy"
        newLetterCombo88.ipaParent = "aɪ"
        
        let newColorMap175 = ColorMap()
        newColorMap175.LetterComboParent = "uy"
        newColorMap175.ipaParent = "aɪ"
        newColorMap175.color = "darkBlue"
        
        let newColorMap176 = ColorMap()
        newColorMap176.LetterComboParent = "uy"
        newColorMap176.ipaParent = "aɪ"
        newColorMap176.color = "darkBlue"
        
        newLetterCombo88.colorMapList.append(objectsIn: [newColorMap175,newColorMap176])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo88])
        //===================================
        let newLetterCombo89 = LetterCombo()
        newLetterCombo89.letterCombo = "ye"
        newLetterCombo89.ipaParent = "aɪ"
        
        let newColorMap177 = ColorMap()
        newColorMap177.LetterComboParent = "ye"
        newColorMap177.ipaParent = "aɪ"
        newColorMap177.color = "darkBlue"
        
        let newColorMap178 = ColorMap()
        newColorMap178.LetterComboParent = "ye"
        newColorMap178.ipaParent = "aɪ"
        newColorMap178.color = "darkBlue"
        
        newLetterCombo89.colorMapList.append(objectsIn: [newColorMap177,newColorMap178])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo89])
        //===================================
        let newLetterCombo90 = LetterCombo()
        newLetterCombo90.letterCombo = "ui"
        newLetterCombo90.ipaParent = "aɪ"
        
        let newColorMap179 = ColorMap()
        newColorMap179.LetterComboParent = "ui"
        newColorMap179.ipaParent = "aɪ"
        newColorMap179.color = "darkBlue"
        
        let newColorMap180 = ColorMap()
        newColorMap180.LetterComboParent = "ui"
        newColorMap180.ipaParent = "aɪ"
        newColorMap180.color = "darkBlue"
        
        newLetterCombo90.colorMapList.append(objectsIn: [newColorMap179,newColorMap180])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo90])
        //===================================
        let newLetterCombo91 = LetterCombo()
        newLetterCombo91.letterCombo = "ai"
        newLetterCombo91.ipaParent = "aɪ"
        
        let newColorMap181 = ColorMap()
        newColorMap181.LetterComboParent = "ai"
        newColorMap181.ipaParent = "aɪ"
        newColorMap181.color = "darkBlue"
        
        let newColorMap182 = ColorMap()
        newColorMap182.LetterComboParent = "ai"
        newColorMap182.ipaParent = "aɪ"
        newColorMap182.color = "darkBlue"
        
        newLetterCombo91.colorMapList.append(objectsIn: [newColorMap181,newColorMap182])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo91])
        //===================================
        let newLetterCombo92 = LetterCombo()
        newLetterCombo92.letterCombo = "ay"
        newLetterCombo92.ipaParent = "aɪ"
        
        let newColorMap183 = ColorMap()
        newColorMap183.LetterComboParent = "ay"
        newColorMap183.ipaParent = "aɪ"
        newColorMap183.color = "darkBlue"
        
        let newColorMap184 = ColorMap()
        newColorMap184.LetterComboParent = "ay"
        newColorMap184.ipaParent = "aɪ"
        newColorMap184.color = "darkBlue"
        
        newLetterCombo92.colorMapList.append(objectsIn: [newColorMap183,newColorMap184])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo92])
        //===================================
        let newLetterCombo93 = LetterCombo()
        newLetterCombo93.letterCombo = "ei"
        newLetterCombo93.ipaParent = "aɪ"
        
        let newColorMap185 = ColorMap()
        newColorMap185.LetterComboParent = "ei"
        newColorMap185.ipaParent = "aɪ"
        newColorMap185.color = "darkBlue"
        
        let newColorMap186 = ColorMap()
        newColorMap186.LetterComboParent = "ei"
        newColorMap186.ipaParent = "aɪ"
        newColorMap186.color = "darkBlue"
        
        newLetterCombo93.colorMapList.append(objectsIn: [newColorMap185,newColorMap186])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo93])
        //===================================
        let newLetterCombo94 = LetterCombo()
        newLetterCombo94.letterCombo = "ey"
        newLetterCombo94.ipaParent = "aɪ"
        
        let newColorMap187 = ColorMap()
        newColorMap187.LetterComboParent = "ey"
        newColorMap187.ipaParent = "aɪ"
        newColorMap187.color = "darkBlue"
        
        let newColorMap188 = ColorMap()
        newColorMap188.LetterComboParent = "ey"
        newColorMap188.ipaParent = "aɪ"
        newColorMap188.color = "darkBlue"
        
        newLetterCombo94.colorMapList.append(objectsIn: [newColorMap187,newColorMap188])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo94])
        //===================================
        let newLetterCombo99 = LetterCombo()
        newLetterCombo99.letterCombo = "ia"
        newLetterCombo99.ipaParent = "aɪ"
        
        let newColorMap197 = ColorMap()
        newColorMap197.LetterComboParent = "ia"
        newColorMap197.ipaParent = "aɪ"
        newColorMap197.color = "darkBlue"
        
        let newColorMap198 = ColorMap()
        newColorMap198.LetterComboParent = "ia"
        newColorMap198.ipaParent = "aɪ"
        newColorMap198.color = "darkBlue"
        
        newLetterCombo99.colorMapList.append(objectsIn: [newColorMap197,newColorMap198])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo99])
        //===================================
        let newLetterCombo96 = LetterCombo()
        newLetterCombo96.letterCombo = "ie"
        newLetterCombo96.ipaParent = "aɪ"
        
        let newColorMap191 = ColorMap()
        newColorMap191.LetterComboParent = "ie"
        newColorMap191.ipaParent = "aɪ"
        newColorMap191.color = "darkBlue"
        
        let newColorMap192 = ColorMap()
        newColorMap192.LetterComboParent = "ie"
        newColorMap192.ipaParent = "aɪ"
        newColorMap192.color = "darkBlue"
        
        newLetterCombo96.colorMapList.append(objectsIn: [newColorMap191,newColorMap192])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo96])
        //===================================
        let newLetterCombo97 = LetterCombo()
        newLetterCombo97.letterCombo = "is"
        newLetterCombo97.ipaParent = "aɪ"
        
        let newColorMap193 = ColorMap()
        newColorMap193.LetterComboParent = "is"
        newColorMap193.ipaParent = "aɪ"
        newColorMap193.color = "darkBlue"
        
        let newColorMap194 = ColorMap()
        newColorMap194.LetterComboParent = "is"
        newColorMap194.ipaParent = "aɪ"
        newColorMap194.color = "lightGrey"
        
        newLetterCombo97.colorMapList.append(objectsIn: [newColorMap193,newColorMap194])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo97])
        //===================================
        let newLetterCombo98 = LetterCombo()
        newLetterCombo98.letterCombo = "oy"
        newLetterCombo98.ipaParent = "aɪ"
        
        let newColorMap195 = ColorMap()
        newColorMap195.LetterComboParent = "oy"
        newColorMap195.ipaParent = "aɪ"
        newColorMap195.color = "darkBlue"
        
        let newColorMap196 = ColorMap()
        newColorMap196.LetterComboParent = "oy"
        newColorMap196.ipaParent = "aɪ"
        newColorMap196.color = "darkBlue"
        
        newLetterCombo98.colorMapList.append(objectsIn: [newColorMap195,newColorMap196])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo98])
        //===================================
        let newLetterCombo722 = LetterCombo()
        newLetterCombo722.letterCombo = "ih"
        newLetterCombo722.ipaParent = "aɪ"
        
        let newColorMap2392 = ColorMap()
        newColorMap2392.LetterComboParent = "ih"
        newColorMap2392.ipaParent = "aɪ"
        newColorMap2392.color = "darkBlue"
        
        let newColorMap2393 = ColorMap()
        newColorMap2393.LetterComboParent = "ih"
        newColorMap2393.ipaParent = "aɪ"
        newColorMap2393.color = "lightGrey"
        
        newLetterCombo722.colorMapList.append(objectsIn: [newColorMap2392,newColorMap2393])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo722])
        //===================================
        
        let newLetterCombo100 = LetterCombo()
        newLetterCombo100.letterCombo = "y"
        newLetterCombo100.ipaParent = "aɪ"
        
        let newColorMap199 = ColorMap()
        newColorMap199.LetterComboParent = "y"
        newColorMap199.ipaParent = "aɪ"
        newColorMap199.color = "darkBlue"
        
        newLetterCombo100.colorMapList.append(objectsIn: [newColorMap199])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo100])
        //===================================
        let newLetterCombo101 = LetterCombo()
        newLetterCombo101.letterCombo = "i"
        newLetterCombo101.ipaParent = "aɪ"
        
        let newColorMap200 = ColorMap()
        newColorMap200.LetterComboParent = "i"
        newColorMap200.ipaParent = "aɪ"
        newColorMap200.color = "darkBlue"
        
        newLetterCombo101.colorMapList.append(objectsIn: [newColorMap200])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo101])
        //===================================
        let newLetterCombo581 = LetterCombo()
        newLetterCombo581.letterCombo = "u"
        newLetterCombo581.ipaParent = "aɪ"
        
        let newColorMap2058 = ColorMap()
        newColorMap2058.LetterComboParent = "u"
        newColorMap2058.ipaParent = "aɪ"
        newColorMap2058.color = "darkBlue"
        
        newLetterCombo581.colorMapList.append(objectsIn: [newColorMap2058])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo581])
        //===================================
        let newLetterCombo582 = LetterCombo()
        newLetterCombo582.letterCombo = "a"
        newLetterCombo582.ipaParent = "aɪ"
        
        let newColorMap2059 = ColorMap()
        newColorMap2059.LetterComboParent = "a"
        newColorMap2059.ipaParent = "aɪ"
        newColorMap2059.color = "darkBlue"
        
        newLetterCombo582.colorMapList.append(objectsIn: [newColorMap2059])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo582])
        //===================================
        let newLetterCombo583 = LetterCombo()
        newLetterCombo583.letterCombo = "o"
        newLetterCombo583.ipaParent = "aɪ"
        
        let newColorMap2060 = ColorMap()
        newColorMap2060.LetterComboParent = "o"
        newColorMap2060.ipaParent = "aɪ"
        newColorMap2060.color = "darkBlue"
        
        newLetterCombo583.colorMapList.append(objectsIn: [newColorMap2060])
        newIPALetter14.letterCombos.append(objectsIn: [newLetterCombo583])
        
        // =========================================
        // MARK: - "aʊ"
        // =========================================
        let newIPALetter15 = IPALetter()
        newIPALetter15.ipaLetter = "aʊ"
        
        //===================================
        let newLetterCombo102 = LetterCombo()
        newLetterCombo102.letterCombo = "ough"
        newLetterCombo102.ipaParent = "aʊ"
        
        let newColorMap201 = ColorMap()
        newColorMap201.LetterComboParent = "ough"
        newColorMap201.ipaParent = "aʊ"
        newColorMap201.color = "blue"
        
        let newColorMap202 = ColorMap()
        newColorMap202.LetterComboParent = "ough"
        newColorMap202.ipaParent = "aʊ"
        newColorMap202.color = "blue"
        
        let newColorMap203 = ColorMap()
        newColorMap203.LetterComboParent = "ough"
        newColorMap203.ipaParent = "aʊ"
        newColorMap203.color = "lightGrey"
        
        let newColorMap204 = ColorMap()
        newColorMap204.LetterComboParent = "ough"
        newColorMap204.ipaParent = "aʊ"
        newColorMap204.color = "lightGrey"
        
        newLetterCombo102.colorMapList.append(objectsIn: [newColorMap201,newColorMap202,newColorMap203,newColorMap204])
        newIPALetter15.letterCombos.append(objectsIn: [newLetterCombo102])
        //===================================
        let newLetterCombo103 = LetterCombo()
        newLetterCombo103.letterCombo = "hou"
        newLetterCombo103.ipaParent = "aʊ"
        
        let newColorMap205 = ColorMap()
        newColorMap205.LetterComboParent = "hou"
        newColorMap205.ipaParent = "aʊ"
        newColorMap205.color = "lightGrey"
        
        let newColorMap206 = ColorMap()
        newColorMap206.LetterComboParent = "hou"
        newColorMap206.ipaParent = "aʊ"
        newColorMap206.color = "blue"
        
        let newColorMap207 = ColorMap()
        newColorMap207.LetterComboParent = "hou"
        newColorMap207.ipaParent = "aʊ"
        newColorMap207.color = "blue"
        
        newLetterCombo103.colorMapList.append(objectsIn: [newColorMap205,newColorMap206,newColorMap207])
        newIPALetter15.letterCombos.append(objectsIn: [newLetterCombo103])
        //===================================
        let newLetterCombo104 = LetterCombo()
        newLetterCombo104.letterCombo = "ou"
        newLetterCombo104.ipaParent = "aʊ"
        
        let newColorMap208 = ColorMap()
        newColorMap208.LetterComboParent = "ou"
        newColorMap208.ipaParent = "aʊ"
        newColorMap208.color = "blue"
        
        let newColorMap209 = ColorMap()
        newColorMap209.LetterComboParent = "ou"
        newColorMap209.ipaParent = "aʊ"
        newColorMap209.color = "blue"
        
        newLetterCombo104.colorMapList.append(objectsIn: [newColorMap208,newColorMap209])
        newIPALetter15.letterCombos.append(objectsIn: [newLetterCombo104])
        //===================================
        let newLetterCombo105 = LetterCombo()
        newLetterCombo105.letterCombo = "ow"
        newLetterCombo105.ipaParent = "aʊ"
        
        let newColorMap210 = ColorMap()
        newColorMap210.LetterComboParent = "ow"
        newColorMap210.ipaParent = "aʊ"
        newColorMap210.color = "blue"
        
        let newColorMap211 = ColorMap()
        newColorMap211.LetterComboParent = "ow"
        newColorMap211.ipaParent = "aʊ"
        newColorMap211.color = "lightGrey"
        
        newLetterCombo105.colorMapList.append(objectsIn: [newColorMap210,newColorMap211])
        newIPALetter15.letterCombos.append(objectsIn: [newLetterCombo105])
        //===================================
        let newLetterCombo106 = LetterCombo()
        newLetterCombo106.letterCombo = "ao"
        newLetterCombo106.ipaParent = "aʊ"
        
        let newColorMap212 = ColorMap()
        newColorMap212.LetterComboParent = "ao"
        newColorMap212.ipaParent = "aʊ"
        newColorMap212.color = "blue"
        
        let newColorMap213 = ColorMap()
        newColorMap213.LetterComboParent = "ao"
        newColorMap213.ipaParent = "aʊ"
        newColorMap213.color = "blue"
        
        newLetterCombo106.colorMapList.append(objectsIn: [newColorMap212,newColorMap213])
        newIPALetter15.letterCombos.append(objectsIn: [newLetterCombo106])
        //===================================
        let newLetterCombo107 = LetterCombo()
        newLetterCombo107.letterCombo = "au"
        newLetterCombo107.ipaParent = "aʊ"
        
        let newColorMap214 = ColorMap()
        newColorMap214.LetterComboParent = "au"
        newColorMap214.ipaParent = "aʊ"
        newColorMap214.color = "blue"
        
        let newColorMap215 = ColorMap()
        newColorMap215.LetterComboParent = "au"
        newColorMap215.ipaParent = "aʊ"
        newColorMap215.color = "blue"
        
        newLetterCombo107.colorMapList.append(objectsIn: [newColorMap214,newColorMap215])
        newIPALetter15.letterCombos.append(objectsIn: [newLetterCombo107])
        
        // =========================================
        // MARK: - "ɑr"
        // =========================================
        let newIPALetter16 = IPALetter()
        newIPALetter16.ipaLetter = "ɑr"
        
        //===================================
        let newLetterCombo108 = LetterCombo()
        newLetterCombo108.letterCombo = "arre"
        newLetterCombo108.ipaParent = "ɑr"
        
        let newColorMap216 = ColorMap()
        newColorMap216.LetterComboParent = "arre"
        newColorMap216.ipaParent = "ɑr"
        newColorMap216.color = "green"
        
        let newColorMap217 = ColorMap()
        newColorMap217.LetterComboParent = "arre"
        newColorMap217.ipaParent = "ɑr"
        newColorMap217.color = "darkGrey"
        
        let newColorMap218 = ColorMap()
        newColorMap218.LetterComboParent = "arre"
        newColorMap218.ipaParent = "ɑr"
        newColorMap218.color = "darkGrey"
        
        let newColorMap219 = ColorMap()
        newColorMap219.LetterComboParent = "arre"
        newColorMap219.ipaParent = "ɑr"
        newColorMap219.color = "lightGrey"
        
        newLetterCombo108.colorMapList.append(objectsIn: [newColorMap216,newColorMap217,newColorMap218,newColorMap219])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo108])
        //===================================
        let newLetterCombo109 = LetterCombo()
        newLetterCombo109.letterCombo = "ear"
        newLetterCombo109.ipaParent = "ɑr"
        
        let newColorMap220 = ColorMap()
        newColorMap220.LetterComboParent = "ear"
        newColorMap220.ipaParent = "ɑr"
        newColorMap220.color = "green"
        
        let newColorMap221 = ColorMap()
        newColorMap221.LetterComboParent = "ear"
        newColorMap221.ipaParent = "ɑr"
        newColorMap221.color = "green"
        
        let newColorMap222 = ColorMap()
        newColorMap222.LetterComboParent = "ear"
        newColorMap222.ipaParent = "ɑr"
        newColorMap222.color = "darkGrey"
        
        newLetterCombo109.colorMapList.append(objectsIn: [newColorMap220,newColorMap221,newColorMap222])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo109])
        //===================================
        let newLetterCombo110 = LetterCombo()
        newLetterCombo110.letterCombo = "orr"
        newLetterCombo110.ipaParent = "ɑr"
        
        let newColorMap223 = ColorMap()
        newColorMap223.LetterComboParent = "orr"
        newColorMap223.ipaParent = "ɑr"
        newColorMap223.color = "green"
        
        let newColorMap224 = ColorMap()
        newColorMap224.LetterComboParent = "orr"
        newColorMap224.ipaParent = "ɑr"
        newColorMap224.color = "darkGrey"
        
        let newColorMap225 = ColorMap()
        newColorMap225.LetterComboParent = "orr"
        newColorMap225.ipaParent = "ɑr"
        newColorMap225.color = "darkGrey"
        
        newLetterCombo110.colorMapList.append(objectsIn: [newColorMap223,newColorMap224,newColorMap225])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo110])
        //===================================
        let newLetterCombo111 = LetterCombo()
        newLetterCombo111.letterCombo = "uar"
        newLetterCombo111.ipaParent = "ɑr"
        
        let newColorMap226 = ColorMap()
        newColorMap226.LetterComboParent = "uar"
        newColorMap226.ipaParent = "ɑr"
        newColorMap226.color = "green"
        
        let newColorMap227 = ColorMap()
        newColorMap227.LetterComboParent = "uar"
        newColorMap227.ipaParent = "ɑr"
        newColorMap227.color = "green"
        
        let newColorMap228 = ColorMap()
        newColorMap228.LetterComboParent = "uar"
        newColorMap228.ipaParent = "ɑr"
        newColorMap228.color = "darkGrey"
        
        newLetterCombo111.colorMapList.append(objectsIn: [newColorMap226,newColorMap227,newColorMap228])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo111])
        //===================================
        let newLetterCombo112 = LetterCombo()
        newLetterCombo112.letterCombo = "arr"
        newLetterCombo112.ipaParent = "ɑr"
        
        let newColorMap229 = ColorMap()
        newColorMap229.LetterComboParent = "arr"
        newColorMap229.ipaParent = "ɑr"
        newColorMap229.color = "green"
        
        let newColorMap230 = ColorMap()
        newColorMap230.LetterComboParent = "arr"
        newColorMap230.ipaParent = "ɑr"
        newColorMap230.color = "darkGrey"
        
        let newColorMap231 = ColorMap()
        newColorMap231.LetterComboParent = "arr"
        newColorMap231.ipaParent = "ɑr"
        newColorMap231.color = "darkGrey"
        
        newLetterCombo112.colorMapList.append(objectsIn: [newColorMap229,newColorMap230,newColorMap231])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo112])
        //===================================
        let newLetterCombo113 = LetterCombo()
        newLetterCombo113.letterCombo = "are"
        newLetterCombo113.ipaParent = "ɑr"
        
        let newColorMap232 = ColorMap()
        newColorMap232.LetterComboParent = "are"
        newColorMap232.ipaParent = "ɑr"
        newColorMap232.color = "green"
        
        let newColorMap233 = ColorMap()
        newColorMap233.LetterComboParent = "are"
        newColorMap233.ipaParent = "ɑr"
        newColorMap233.color = "darkGrey"
        
        let newColorMap234 = ColorMap()
        newColorMap234.LetterComboParent = "are"
        newColorMap234.ipaParent = "ɑr"
        newColorMap234.color = "lightGrey"
        
        newLetterCombo113.colorMapList.append(objectsIn: [newColorMap232,newColorMap233,newColorMap234])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo113])
        //===================================
        let newLetterCombo114 = LetterCombo()
        newLetterCombo114.letterCombo = "aar"
        newLetterCombo114.ipaParent = "ɑr"
        
        let newColorMap235 = ColorMap()
        newColorMap235.LetterComboParent = "aar"
        newColorMap235.ipaParent = "ɑr"
        newColorMap235.color = "green"
        
        let newColorMap236 = ColorMap()
        newColorMap236.LetterComboParent = "aar"
        newColorMap236.ipaParent = "ɑr"
        newColorMap236.color = "green"
        
        let newColorMap237 = ColorMap()
        newColorMap237.LetterComboParent = "aar"
        newColorMap237.ipaParent = "ɑr"
        newColorMap237.color = "darkGrey"
        
        newLetterCombo114.colorMapList.append(objectsIn: [newColorMap235,newColorMap236,newColorMap237])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo114])
        //===================================
        let newLetterCombo115 = LetterCombo()
        newLetterCombo115.letterCombo = "ar"
        newLetterCombo115.ipaParent = "ɑr"
        
        let newColorMap238 = ColorMap()
        newColorMap238.LetterComboParent = "ar"
        newColorMap238.ipaParent = "ɑr"
        newColorMap238.color = "green"
        
        let newColorMap239 = ColorMap()
        newColorMap239.LetterComboParent = "ar"
        newColorMap239.ipaParent = "ɑr"
        newColorMap239.color = "darkGrey"
        
        newLetterCombo115.colorMapList.append(objectsIn: [newColorMap238,newColorMap239])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo115])
        //===================================
        let newLetterCombo116 = LetterCombo()
        newLetterCombo116.letterCombo = "er"
        newLetterCombo116.ipaParent = "ɑr"
        
        let newColorMap240 = ColorMap()
        newColorMap240.LetterComboParent = "er"
        newColorMap240.ipaParent = "ɑr"
        newColorMap240.color = "green"
        
        let newColorMap241 = ColorMap()
        newColorMap241.LetterComboParent = "er"
        newColorMap241.ipaParent = "ɑr"
        newColorMap241.color = "darkGrey"
        
        newLetterCombo116.colorMapList.append(objectsIn: [newColorMap240,newColorMap241])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo116])
        //===================================
        let newLetterCombo584 = LetterCombo()
        newLetterCombo584.letterCombo = "ir"
        newLetterCombo584.ipaParent = "ɑr"
        
        let newColorMap2061 = ColorMap()
        newColorMap2061.LetterComboParent = "ir"
        newColorMap2061.ipaParent = "ɑr"
        newColorMap2061.color = "green"
        
        let newColorMap2062 = ColorMap()
        newColorMap2062.LetterComboParent = "ir"
        newColorMap2062.ipaParent = "ɑr"
        newColorMap2062.color = "darkGrey"
        
        newLetterCombo584.colorMapList.append(objectsIn: [newColorMap2061,newColorMap2062])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo584])
        //===================================
        let newLetterCombo585 = LetterCombo()
        newLetterCombo585.letterCombo = "or"
        newLetterCombo585.ipaParent = "ɑr"
        
        let newColorMap2063 = ColorMap()
        newColorMap2063.LetterComboParent = "or"
        newColorMap2063.ipaParent = "ɑr"
        newColorMap2063.color = "green"
        
        let newColorMap2064 = ColorMap()
        newColorMap2064.LetterComboParent = "or"
        newColorMap2064.ipaParent = "ɑr"
        newColorMap2064.color = "darkGrey"
        
        newLetterCombo585.colorMapList.append(objectsIn: [newColorMap2063,newColorMap2064])
        newIPALetter16.letterCombos.append(objectsIn: [newLetterCombo585])
        
        // =========================================
        // MARK: - "dʒ"
        // =========================================
        let newIPALetter17 = IPALetter()
        newIPALetter17.ipaLetter = "dʒ"
        
        //===================================
        let newLetterCombo117 = LetterCombo()
        newLetterCombo117.letterCombo = "dge"
        newLetterCombo117.ipaParent = "dʒ"
        
        let newColorMap242 = ColorMap()
        newColorMap242.LetterComboParent = "dge"
        newColorMap242.ipaParent = "dʒ"
        newColorMap242.color = "brownYellow"
        
        let newColorMap243 = ColorMap()
        newColorMap243.LetterComboParent = "dge"
        newColorMap243.ipaParent = "dʒ"
        newColorMap243.color = "brownYellow"
        
        let newColorMap244 = ColorMap()
        newColorMap244.LetterComboParent = "dge"
        newColorMap244.ipaParent = "dʒ"
        newColorMap244.color = "lightGrey"
        
        newLetterCombo117.colorMapList.append(objectsIn: [newColorMap242,newColorMap243,newColorMap244])
        newIPALetter17.letterCombos.append(objectsIn: [newLetterCombo117])
        //===================================
        let newLetterCombo118 = LetterCombo()
        newLetterCombo118.letterCombo = "gg"
        newLetterCombo118.ipaParent = "dʒ"
        
        let newColorMap245 = ColorMap()
        newColorMap245.LetterComboParent = "gg"
        newColorMap245.ipaParent = "dʒ"
        newColorMap245.color = "brownYellow"
        
        let newColorMap246 = ColorMap()
        newColorMap246.LetterComboParent = "gg"
        newColorMap246.ipaParent = "dʒ"
        newColorMap246.color = "brownYellow"
        
        newLetterCombo118.colorMapList.append(objectsIn: [newColorMap245,newColorMap246])
        newIPALetter17.letterCombos.append(objectsIn: [newLetterCombo118])
        //===================================
        let newLetterCombo119 = LetterCombo()
        newLetterCombo119.letterCombo = "dg"
        newLetterCombo119.ipaParent = "dʒ"
        
        let newColorMap247 = ColorMap()
        newColorMap247.LetterComboParent = "dg"
        newColorMap247.ipaParent = "dʒ"
        newColorMap247.color = "brownYellow"
        
        let newColorMap248 = ColorMap()
        newColorMap248.LetterComboParent = "dg"
        newColorMap248.ipaParent = "dʒ"
        newColorMap248.color = "brownYellow"
        
        newLetterCombo119.colorMapList.append(objectsIn: [newColorMap247,newColorMap248])
        newIPALetter17.letterCombos.append(objectsIn: [newLetterCombo119])
        //===================================
        let newLetterCombo120 = LetterCombo()
        newLetterCombo120.letterCombo = "ge"
        newLetterCombo120.ipaParent = "dʒ"
        
        let newColorMap249 = ColorMap()
        newColorMap249.LetterComboParent = "ge"
        newColorMap249.ipaParent = "dʒ"
        newColorMap249.color = "brownYellow"
        
        let newColorMap250 = ColorMap()
        newColorMap250.LetterComboParent = "ge"
        newColorMap250.ipaParent = "dʒ"
        newColorMap250.color = "lightGrey"
        
        newLetterCombo120.colorMapList.append(objectsIn: [newColorMap249,newColorMap250])
        newIPALetter17.letterCombos.append(objectsIn: [newLetterCombo120])
        //===================================
        let newLetterCombo123 = LetterCombo()
        newLetterCombo123.letterCombo = "dj"
        newLetterCombo123.ipaParent = "dʒ"
        
        let newColorMap255 = ColorMap()
        newColorMap255.LetterComboParent = "dj"
        newColorMap255.ipaParent = "dʒ"
        newColorMap255.color = "brownYellow"
        
        let newColorMap256 = ColorMap()
        newColorMap256.LetterComboParent = "dj"
        newColorMap256.ipaParent = "dʒ"
        newColorMap256.color = "brownYellow"
        
        newLetterCombo123.colorMapList.append(objectsIn: [newColorMap255,newColorMap256])
        newIPALetter17.letterCombos.append(objectsIn: [newLetterCombo123])
        //===================================
        let newLetterCombo125 = LetterCombo()
        newLetterCombo125.letterCombo = "d"
        newLetterCombo125.ipaParent = "dʒ"
        
        let newColorMap259 = ColorMap()
        newColorMap259.LetterComboParent = "d"
        newColorMap259.ipaParent = "dʒ"
        newColorMap259.color = "brownYellow"
        
        newLetterCombo125.colorMapList.append(objectsIn: [newColorMap259])
        newIPALetter17.letterCombos.append(objectsIn: [newLetterCombo125])
        //===================================
        let newLetterCombo126 = LetterCombo()
        newLetterCombo126.letterCombo = "j"
        newLetterCombo126.ipaParent = "dʒ"
        
        let newColorMap260 = ColorMap()
        newColorMap260.LetterComboParent = "j"
        newColorMap260.ipaParent = "dʒ"
        newColorMap260.color = "brownYellow"
        
        newLetterCombo126.colorMapList.append(objectsIn: [newColorMap260])
        newIPALetter17.letterCombos.append(objectsIn: [newLetterCombo126])
        //===================================
        let newLetterCombo127 = LetterCombo()
        newLetterCombo127.letterCombo = "g"
        newLetterCombo127.ipaParent = "dʒ"
        
        let newColorMap261 = ColorMap()
        newColorMap261.LetterComboParent = "g"
        newColorMap261.ipaParent = "dʒ"
        newColorMap261.color = "brownYellow"
        
        newLetterCombo127.colorMapList.append(objectsIn: [newColorMap261])
        newIPALetter17.letterCombos.append(objectsIn: [newLetterCombo127])
        //===================================
        let newLetterCombo586 = LetterCombo()
        newLetterCombo586.letterCombo = "t"
        newLetterCombo586.ipaParent = "dʒ"
        
        let newColorMap2065 = ColorMap()
        newColorMap2065.LetterComboParent = "t"
        newColorMap2065.ipaParent = "dʒ"
        newColorMap2065.color = "brownYellow"
        
        newLetterCombo586.colorMapList.append(objectsIn: [newColorMap2065])
        newIPALetter17.letterCombos.append(objectsIn: [newLetterCombo586])
        
        // =========================================
        // MARK: - "eɪ"
        // =========================================
        let newIPALetter18 = IPALetter()
        newIPALetter18.ipaLetter = "eɪ"
        
        //===================================
        let newLetterCombo128 = LetterCombo()
        newLetterCombo128.letterCombo = "eigh"
        newLetterCombo128.ipaParent = "eɪ"
        
        let newColorMap262 = ColorMap()
        newColorMap262.LetterComboParent = "eigh"
        newColorMap262.ipaParent = "eɪ"
        newColorMap262.color = "pink"
        
        let newColorMap263 = ColorMap()
        newColorMap263.LetterComboParent = "eigh"
        newColorMap263.ipaParent = "eɪ"
        newColorMap263.color = "pink"
        
        let newColorMap264 = ColorMap()
        newColorMap264.LetterComboParent = "eigh"
        newColorMap264.ipaParent = "eɪ"
        newColorMap264.color = "lightGrey"
        
        let newColorMap265 = ColorMap()
        newColorMap265.LetterComboParent = "eigh"
        newColorMap265.ipaParent = "eɪ"
        newColorMap265.color = "lightGrey"
        
        newLetterCombo128.colorMapList.append(objectsIn: [newColorMap262,newColorMap263,newColorMap264,newColorMap265])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo128])
        //===================================
        let newLetterCombo129 = LetterCombo()
        newLetterCombo129.letterCombo = "aigh"
        newLetterCombo129.ipaParent = "eɪ"
        
        let newColorMap266 = ColorMap()
        newColorMap266.LetterComboParent = "aigh"
        newColorMap266.ipaParent = "eɪ"
        newColorMap266.color = "pink"
        
        let newColorMap267 = ColorMap()
        newColorMap267.LetterComboParent = "aigh"
        newColorMap267.ipaParent = "eɪ"
        newColorMap267.color = "pink"
        
        let newColorMap268 = ColorMap()
        newColorMap268.LetterComboParent = "aigh"
        newColorMap268.ipaParent = "eɪ"
        newColorMap268.color = "lightGrey"
        
        let newColorMap269 = ColorMap()
        newColorMap269.LetterComboParent = "aigh"
        newColorMap269.ipaParent = "eɪ"
        newColorMap269.color = "lightGrey"
        
        newLetterCombo129.colorMapList.append(objectsIn: [newColorMap266,newColorMap267,newColorMap268,newColorMap269])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo129])
        //===================================
        let newLetterCombo130 = LetterCombo()
        newLetterCombo130.letterCombo = "uet"
        newLetterCombo130.ipaParent = "eɪ"
        
        let newColorMap270 = ColorMap()
        newColorMap270.LetterComboParent = "uet"
        newColorMap270.ipaParent = "eɪ"
        newColorMap270.color = "pink"
        
        let newColorMap271 = ColorMap()
        newColorMap271.LetterComboParent = "uet"
        newColorMap271.ipaParent = "eɪ"
        newColorMap271.color = "pink"
        
        let newColorMap272 = ColorMap()
        newColorMap272.LetterComboParent = "uet"
        newColorMap272.ipaParent = "eɪ"
        newColorMap272.color = "lightGrey"
        
        newLetterCombo130.colorMapList.append(objectsIn: [newColorMap270,newColorMap271,newColorMap272])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo130])
        //===================================
        let newLetterCombo131 = LetterCombo()
        newLetterCombo131.letterCombo = "ay"
        newLetterCombo131.ipaParent = "eɪ"
        
        let newColorMap273 = ColorMap()
        newColorMap273.LetterComboParent = "ay"
        newColorMap273.ipaParent = "eɪ"
        newColorMap273.color = "pink"
        
        let newColorMap274 = ColorMap()
        newColorMap274.LetterComboParent = "ay"
        newColorMap274.ipaParent = "eɪ"
        newColorMap274.color = "pink"
        
        newLetterCombo131.colorMapList.append(objectsIn: [newColorMap273,newColorMap274])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo131])
        //===================================
        let newLetterCombo132 = LetterCombo()
        newLetterCombo132.letterCombo = "ai"
        newLetterCombo132.ipaParent = "eɪ"
        
        let newColorMap275 = ColorMap()
        newColorMap275.LetterComboParent = "ai"
        newColorMap275.ipaParent = "eɪ"
        newColorMap275.color = "pink"
        
        let newColorMap276 = ColorMap()
        newColorMap276.LetterComboParent = "ai"
        newColorMap276.ipaParent = "eɪ"
        newColorMap276.color = "pink"
        
        newLetterCombo132.colorMapList.append(objectsIn: [newColorMap275,newColorMap276])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo132])
        //===================================
        let newLetterCombo133 = LetterCombo()
        newLetterCombo133.letterCombo = "ie"
        newLetterCombo133.ipaParent = "eɪ"
        
        let newColorMap277 = ColorMap()
        newColorMap277.LetterComboParent = "ie"
        newColorMap277.ipaParent = "eɪ"
        newColorMap277.color = "pink"
        
        let newColorMap278 = ColorMap()
        newColorMap278.LetterComboParent = "ie"
        newColorMap278.ipaParent = "eɪ"
        newColorMap278.color = "pink"
        
        newLetterCombo133.colorMapList.append(objectsIn: [newColorMap277,newColorMap278])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo133])
        //===================================
        let newLetterCombo134 = LetterCombo()
        newLetterCombo134.letterCombo = "et"
        newLetterCombo134.ipaParent = "eɪ"
        
        let newColorMap279 = ColorMap()
        newColorMap279.LetterComboParent = "et"
        newColorMap279.ipaParent = "eɪ"
        newColorMap279.color = "pink"
        
        let newColorMap280 = ColorMap()
        newColorMap280.LetterComboParent = "et"
        newColorMap280.ipaParent = "eɪ"
        newColorMap280.color = "lightGrey"
        
        newLetterCombo134.colorMapList.append(objectsIn: [newColorMap279,newColorMap280])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo134])
        //===================================
        let newLetterCombo135 = LetterCombo()
        newLetterCombo135.letterCombo = "ea"
        newLetterCombo135.ipaParent = "eɪ"
        
        let newColorMap281 = ColorMap()
        newColorMap281.LetterComboParent = "ea"
        newColorMap281.ipaParent = "eɪ"
        newColorMap281.color = "pink"
        
        let newColorMap282 = ColorMap()
        newColorMap282.LetterComboParent = "ea"
        newColorMap282.ipaParent = "eɪ"
        newColorMap282.color = "pink"
        
        newLetterCombo135.colorMapList.append(objectsIn: [newColorMap281,newColorMap282])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo135])
        //===================================
        let newLetterCombo136 = LetterCombo()
        newLetterCombo136.letterCombo = "ae"
        newLetterCombo136.ipaParent = "eɪ"
        
        let newColorMap283 = ColorMap()
        newColorMap283.LetterComboParent = "ae"
        newColorMap283.ipaParent = "eɪ"
        newColorMap283.color = "pink"
        
        let newColorMap284 = ColorMap()
        newColorMap284.LetterComboParent = "ae"
        newColorMap284.ipaParent = "eɪ"
        newColorMap284.color = "pink"
        
        newLetterCombo136.colorMapList.append(objectsIn: [newColorMap283,newColorMap284])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo136])
        //===================================
        let newLetterCombo137 = LetterCombo()
        newLetterCombo137.letterCombo = "ei"
        newLetterCombo137.ipaParent = "eɪ"
        
        let newColorMap285 = ColorMap()
        newColorMap285.LetterComboParent = "ei"
        newColorMap285.ipaParent = "eɪ"
        newColorMap285.color = "pink"
        
        let newColorMap286 = ColorMap()
        newColorMap286.LetterComboParent = "ei"
        newColorMap286.ipaParent = "eɪ"
        newColorMap286.color = "pink"
        
        newLetterCombo137.colorMapList.append(objectsIn: [newColorMap285,newColorMap286])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo137])
        //===================================
        let newLetterCombo138 = LetterCombo()
        newLetterCombo138.letterCombo = "ey"
        newLetterCombo138.ipaParent = "eɪ"
        
        let newColorMap287 = ColorMap()
        newColorMap287.LetterComboParent = "ey"
        newColorMap287.ipaParent = "eɪ"
        newColorMap287.color = "pink"
        
        let newColorMap288 = ColorMap()
        newColorMap288.LetterComboParent = "ey"
        newColorMap288.ipaParent = "eɪ"
        newColorMap288.color = "pink"
        
        newLetterCombo138.colorMapList.append(objectsIn: [newColorMap287,newColorMap288])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo138])
        //===================================
        let newLetterCombo139 = LetterCombo()
        newLetterCombo139.letterCombo = "au"
        newLetterCombo139.ipaParent = "eɪ"
        
        let newColorMap289 = ColorMap()
        newColorMap289.LetterComboParent = "au"
        newColorMap289.ipaParent = "eɪ"
        newColorMap289.color = "pink"
        
        let newColorMap290 = ColorMap()
        newColorMap290.LetterComboParent = "au"
        newColorMap290.ipaParent = "eɪ"
        newColorMap290.color = "pink"
        
        newLetterCombo139.colorMapList.append(objectsIn: [newColorMap289,newColorMap290])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo139])
        //===================================
        let newLetterCombo140 = LetterCombo()
        newLetterCombo140.letterCombo = "a"
        newLetterCombo140.ipaParent = "eɪ"
        
        let newColorMap291 = ColorMap()
        newColorMap291.LetterComboParent = "a"
        newColorMap291.ipaParent = "eɪ"
        newColorMap291.color = "pink"
        
        newLetterCombo140.colorMapList.append(objectsIn: [newColorMap291])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo140])
        //===================================
        let newLetterCombo141 = LetterCombo()
        newLetterCombo141.letterCombo = "e"
        newLetterCombo141.ipaParent = "eɪ"
        
        let newColorMap292 = ColorMap()
        newColorMap292.LetterComboParent = "e"
        newColorMap292.ipaParent = "eɪ"
        newColorMap292.color = "pink"
        
        newLetterCombo141.colorMapList.append(objectsIn: [newColorMap292])
        newIPALetter18.letterCombos.append(objectsIn: [newLetterCombo141])
        
        // =========================================
        // MARK: - "əl"
        // =========================================
        let newIPALetter19 = IPALetter()
        newIPALetter19.ipaLetter = "əl"
        
        //===================================
        let newLetterCombo587 = LetterCombo()
        newLetterCombo587.letterCombo = "ou'll"
        newLetterCombo587.ipaParent = "əl"
        
        let newColorMap2066 = ColorMap()
        newColorMap2066.LetterComboParent = "ou'll"
        newColorMap2066.ipaParent = "əl"
        newColorMap2066.color = "lightGrey"
        
        let newColorMap2067 = ColorMap()
        newColorMap2067.LetterComboParent = "ou'll"
        newColorMap2067.ipaParent = "əl"
        newColorMap2067.color = "lightGrey"
        
        let newColorMap2068 = ColorMap()
        newColorMap2068.LetterComboParent = "ou'll"
        newColorMap2068.ipaParent = "əl"
        newColorMap2068.color = "lightGrey"
        
        let newColorMap2069 = ColorMap()
        newColorMap2069.LetterComboParent = "ou'll"
        newColorMap2069.ipaParent = "əl"
        newColorMap2069.color = "darkGrey"
        
        let newColorMap2070 = ColorMap()
        newColorMap2070.LetterComboParent = "ou'll"
        newColorMap2070.ipaParent = "əl"
        newColorMap2070.color = "darkGrey"
        
        newLetterCombo587.colorMapList.append(objectsIn: [newColorMap2066,newColorMap2067,newColorMap2068,newColorMap2069,newColorMap2070])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo587])
        //===================================
        let newLetterCombo143 = LetterCombo()
        newLetterCombo143.letterCombo = "ile"
        newLetterCombo143.ipaParent = "əl"
        
        let newColorMap298 = ColorMap()
        newColorMap298.LetterComboParent = "ile"
        newColorMap298.ipaParent = "əl"
        newColorMap298.color = "lightGrey"
        
        let newColorMap299 = ColorMap()
        newColorMap299.LetterComboParent = "ile"
        newColorMap299.ipaParent = "əl"
        newColorMap299.color = "darkGrey"
        
        let newColorMap300 = ColorMap()
        newColorMap300.LetterComboParent = "ile"
        newColorMap300.ipaParent = "əl"
        newColorMap300.color = "lightGrey"
        
        newLetterCombo143.colorMapList.append(objectsIn: [newColorMap298,newColorMap299,newColorMap300])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo143])
        //===================================
        let newLetterCombo144 = LetterCombo()
        newLetterCombo144.letterCombo = "ull"
        newLetterCombo144.ipaParent = "əl"
        
        let newColorMap301 = ColorMap()
        newColorMap301.LetterComboParent = "ull"
        newColorMap301.ipaParent = "əl"
        newColorMap301.color = "lightGrey"
        
        let newColorMap302 = ColorMap()
        newColorMap302.LetterComboParent = "ull"
        newColorMap302.ipaParent = "əl"
        newColorMap302.color = "darkGrey"
        
        let newColorMap303 = ColorMap()
        newColorMap303.LetterComboParent = "ull"
        newColorMap303.ipaParent = "əl"
        newColorMap303.color = "darkGrey"
        
        newLetterCombo144.colorMapList.append(objectsIn: [newColorMap301,newColorMap302,newColorMap303])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo144])
        //===================================
        let newLetterCombo145 = LetterCombo()
        newLetterCombo145.letterCombo = "all"
        newLetterCombo145.ipaParent = "əl"
        
        let newColorMap304 = ColorMap()
        newColorMap304.LetterComboParent = "all"
        newColorMap304.ipaParent = "əl"
        newColorMap304.color = "lightGrey"
        
        let newColorMap305 = ColorMap()
        newColorMap305.LetterComboParent = "all"
        newColorMap305.ipaParent = "əl"
        newColorMap305.color = "darkGrey"
        
        let newColorMap306 = ColorMap()
        newColorMap306.LetterComboParent = "all"
        newColorMap306.ipaParent = "əl"
        newColorMap306.color = "darkGrey"
        
        newLetterCombo145.colorMapList.append(objectsIn: [newColorMap304,newColorMap305,newColorMap306])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo145])
        //===================================
        let newLetterCombo588 = LetterCombo()
        newLetterCombo588.letterCombo = "ule"
        newLetterCombo588.ipaParent = "əl"
        
        let newColorMap2071 = ColorMap()
        newColorMap2071.LetterComboParent = "ule"
        newColorMap2071.ipaParent = "əl"
        newColorMap2071.color = "lightGrey"
        
        let newColorMap2072 = ColorMap()
        newColorMap2072.LetterComboParent = "ule"
        newColorMap2072.ipaParent = "əl"
        newColorMap2072.color = "darkGrey"
        
        let newColorMap2073 = ColorMap()
        newColorMap2073.LetterComboParent = "ule"
        newColorMap2073.ipaParent = "əl"
        newColorMap2073.color = "lightGrey"
        
        newLetterCombo588.colorMapList.append(objectsIn: [newColorMap2071,newColorMap2072,newColorMap2073])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo588])
        //===================================
        let newLetterCombo589 = LetterCombo()
        newLetterCombo589.letterCombo = "ial"
        newLetterCombo589.ipaParent = "əl"
        
        let newColorMap2074 = ColorMap()
        newColorMap2074.LetterComboParent = "ial"
        newColorMap2074.ipaParent = "əl"
        newColorMap2074.color = "lightGrey"
        
        let newColorMap2075 = ColorMap()
        newColorMap2075.LetterComboParent = "ial"
        newColorMap2075.ipaParent = "əl"
        newColorMap2075.color = "lightGrey"
        
        let newColorMap2076 = ColorMap()
        newColorMap2076.LetterComboParent = "ial"
        newColorMap2076.ipaParent = "əl"
        newColorMap2076.color = "darkGrey"
        
        newLetterCombo589.colorMapList.append(objectsIn: [newColorMap2074,newColorMap2075,newColorMap2076])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo589])
        //===================================
        let newLetterCombo590 = LetterCombo()
        newLetterCombo590.letterCombo = "ual"
        newLetterCombo590.ipaParent = "əl"
        
        let newColorMap2077 = ColorMap()
        newColorMap2077.LetterComboParent = "ual"
        newColorMap2077.ipaParent = "əl"
        newColorMap2077.color = "lightGrey"
        
        let newColorMap2078 = ColorMap()
        newColorMap2078.LetterComboParent = "ual"
        newColorMap2078.ipaParent = "əl"
        newColorMap2078.color = "lightGrey"
        
        let newColorMap2079 = ColorMap()
        newColorMap2079.LetterComboParent = "ual"
        newColorMap2079.ipaParent = "əl"
        newColorMap2079.color = "darkGrey"
        
        newLetterCombo590.colorMapList.append(objectsIn: [newColorMap2077,newColorMap2078,newColorMap2079])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo590])
        //===================================
        let newLetterCombo591 = LetterCombo()
        newLetterCombo591.letterCombo = "ole"
        newLetterCombo591.ipaParent = "əl"
        
        let newColorMap2080 = ColorMap()
        newColorMap2080.LetterComboParent = "ole"
        newColorMap2080.ipaParent = "əl"
        newColorMap2080.color = "lightGrey"
        
        let newColorMap2081 = ColorMap()
        newColorMap2081.LetterComboParent = "ole"
        newColorMap2081.ipaParent = "əl"
        newColorMap2081.color = "darkGrey"
        
        let newColorMap2082 = ColorMap()
        newColorMap2082.LetterComboParent = "ole"
        newColorMap2082.ipaParent = "əl"
        newColorMap2082.color = "lightGrey"
        
        newLetterCombo591.colorMapList.append(objectsIn: [newColorMap2080,newColorMap2081,newColorMap2082])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo591])
        //===================================
        let newLetterCombo592 = LetterCombo()
        newLetterCombo592.letterCombo = "oal"
        newLetterCombo592.ipaParent = "əl"
        
        let newColorMap2083 = ColorMap()
        newColorMap2083.LetterComboParent = "oal"
        newColorMap2083.ipaParent = "əl"
        newColorMap2083.color = "lightGrey"
        
        let newColorMap2084 = ColorMap()
        newColorMap2084.LetterComboParent = "oal"
        newColorMap2084.ipaParent = "əl"
        newColorMap2084.color = "lightGrey"
        
        let newColorMap2085 = ColorMap()
        newColorMap2085.LetterComboParent = "oal"
        newColorMap2085.ipaParent = "əl"
        newColorMap2085.color = "darkGrey"
        
        newLetterCombo592.colorMapList.append(objectsIn: [newColorMap2083,newColorMap2084,newColorMap2085])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo592])
        //===================================
        let newLetterCombo593 = LetterCombo()
        newLetterCombo593.letterCombo = "oul"
        newLetterCombo593.ipaParent = "əl"
        
        let newColorMap2086 = ColorMap()
        newColorMap2086.LetterComboParent = "oul"
        newColorMap2086.ipaParent = "əl"
        newColorMap2086.color = "lightGrey"
        
        let newColorMap2087 = ColorMap()
        newColorMap2087.LetterComboParent = "oul"
        newColorMap2087.ipaParent = "əl"
        newColorMap2087.color = "lightGrey"
        
        let newColorMap2088 = ColorMap()
        newColorMap2088.LetterComboParent = "oul"
        newColorMap2088.ipaParent = "əl"
        newColorMap2088.color = "darkGrey"
        
        newLetterCombo593.colorMapList.append(objectsIn: [newColorMap2086,newColorMap2087,newColorMap2088])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo593])
        //===================================
        let newLetterCombo594 = LetterCombo()
        newLetterCombo594.letterCombo = "oll"
        newLetterCombo594.ipaParent = "əl"
        
        let newColorMap2089 = ColorMap()
        newColorMap2089.LetterComboParent = "oll"
        newColorMap2089.ipaParent = "əl"
        newColorMap2089.color = "lightGrey"
        
        let newColorMap2090 = ColorMap()
        newColorMap2090.LetterComboParent = "oll"
        newColorMap2090.ipaParent = "əl"
        newColorMap2090.color = "darkGrey"
        
        let newColorMap2091 = ColorMap()
        newColorMap2091.LetterComboParent = "oll"
        newColorMap2091.ipaParent = "əl"
        newColorMap2091.color = "darkGrey"
        
        newLetterCombo594.colorMapList.append(objectsIn: [newColorMap2089,newColorMap2090,newColorMap2091])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo594])
        //===================================
        let newLetterCombo595 = LetterCombo()
        newLetterCombo595.letterCombo = "owl"
        newLetterCombo595.ipaParent = "əl"
        
        let newColorMap2092 = ColorMap()
        newColorMap2092.LetterComboParent = "owl"
        newColorMap2092.ipaParent = "əl"
        newColorMap2092.color = "lightGrey"
        
        let newColorMap2093 = ColorMap()
        newColorMap2093.LetterComboParent = "owl"
        newColorMap2093.ipaParent = "əl"
        newColorMap2093.color = "lightGrey"
        
        let newColorMap2094 = ColorMap()
        newColorMap2094.LetterComboParent = "owl"
        newColorMap2094.ipaParent = "əl"
        newColorMap2094.color = "darkGrey"
        
        newLetterCombo595.colorMapList.append(objectsIn: [newColorMap2092,newColorMap2093,newColorMap2094])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo595])
        //===================================
        let newLetterCombo596 = LetterCombo()
        newLetterCombo596.letterCombo = "'ll"
        newLetterCombo596.ipaParent = "əl"
        
        let newColorMap2095 = ColorMap()
        newColorMap2095.LetterComboParent = "'ll"
        newColorMap2095.ipaParent = "əl"
        newColorMap2095.color = "lightGrey"
        
        let newColorMap2096 = ColorMap()
        newColorMap2096.LetterComboParent = "'ll"
        newColorMap2096.ipaParent = "əl"
        newColorMap2096.color = "darkGrey"
        
        let newColorMap2097 = ColorMap()
        newColorMap2097.LetterComboParent = "'ll"
        newColorMap2097.ipaParent = "əl"
        newColorMap2097.color = "darkGrey"
        
        newLetterCombo596.colorMapList.append(objectsIn: [newColorMap2095,newColorMap2096,newColorMap2097])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo596])
        //===================================
        let newLetterCombo146 = LetterCombo()
        newLetterCombo146.letterCombo = "le"
        newLetterCombo146.ipaParent = "əl"
        
        let newColorMap307 = ColorMap()
        newColorMap307.LetterComboParent = "le"
        newColorMap307.ipaParent = "əl"
        newColorMap307.color = "darkGrey"
        
        let newColorMap308 = ColorMap()
        newColorMap308.LetterComboParent = "le"
        newColorMap308.ipaParent = "əl"
        newColorMap308.color = "lightGrey"
        
        newLetterCombo146.colorMapList.append(objectsIn: [newColorMap307,newColorMap308])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo146])
        //===================================
        let newLetterCombo147 = LetterCombo()
        newLetterCombo147.letterCombo = "al"
        newLetterCombo147.ipaParent = "əl"
        
        let newColorMap309 = ColorMap()
        newColorMap309.LetterComboParent = "al"
        newColorMap309.ipaParent = "əl"
        newColorMap309.color = "lightGrey"
        
        let newColorMap310 = ColorMap()
        newColorMap310.LetterComboParent = "al"
        newColorMap310.ipaParent = "əl"
        newColorMap310.color = "darkGrey"
        
        newLetterCombo147.colorMapList.append(objectsIn: [newColorMap309,newColorMap310])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo147])
        //===================================
        let newLetterCombo148 = LetterCombo()
        newLetterCombo148.letterCombo = "el"
        newLetterCombo148.ipaParent = "əl"
        
        let newColorMap311 = ColorMap()
        newColorMap311.LetterComboParent = "el"
        newColorMap311.ipaParent = "əl"
        newColorMap311.color = "lightGrey"
        
        let newColorMap312 = ColorMap()
        newColorMap312.LetterComboParent = "el"
        newColorMap312.ipaParent = "əl"
        newColorMap312.color = "darkGrey"
        
        newLetterCombo148.colorMapList.append(objectsIn: [newColorMap311,newColorMap312])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo148])
        //===================================
        let newLetterCombo149 = LetterCombo()
        newLetterCombo149.letterCombo = "il"
        newLetterCombo149.ipaParent = "əl"
        
        let newColorMap313 = ColorMap()
        newColorMap313.LetterComboParent = "il"
        newColorMap313.ipaParent = "əl"
        newColorMap313.color = "lightGrey"
        
        let newColorMap314 = ColorMap()
        newColorMap314.LetterComboParent = "il"
        newColorMap314.ipaParent = "əl"
        newColorMap314.color = "darkGrey"
        
        newLetterCombo149.colorMapList.append(objectsIn: [newColorMap313,newColorMap314])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo149])
        //===================================
        let newLetterCombo150 = LetterCombo()
        newLetterCombo150.letterCombo = "ul"
        newLetterCombo150.ipaParent = "əl"
        
        let newColorMap315 = ColorMap()
        newColorMap315.LetterComboParent = "ul"
        newColorMap315.ipaParent = "əl"
        newColorMap315.color = "lightGrey"
        
        let newColorMap316 = ColorMap()
        newColorMap316.LetterComboParent = "ul"
        newColorMap316.ipaParent = "əl"
        newColorMap316.color = "darkGrey"
        
        newLetterCombo150.colorMapList.append(objectsIn: [newColorMap315,newColorMap316])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo150])
        //===================================
        let newLetterCombo151 = LetterCombo()
        newLetterCombo151.letterCombo = "ol"
        newLetterCombo151.ipaParent = "əl"
        
        let newColorMap317 = ColorMap()
        newColorMap317.LetterComboParent = "ol"
        newColorMap317.ipaParent = "əl"
        newColorMap317.color = "lightGrey"
        
        let newColorMap318 = ColorMap()
        newColorMap318.LetterComboParent = "ol"
        newColorMap318.ipaParent = "əl"
        newColorMap318.color = "darkGrey"
        
        newLetterCombo151.colorMapList.append(objectsIn: [newColorMap317,newColorMap318])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo151])
        //===================================
        let newLetterCombo152 = LetterCombo()
        newLetterCombo152.letterCombo = "yl"
        newLetterCombo152.ipaParent = "əl"
        
        let newColorMap319 = ColorMap()
        newColorMap319.LetterComboParent = "yl"
        newColorMap319.ipaParent = "əl"
        newColorMap319.color = "lightGrey"
        
        let newColorMap320 = ColorMap()
        newColorMap320.LetterComboParent = "yl"
        newColorMap320.ipaParent = "əl"
        newColorMap320.color = "darkGrey"
        
        newLetterCombo152.colorMapList.append(objectsIn: [newColorMap319,newColorMap320])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo152])
        //===================================
        let newLetterCombo597 = LetterCombo()
        newLetterCombo597.letterCombo = "ll"
        newLetterCombo597.ipaParent = "əl"
        
        let newColorMap2098 = ColorMap()
        newColorMap2098.LetterComboParent = "ll"
        newColorMap2098.ipaParent = "əl"
        newColorMap2098.color = "darkGrey"
        
        let newColorMap2099 = ColorMap()
        newColorMap2099.LetterComboParent = "ll"
        newColorMap2099.ipaParent = "əl"
        newColorMap2099.color = "darkGrey"
        
        newLetterCombo597.colorMapList.append(objectsIn: [newColorMap2098,newColorMap2099])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo597])
        //===================================
        let newLetterCombo598 = LetterCombo()
        newLetterCombo598.letterCombo = "l"
        newLetterCombo598.ipaParent = "əl"
        
        let newColorMap2100 = ColorMap()
        newColorMap2100.LetterComboParent = "l"
        newColorMap2100.ipaParent = "əl"
        newColorMap2100.color = "darkGrey"
        
        newLetterCombo598.colorMapList.append(objectsIn: [newColorMap2100])
        newIPALetter19.letterCombos.append(objectsIn: [newLetterCombo598])
        
        // =========================================
        // MARK: - "ər"
        // =========================================
        let newIPALetter22 = IPALetter()
        newIPALetter22.ipaLetter = "ər"
        
        //===================================
        let newLetterCombo747 = LetterCombo()
        newLetterCombo747.letterCombo = "ou're"
        newLetterCombo747.ipaParent = "ər"
        
        let newColorMap2445 = ColorMap()
        newColorMap2445.LetterComboParent = "ou're"
        newColorMap2445.ipaParent = "ər"
        newColorMap2445.color = "lightGrey"
        
        let newColorMap2446 = ColorMap()
        newColorMap2446.LetterComboParent = "ou're"
        newColorMap2446.ipaParent = "ər"
        newColorMap2446.color = "lightGrey"
        
        let newColorMap2447 = ColorMap()
        newColorMap2447.LetterComboParent = "ou're"
        newColorMap2447.ipaParent = "ər"
        newColorMap2447.color = "lightGrey"
        
        let newColorMap2448 = ColorMap()
        newColorMap2448.LetterComboParent = "ou're"
        newColorMap2448.ipaParent = "ər"
        newColorMap2448.color = "darkGrey"
        
        let newColorMap2449 = ColorMap()
        newColorMap2449.LetterComboParent = "ou're"
        newColorMap2449.ipaParent = "ər"
        newColorMap2449.color = "lightGrey"
        
        newLetterCombo747.colorMapList.append(objectsIn: [newColorMap2445,newColorMap2446,newColorMap2447,newColorMap2448,newColorMap2449])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo747])
        //===================================
        let newLetterCombo173 = LetterCombo()
        newLetterCombo173.letterCombo = "our"
        newLetterCombo173.ipaParent = "ər"
        
        let newColorMap377 = ColorMap()
        newColorMap377.LetterComboParent = "our"
        newColorMap377.ipaParent = "ər"
        newColorMap377.color = "lightGrey"
        
        let newColorMap378 = ColorMap()
        newColorMap378.LetterComboParent = "our"
        newColorMap378.ipaParent = "ər"
        newColorMap378.color = "lightGrey"
        
        let newColorMap379 = ColorMap()
        newColorMap379.LetterComboParent = "our"
        newColorMap379.ipaParent = "ər"
        newColorMap379.color = "darkGrey"
        
        newLetterCombo173.colorMapList.append(objectsIn: [newColorMap377,newColorMap378,newColorMap379])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo173])
        //===================================
        let newLetterCombo174 = LetterCombo()
        newLetterCombo174.letterCombo = "ear"
        newLetterCombo174.ipaParent = "ər"
        
        let newColorMap380 = ColorMap()
        newColorMap380.LetterComboParent = "ear"
        newColorMap380.ipaParent = "ər"
        newColorMap380.color = "lightGrey"
        
        let newColorMap381 = ColorMap()
        newColorMap381.LetterComboParent = "ear"
        newColorMap381.ipaParent = "ər"
        newColorMap381.color = "lightGrey"
        
        let newColorMap382 = ColorMap()
        newColorMap382.LetterComboParent = "ear"
        newColorMap382.ipaParent = "ər"
        newColorMap382.color = "darkGrey"
        
        newLetterCombo174.colorMapList.append(objectsIn: [newColorMap380,newColorMap381,newColorMap382])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo174])
        //===================================
        let newLetterCombo175 = LetterCombo()
        newLetterCombo175.letterCombo = "eur"
        newLetterCombo175.ipaParent = "ər"
        
        let newColorMap383 = ColorMap()
        newColorMap383.LetterComboParent = "eur"
        newColorMap383.ipaParent = "ər"
        newColorMap383.color = "lightGrey"
        
        let newColorMap384 = ColorMap()
        newColorMap384.LetterComboParent = "eur"
        newColorMap384.ipaParent = "ər"
        newColorMap384.color = "lightGrey"
        
        let newColorMap385 = ColorMap()
        newColorMap385.LetterComboParent = "eur"
        newColorMap385.ipaParent = "ər"
        newColorMap385.color = "darkGrey"
        
        newLetterCombo175.colorMapList.append(objectsIn: [newColorMap383,newColorMap384,newColorMap385])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo175])
        //===================================
        let newLetterCombo176 = LetterCombo()
        newLetterCombo176.letterCombo = "err"
        newLetterCombo176.ipaParent = "ər"
        
        let newColorMap386 = ColorMap()
        newColorMap386.LetterComboParent = "err"
        newColorMap386.ipaParent = "ər"
        newColorMap386.color = "lightGrey"
        
        let newColorMap387 = ColorMap()
        newColorMap387.LetterComboParent = "err"
        newColorMap387.ipaParent = "ər"
        newColorMap387.color = "darkGrey"
        
        let newColorMap388 = ColorMap()
        newColorMap388.LetterComboParent = "err"
        newColorMap388.ipaParent = "ər"
        newColorMap388.color = "darkGrey"
        
        newLetterCombo176.colorMapList.append(objectsIn: [newColorMap386,newColorMap387,newColorMap388])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo176])
        //===================================
        let newLetterCombo177 = LetterCombo()
        newLetterCombo177.letterCombo = "ere"
        newLetterCombo177.ipaParent = "ər"
        
        let newColorMap389 = ColorMap()
        newColorMap389.LetterComboParent = "ere"
        newColorMap389.ipaParent = "ər"
        newColorMap389.color = "lightGrey"
        
        let newColorMap390 = ColorMap()
        newColorMap390.LetterComboParent = "ere"
        newColorMap390.ipaParent = "ər"
        newColorMap390.color = "darkGrey"
        
        let newColorMap391 = ColorMap()
        newColorMap391.LetterComboParent = "ere"
        newColorMap391.ipaParent = "ər"
        newColorMap391.color = "lightGrey"
        
        newLetterCombo177.colorMapList.append(objectsIn: [newColorMap389,newColorMap390,newColorMap391])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo177])
        //===================================
        let newLetterCombo178 = LetterCombo()
        newLetterCombo178.letterCombo = "urr"
        newLetterCombo178.ipaParent = "ər"
        
        let newColorMap392 = ColorMap()
        newColorMap392.LetterComboParent = "urr"
        newColorMap392.ipaParent = "ər"
        newColorMap392.color = "lightGrey"
        
        let newColorMap393 = ColorMap()
        newColorMap393.LetterComboParent = "urr"
        newColorMap393.ipaParent = "ər"
        newColorMap393.color = "darkGrey"
        
        let newColorMap394 = ColorMap()
        newColorMap394.LetterComboParent = "urr"
        newColorMap394.ipaParent = "ər"
        newColorMap394.color = "darkGrey"
        
        newLetterCombo178.colorMapList.append(objectsIn: [newColorMap392,newColorMap393,newColorMap394])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo178])
        //===================================
        let newLetterCombo179 = LetterCombo()
        newLetterCombo179.letterCombo = "ure"
        newLetterCombo179.ipaParent = "ər"
        
        let newColorMap395 = ColorMap()
        newColorMap395.LetterComboParent = "ure"
        newColorMap395.ipaParent = "ər"
        newColorMap395.color = "lightGrey"
        
        let newColorMap396 = ColorMap()
        newColorMap396.LetterComboParent = "ure"
        newColorMap396.ipaParent = "ər"
        newColorMap396.color = "darkGrey"
        
        let newColorMap397 = ColorMap()
        newColorMap397.LetterComboParent = "ure"
        newColorMap397.ipaParent = "ər"
        newColorMap397.color = "lightGrey"
        
        newLetterCombo179.colorMapList.append(objectsIn: [newColorMap395,newColorMap396,newColorMap397])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo179])
        //===================================
        let newLetterCombo180 = LetterCombo()
        newLetterCombo180.letterCombo = "uer"
        newLetterCombo180.ipaParent = "ər"
        
        let newColorMap398 = ColorMap()
        newColorMap398.LetterComboParent = "uer"
        newColorMap398.ipaParent = "ər"
        newColorMap398.color = "lightGrey"
        
        let newColorMap399 = ColorMap()
        newColorMap399.LetterComboParent = "uer"
        newColorMap399.ipaParent = "ər"
        newColorMap399.color = "lightGrey"
        
        let newColorMap400 = ColorMap()
        newColorMap400.LetterComboParent = "uer"
        newColorMap400.ipaParent = "ər"
        newColorMap400.color = "darkGrey"
        
        newLetterCombo180.colorMapList.append(objectsIn: [newColorMap398,newColorMap399,newColorMap400])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo180])
        //===================================
        let newLetterCombo599 = LetterCombo()
        newLetterCombo599.letterCombo = "ier"
        newLetterCombo599.ipaParent = "ər"
        
        let newColorMap2101 = ColorMap()
        newColorMap2101.LetterComboParent = "ier"
        newColorMap2101.ipaParent = "ər"
        newColorMap2101.color = "lightGrey"
        
        let newColorMap2102 = ColorMap()
        newColorMap2102.LetterComboParent = "ier"
        newColorMap2102.ipaParent = "ər"
        newColorMap2102.color = "lightGrey"
        
        let newColorMap2103 = ColorMap()
        newColorMap2103.LetterComboParent = "ier"
        newColorMap2103.ipaParent = "ər"
        newColorMap2103.color = "darkGrey"
        
        newLetterCombo599.colorMapList.append(objectsIn: [newColorMap2101,newColorMap2102,newColorMap2103])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo599])
        //===================================
        let newLetterCombo600 = LetterCombo()
        newLetterCombo600.letterCombo = "oor"
        newLetterCombo600.ipaParent = "ər"
        
        let newColorMap2104 = ColorMap()
        newColorMap2104.LetterComboParent = "oor"
        newColorMap2104.ipaParent = "ər"
        newColorMap2104.color = "lightGrey"
        
        let newColorMap2105 = ColorMap()
        newColorMap2105.LetterComboParent = "oor"
        newColorMap2105.ipaParent = "ər"
        newColorMap2105.color = "lightGrey"
        
        let newColorMap2106 = ColorMap()
        newColorMap2106.LetterComboParent = "oor"
        newColorMap2106.ipaParent = "ər"
        newColorMap2106.color = "darkGrey"
        
        newLetterCombo600.colorMapList.append(objectsIn: [newColorMap2104,newColorMap2105,newColorMap2106])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo600])
        //===================================
        let newLetterCombo743 = LetterCombo()
        newLetterCombo743.letterCombo = "oar"
        newLetterCombo743.ipaParent = "ər"
        
        let newColorMap2434 = ColorMap()
        newColorMap2434.LetterComboParent = "oar"
        newColorMap2434.ipaParent = "ər"
        newColorMap2434.color = "lightGrey"
        
        let newColorMap2435 = ColorMap()
        newColorMap2435.LetterComboParent = "oar"
        newColorMap2435.ipaParent = "ər"
        newColorMap2435.color = "lightGrey"
        
        let newColorMap2436 = ColorMap()
        newColorMap2436.LetterComboParent = "oar"
        newColorMap2436.ipaParent = "ər"
        newColorMap2436.color = "darkGrey"
        
        newLetterCombo743.colorMapList.append(objectsIn: [newColorMap2434,newColorMap2435,newColorMap2436])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo743])
        //===================================
        let newLetterCombo44 = LetterCombo()
        newLetterCombo44.letterCombo = "olo"
        newLetterCombo44.ipaParent = "ər"
        
        let newColorMap86 = ColorMap()
        newColorMap86.LetterComboParent = "olo"
        newColorMap86.ipaParent = "ər"
        newColorMap86.color = "yellow"
        
        let newColorMap2024 = ColorMap()
        newColorMap2024.LetterComboParent = "olo"
        newColorMap2024.ipaParent = "ər"
        newColorMap2024.color = "yellow"
        
        let newColorMap2025 = ColorMap()
        newColorMap2025.LetterComboParent = "olo"
        newColorMap2025.ipaParent = "ər"
        newColorMap2025.color = "yellow"
        
        newLetterCombo44.colorMapList.append(objectsIn: [newColorMap86,newColorMap2024,newColorMap2025])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo44])
        //===================================
        let newLetterCombo181 = LetterCombo()
        newLetterCombo181.letterCombo = "er"
        newLetterCombo181.ipaParent = "ər"
        
        let newColorMap401 = ColorMap()
        newColorMap401.LetterComboParent = "er"
        newColorMap401.ipaParent = "ər"
        newColorMap401.color = "lightGrey"
        
        let newColorMap402 = ColorMap()
        newColorMap402.LetterComboParent = "er"
        newColorMap402.ipaParent = "ər"
        newColorMap402.color = "darkGrey"
        
        newLetterCombo181.colorMapList.append(objectsIn: [newColorMap401,newColorMap402])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo181])
        //===================================
        let newLetterCombo182 = LetterCombo()
        newLetterCombo182.letterCombo = "ir"
        newLetterCombo182.ipaParent = "ər"
        
        let newColorMap403 = ColorMap()
        newColorMap403.LetterComboParent = "ir"
        newColorMap403.ipaParent = "ər"
        newColorMap403.color = "lightGrey"
        
        let newColorMap404 = ColorMap()
        newColorMap404.LetterComboParent = "ir"
        newColorMap404.ipaParent = "ər"
        newColorMap404.color = "darkGrey"
        
        newLetterCombo182.colorMapList.append(objectsIn: [newColorMap403,newColorMap404])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo182])
        //===================================
        let newLetterCombo183 = LetterCombo()
        newLetterCombo183.letterCombo = "ur"
        newLetterCombo183.ipaParent = "ər"
        
        let newColorMap405 = ColorMap()
        newColorMap405.LetterComboParent = "ur"
        newColorMap405.ipaParent = "ər"
        newColorMap405.color = "lightGrey"
        
        let newColorMap406 = ColorMap()
        newColorMap406.LetterComboParent = "ur"
        newColorMap406.ipaParent = "ər"
        newColorMap406.color = "darkGrey"
        
        newLetterCombo183.colorMapList.append(objectsIn: [newColorMap405,newColorMap406])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo183])
        //===================================
        let newLetterCombo184 = LetterCombo()
        newLetterCombo184.letterCombo = "or"
        newLetterCombo184.ipaParent = "ər"
        
        let newColorMap407 = ColorMap()
        newColorMap407.LetterComboParent = "or"
        newColorMap407.ipaParent = "ər"
        newColorMap407.color = "lightGrey"
        
        let newColorMap408 = ColorMap()
        newColorMap408.LetterComboParent = "or"
        newColorMap408.ipaParent = "ər"
        newColorMap408.color = "darkGrey"
        
        newLetterCombo184.colorMapList.append(objectsIn: [newColorMap407,newColorMap408])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo184])
        //===================================
        let newLetterCombo601 = LetterCombo()
        newLetterCombo601.letterCombo = "ar"
        newLetterCombo601.ipaParent = "ər"
        
        let newColorMap2107 = ColorMap()
        newColorMap2107.LetterComboParent = "ar"
        newColorMap2107.ipaParent = "ər"
        newColorMap2107.color = "lightGrey"
        
        let newColorMap2108 = ColorMap()
        newColorMap2108.LetterComboParent = "ar"
        newColorMap2108.ipaParent = "ər"
        newColorMap2108.color = "darkGrey"
        
        newLetterCombo601.colorMapList.append(objectsIn: [newColorMap2107,newColorMap2108])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo601])
        //===================================
        let newLetterCombo566 = LetterCombo()
        newLetterCombo566.letterCombo = "re"
        newLetterCombo566.ipaParent = "ər"
        
        let newColorMap2026 = ColorMap()
        newColorMap2026.LetterComboParent = "re"
        newColorMap2026.ipaParent = "ər"
        newColorMap2026.color = "darkGrey"
        
        let newColorMap2027 = ColorMap()
        newColorMap2027.LetterComboParent = "re"
        newColorMap2027.ipaParent = "ər"
        newColorMap2027.color = "lightGrey"
        
        newLetterCombo566.colorMapList.append(objectsIn: [newColorMap2026,newColorMap2027])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo566])
        //===================================
        let newLetterCombo728 = LetterCombo()
        newLetterCombo728.letterCombo = "ro"
        newLetterCombo728.ipaParent = "ər"
        
        let newColorMap2404 = ColorMap()
        newColorMap2404.LetterComboParent = "ro"
        newColorMap2404.ipaParent = "ər"
        newColorMap2404.color = "darkGrey"
        
        let newColorMap2405 = ColorMap()
        newColorMap2405.LetterComboParent = "ro"
        newColorMap2405.ipaParent = "ər"
        newColorMap2405.color = "lightGrey"
        
        newLetterCombo728.colorMapList.append(objectsIn: [newColorMap2404,newColorMap2405])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo728])
        //===================================
        let newLetterCombo602 = LetterCombo()
        newLetterCombo602.letterCombo = "r"
        newLetterCombo602.ipaParent = "ər"
        
        let newColorMap2109 = ColorMap()
        newColorMap2109.LetterComboParent = "r"
        newColorMap2109.ipaParent = "ər"
        newColorMap2109.color = "darkGrey"
        
        newLetterCombo602.colorMapList.append(objectsIn: [newColorMap2109])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo602])
        //===================================
        let newLetterCombo539 = LetterCombo()
        newLetterCombo539.letterCombo = "a"
        newLetterCombo539.ipaParent = "ər"
        
        let newColorMap1174 = ColorMap()
        newColorMap1174.LetterComboParent = "a"
        newColorMap1174.ipaParent = "ər"
        newColorMap1174.color = "yellow"
        
        newLetterCombo539.colorMapList.append(objectsIn: [newColorMap1174])
        newIPALetter22.letterCombos.append(objectsIn: [newLetterCombo539])
        
        // =========================================
        // MARK: - "ʊr"
        // =========================================
        let newIPALetter21 = IPALetter()
        newIPALetter21.ipaLetter = "ʊr"
        
        //===================================
        let newLetterCombo748 = LetterCombo()
        newLetterCombo748.letterCombo = "ou're"
        newLetterCombo748.ipaParent = "ʊr"
        
        let newColorMap2450 = ColorMap()
        newColorMap2450.LetterComboParent = "ou're"
        newColorMap2450.ipaParent = "ʊr"
        newColorMap2450.color = "lightGrey"
        
        let newColorMap2451 = ColorMap()
        newColorMap2451.LetterComboParent = "ou're"
        newColorMap2451.ipaParent = "ʊr"
        newColorMap2451.color = "lightGrey"
        
        let newColorMap2452 = ColorMap()
        newColorMap2452.LetterComboParent = "ou're"
        newColorMap2452.ipaParent = "ʊr"
        newColorMap2452.color = "lightGrey"
        
        let newColorMap2453 = ColorMap()
        newColorMap2453.LetterComboParent = "ou're"
        newColorMap2453.ipaParent = "ʊr"
        newColorMap2453.color = "darkGrey"
        
        let newColorMap2454 = ColorMap()
        newColorMap2454.LetterComboParent = "ou're"
        newColorMap2454.ipaParent = "ʊr"
        newColorMap2454.color = "lightGrey"
        
        newLetterCombo748.colorMapList.append(objectsIn: [newColorMap2450,newColorMap2451,newColorMap2452,newColorMap2453,newColorMap2454])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo748])
        //===================================
        //===================================
        let newLetterCombo703 = LetterCombo()
        newLetterCombo703.letterCombo = "our"
        newLetterCombo703.ipaParent = "ʊr"
        
        let newColorMap2345 = ColorMap()
        newColorMap2345.LetterComboParent = "our"
        newColorMap2345.ipaParent = "ʊr"
        newColorMap2345.color = "lightGrey"
        
        let newColorMap2346 = ColorMap()
        newColorMap2346.LetterComboParent = "our"
        newColorMap2346.ipaParent = "ʊr"
        newColorMap2346.color = "lightGrey"
        
        let newColorMap2347 = ColorMap()
        newColorMap2347.LetterComboParent = "our"
        newColorMap2347.ipaParent = "ʊr"
        newColorMap2347.color = "darkGrey"
        
        newLetterCombo703.colorMapList.append(objectsIn: [newColorMap2345,newColorMap2346,newColorMap2347])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo703])
        //===================================
        let newLetterCombo704 = LetterCombo()
        newLetterCombo704.letterCombo = "ear"
        newLetterCombo704.ipaParent = "ʊr"
        
        let newColorMap2348 = ColorMap()
        newColorMap2348.LetterComboParent = "ear"
        newColorMap2348.ipaParent = "ʊr"
        newColorMap2348.color = "lightGrey"
        
        let newColorMap2349 = ColorMap()
        newColorMap2349.LetterComboParent = "ear"
        newColorMap2349.ipaParent = "ʊr"
        newColorMap2349.color = "lightGrey"
        
        let newColorMap2350 = ColorMap()
        newColorMap2350.LetterComboParent = "ear"
        newColorMap2350.ipaParent = "ʊr"
        newColorMap2350.color = "darkGrey"
        
        newLetterCombo704.colorMapList.append(objectsIn: [newColorMap2348,newColorMap2349,newColorMap2350])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo704])
        //===================================
        let newLetterCombo705 = LetterCombo()
        newLetterCombo705.letterCombo = "eur"
        newLetterCombo705.ipaParent = "ʊr"
        
        let newColorMap2351 = ColorMap()
        newColorMap2351.LetterComboParent = "eur"
        newColorMap2351.ipaParent = "ʊr"
        newColorMap2351.color = "lightGrey"
        
        let newColorMap2352 = ColorMap()
        newColorMap2352.LetterComboParent = "eur"
        newColorMap2352.ipaParent = "ʊr"
        newColorMap2352.color = "lightGrey"
        
        let newColorMap2353 = ColorMap()
        newColorMap2353.LetterComboParent = "eur"
        newColorMap2353.ipaParent = "ʊr"
        newColorMap2353.color = "darkGrey"
        
        newLetterCombo705.colorMapList.append(objectsIn: [newColorMap2351,newColorMap2352,newColorMap2353])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo705])
        //===================================
        let newLetterCombo706 = LetterCombo()
        newLetterCombo706.letterCombo = "err"
        newLetterCombo706.ipaParent = "ʊr"
        
        let newColorMap2354 = ColorMap()
        newColorMap2354.LetterComboParent = "err"
        newColorMap2354.ipaParent = "ʊr"
        newColorMap2354.color = "lightGrey"
        
        let newColorMap2355 = ColorMap()
        newColorMap2355.LetterComboParent = "err"
        newColorMap2355.ipaParent = "ʊr"
        newColorMap2355.color = "darkGrey"
        
        let newColorMap2356 = ColorMap()
        newColorMap2356.LetterComboParent = "err"
        newColorMap2356.ipaParent = "ʊr"
        newColorMap2356.color = "darkGrey"
        
        newLetterCombo706.colorMapList.append(objectsIn: [newColorMap2354,newColorMap2355,newColorMap2356])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo706])
        //===================================
        let newLetterCombo707 = LetterCombo()
        newLetterCombo707.letterCombo = "ere"
        newLetterCombo707.ipaParent = "ʊr"
        
        let newColorMap2357 = ColorMap()
        newColorMap2357.LetterComboParent = "ere"
        newColorMap2357.ipaParent = "ʊr"
        newColorMap2357.color = "lightGrey"
        
        let newColorMap2358 = ColorMap()
        newColorMap2358.LetterComboParent = "ere"
        newColorMap2358.ipaParent = "ʊr"
        newColorMap2358.color = "darkGrey"
        
        let newColorMap2359 = ColorMap()
        newColorMap2359.LetterComboParent = "ere"
        newColorMap2359.ipaParent = "ʊr"
        newColorMap2359.color = "lightGrey"
        
        newLetterCombo707.colorMapList.append(objectsIn: [newColorMap2357,newColorMap2358,newColorMap2359])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo707])
        //===================================
        let newLetterCombo708 = LetterCombo()
        newLetterCombo708.letterCombo = "urr"
        newLetterCombo708.ipaParent = "ʊr"
        
        let newColorMap2360 = ColorMap()
        newColorMap2360.LetterComboParent = "urr"
        newColorMap2360.ipaParent = "ʊr"
        newColorMap2360.color = "lightGrey"
        
        let newColorMap2361 = ColorMap()
        newColorMap2361.LetterComboParent = "urr"
        newColorMap2361.ipaParent = "ʊr"
        newColorMap2361.color = "darkGrey"
        
        let newColorMap2362 = ColorMap()
        newColorMap2362.LetterComboParent = "urr"
        newColorMap2362.ipaParent = "ʊr"
        newColorMap2362.color = "darkGrey"
        
        newLetterCombo708.colorMapList.append(objectsIn: [newColorMap2360,newColorMap2361,newColorMap2362])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo708])
        //===================================
        let newLetterCombo709 = LetterCombo()
        newLetterCombo709.letterCombo = "ure"
        newLetterCombo709.ipaParent = "ʊr"
        
        let newColorMap2363 = ColorMap()
        newColorMap2363.LetterComboParent = "ure"
        newColorMap2363.ipaParent = "ʊr"
        newColorMap2363.color = "lightGrey"
        
        let newColorMap2364 = ColorMap()
        newColorMap2364.LetterComboParent = "ure"
        newColorMap2364.ipaParent = "ʊr"
        newColorMap2364.color = "darkGrey"
        
        let newColorMap2365 = ColorMap()
        newColorMap2365.LetterComboParent = "ure"
        newColorMap2365.ipaParent = "ʊr"
        newColorMap2365.color = "lightGrey"
        
        newLetterCombo709.colorMapList.append(objectsIn: [newColorMap2363,newColorMap2364,newColorMap2365])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo709])
        //===================================
        let newLetterCombo710 = LetterCombo()
        newLetterCombo710.letterCombo = "uer"
        newLetterCombo710.ipaParent = "ʊr"
        
        let newColorMap2366 = ColorMap()
        newColorMap2366.LetterComboParent = "uer"
        newColorMap2366.ipaParent = "ʊr"
        newColorMap2366.color = "lightGrey"
        
        let newColorMap2367 = ColorMap()
        newColorMap2367.LetterComboParent = "uer"
        newColorMap2367.ipaParent = "ʊr"
        newColorMap2367.color = "lightGrey"
        
        let newColorMap2368 = ColorMap()
        newColorMap2368.LetterComboParent = "uer"
        newColorMap2368.ipaParent = "ʊr"
        newColorMap2368.color = "darkGrey"
        
        newLetterCombo710.colorMapList.append(objectsIn: [newColorMap2366,newColorMap2367,newColorMap2368])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo710])
        //===================================
        let newLetterCombo711 = LetterCombo()
        newLetterCombo711.letterCombo = "ier"
        newLetterCombo711.ipaParent = "ʊr"
        
        let newColorMap2369 = ColorMap()
        newColorMap2369.LetterComboParent = "ier"
        newColorMap2369.ipaParent = "ʊr"
        newColorMap2369.color = "lightGrey"
        
        let newColorMap2370 = ColorMap()
        newColorMap2370.LetterComboParent = "ier"
        newColorMap2370.ipaParent = "ʊr"
        newColorMap2370.color = "lightGrey"
        
        let newColorMap2371 = ColorMap()
        newColorMap2371.LetterComboParent = "ier"
        newColorMap2371.ipaParent = "ʊr"
        newColorMap2371.color = "darkGrey"
        
        newLetterCombo711.colorMapList.append(objectsIn: [newColorMap2369,newColorMap2370,newColorMap2371])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo711])
        //===================================
        let newLetterCombo712 = LetterCombo()
        newLetterCombo712.letterCombo = "oor"
        newLetterCombo712.ipaParent = "ʊr"
        
        let newColorMap2372 = ColorMap()
        newColorMap2372.LetterComboParent = "oor"
        newColorMap2372.ipaParent = "ʊr"
        newColorMap2372.color = "lightGrey"
        
        let newColorMap2373 = ColorMap()
        newColorMap2373.LetterComboParent = "oor"
        newColorMap2373.ipaParent = "ʊr"
        newColorMap2373.color = "lightGrey"
        
        let newColorMap2374 = ColorMap()
        newColorMap2374.LetterComboParent = "oor"
        newColorMap2374.ipaParent = "ʊr"
        newColorMap2374.color = "darkGrey"
        
        newLetterCombo712.colorMapList.append(objectsIn: [newColorMap2372,newColorMap2373,newColorMap2374])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo712])
        //===================================
        let newLetterCombo744 = LetterCombo()
        newLetterCombo744.letterCombo = "oar"
        newLetterCombo744.ipaParent = "ʊr"
        
        let newColorMap2437 = ColorMap()
        newColorMap2437.LetterComboParent = "oar"
        newColorMap2437.ipaParent = "ʊr"
        newColorMap2437.color = "lightGrey"
        
        let newColorMap2438 = ColorMap()
        newColorMap2438.LetterComboParent = "oar"
        newColorMap2438.ipaParent = "ʊr"
        newColorMap2438.color = "lightGrey"
        
        let newColorMap2439 = ColorMap()
        newColorMap2439.LetterComboParent = "oar"
        newColorMap2439.ipaParent = "ʊr"
        newColorMap2439.color = "darkGrey"
        
        newLetterCombo744.colorMapList.append(objectsIn: [newColorMap2437,newColorMap2438,newColorMap2439])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo744])
        //===================================
        let newLetterCombo713 = LetterCombo()
        newLetterCombo713.letterCombo = "olo"
        newLetterCombo713.ipaParent = "ʊr"
        
        let newColorMap2375 = ColorMap()
        newColorMap2375.LetterComboParent = "olo"
        newColorMap2375.ipaParent = "ʊr"
        newColorMap2375.color = "yellow"
        
        let newColorMap2376 = ColorMap()
        newColorMap2376.LetterComboParent = "olo"
        newColorMap2376.ipaParent = "ʊr"
        newColorMap2376.color = "yellow"
        
        let newColorMap2377 = ColorMap()
        newColorMap2377.LetterComboParent = "olo"
        newColorMap2377.ipaParent = "ʊr"
        newColorMap2377.color = "yellow"
        
        newLetterCombo713.colorMapList.append(objectsIn: [newColorMap2375,newColorMap2376,newColorMap2377])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo713])
        //===================================
        let newLetterCombo714 = LetterCombo()
        newLetterCombo714.letterCombo = "er"
        newLetterCombo714.ipaParent = "ʊr"
        
        let newColorMap2378 = ColorMap()
        newColorMap2378.LetterComboParent = "er"
        newColorMap2378.ipaParent = "ʊr"
        newColorMap2378.color = "lightGrey"
        
        let newColorMap2379 = ColorMap()
        newColorMap2379.LetterComboParent = "er"
        newColorMap2379.ipaParent = "ʊr"
        newColorMap2379.color = "darkGrey"
        
        newLetterCombo714.colorMapList.append(objectsIn: [newColorMap2378,newColorMap2379])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo714])
        //===================================
        let newLetterCombo715 = LetterCombo()
        newLetterCombo715.letterCombo = "ir"
        newLetterCombo715.ipaParent = "ʊr"
        
        let newColorMap2380 = ColorMap()
        newColorMap2380.LetterComboParent = "ir"
        newColorMap2380.ipaParent = "ʊr"
        newColorMap2380.color = "lightGrey"
        
        let newColorMap2381 = ColorMap()
        newColorMap2381.LetterComboParent = "ir"
        newColorMap2381.ipaParent = "ʊr"
        newColorMap2381.color = "darkGrey"
        
        newLetterCombo715.colorMapList.append(objectsIn: [newColorMap2380,newColorMap2381])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo715])
        //===================================
        let newLetterCombo716 = LetterCombo()
        newLetterCombo716.letterCombo = "ur"
        newLetterCombo716.ipaParent = "ʊr"
        
        let newColorMap2382 = ColorMap()
        newColorMap2382.LetterComboParent = "ur"
        newColorMap2382.ipaParent = "ʊr"
        newColorMap2382.color = "lightGrey"
        
        let newColorMap2383 = ColorMap()
        newColorMap2383.LetterComboParent = "ur"
        newColorMap2383.ipaParent = "ʊr"
        newColorMap2383.color = "darkGrey"
        
        newLetterCombo716.colorMapList.append(objectsIn: [newColorMap2382,newColorMap2383])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo716])
        //===================================
        let newLetterCombo717 = LetterCombo()
        newLetterCombo717.letterCombo = "or"
        newLetterCombo717.ipaParent = "ʊr"
        
        let newColorMap2384 = ColorMap()
        newColorMap2384.LetterComboParent = "or"
        newColorMap2384.ipaParent = "ʊr"
        newColorMap2384.color = "lightGrey"
        
        let newColorMap2385 = ColorMap()
        newColorMap2385.LetterComboParent = "or"
        newColorMap2385.ipaParent = "ʊr"
        newColorMap2385.color = "darkGrey"
        
        newLetterCombo717.colorMapList.append(objectsIn: [newColorMap2384,newColorMap2385])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo717])
        //===================================
        let newLetterCombo718 = LetterCombo()
        newLetterCombo718.letterCombo = "ar"
        newLetterCombo718.ipaParent = "ʊr"
        
        let newColorMap2386 = ColorMap()
        newColorMap2386.LetterComboParent = "ar"
        newColorMap2386.ipaParent = "ʊr"
        newColorMap2386.color = "lightGrey"
        
        let newColorMap2387 = ColorMap()
        newColorMap2387.LetterComboParent = "ar"
        newColorMap2387.ipaParent = "ʊr"
        newColorMap2387.color = "darkGrey"
        
        newLetterCombo718.colorMapList.append(objectsIn: [newColorMap2386,newColorMap2387])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo718])
        //===================================
        let newLetterCombo719 = LetterCombo()
        newLetterCombo719.letterCombo = "re"
        newLetterCombo719.ipaParent = "ʊr"
        
        let newColorMap2388 = ColorMap()
        newColorMap2388.LetterComboParent = "re"
        newColorMap2388.ipaParent = "ʊr"
        newColorMap2388.color = "darkGrey"
        
        let newColorMap2389 = ColorMap()
        newColorMap2389.LetterComboParent = "re"
        newColorMap2389.ipaParent = "ʊr"
        newColorMap2389.color = "lightGrey"
        
        newLetterCombo719.colorMapList.append(objectsIn: [newColorMap2388,newColorMap2389])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo719])
        //===================================
        let newLetterCombo729 = LetterCombo()
        newLetterCombo729.letterCombo = "ro"
        newLetterCombo729.ipaParent = "ʊr"
        
        let newColorMap2406 = ColorMap()
        newColorMap2406.LetterComboParent = "ro"
        newColorMap2406.ipaParent = "ʊr"
        newColorMap2406.color = "darkGrey"
        
        let newColorMap2407 = ColorMap()
        newColorMap2407.LetterComboParent = "ro"
        newColorMap2407.ipaParent = "ʊr"
        newColorMap2407.color = "lightGrey"
        
        newLetterCombo729.colorMapList.append(objectsIn: [newColorMap2406,newColorMap2407])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo729])
        //===================================
        let newLetterCombo720 = LetterCombo()
        newLetterCombo720.letterCombo = "r"
        newLetterCombo720.ipaParent = "ʊr"
        
        let newColorMap2390 = ColorMap()
        newColorMap2390.LetterComboParent = "r"
        newColorMap2390.ipaParent = "ʊr"
        newColorMap2390.color = "darkGrey"
        
        newLetterCombo720.colorMapList.append(objectsIn: [newColorMap2390])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo720])
        //===================================
        let newLetterCombo721 = LetterCombo()
        newLetterCombo721.letterCombo = "a"
        newLetterCombo721.ipaParent = "ʊr"
        
        let newColorMap2391 = ColorMap()
        newColorMap2391.LetterComboParent = "a"
        newColorMap2391.ipaParent = "ʊr"
        newColorMap2391.color = "yellow"
        
        newLetterCombo721.colorMapList.append(objectsIn: [newColorMap1174])
        newIPALetter21.letterCombos.append(objectsIn: [newLetterCombo721])
        
        // =========================================
        // MARK: - "ɛŋ"
        // =========================================
        let newIPALetter23 = IPALetter()
        newIPALetter23.ipaLetter = "ɛŋ"
        
        //===================================
        let newLetterCombo185 = LetterCombo()
        newLetterCombo185.letterCombo = "eng"
        newLetterCombo185.ipaParent = "ɛŋ"
        
        let newColorMap409 = ColorMap()
        newColorMap409.LetterComboParent = "eng"
        newColorMap409.ipaParent = "ɛŋ"
        newColorMap409.color = "pink"
        
        let newColorMap410 = ColorMap()
        newColorMap410.LetterComboParent = "eng"
        newColorMap410.ipaParent = "ɛŋ"
        newColorMap410.color = "darkGrey"
        
        let newColorMap411 = ColorMap()
        newColorMap411.LetterComboParent = "eng"
        newColorMap411.ipaParent = "ɛŋ"
        newColorMap411.color = "darkGrey"
        
        newLetterCombo185.colorMapList.append(objectsIn: [newColorMap409,newColorMap410,newColorMap411])
        newIPALetter23.letterCombos.append(objectsIn: [newLetterCombo185])
        //===================================
        let newLetterCombo603 = LetterCombo()
        newLetterCombo603.letterCombo = "en"
        newLetterCombo603.ipaParent = "ɛŋ"
        
        let newColorMap2110 = ColorMap()
        newColorMap2110.LetterComboParent = "en"
        newColorMap2110.ipaParent = "ɛŋ"
        newColorMap2110.color = "pink"
        
        let newColorMap2111 = ColorMap()
        newColorMap2111.LetterComboParent = "en"
        newColorMap2111.ipaParent = "ɛŋ"
        newColorMap2111.color = "darkGrey"
        
        newLetterCombo603.colorMapList.append(objectsIn: [newColorMap2110,newColorMap2111])
        newIPALetter23.letterCombos.append(objectsIn: [newLetterCombo603])
        
        // =========================================
        // MARK: - "ɛr"
        // =========================================
        let newIPALetter24 = IPALetter()
        newIPALetter24.ipaLetter = "ɛr"
        
        //===================================
        let newLetterCombo604 = LetterCombo()
        newLetterCombo604.letterCombo = "ey're"
        newLetterCombo604.ipaParent = "ɛr"
        
        let newColorMap2112 = ColorMap()
        newColorMap2112.LetterComboParent = "ey're"
        newColorMap2112.ipaParent = "ɛr"
        newColorMap2112.color = "darkGreen"
        
        let newColorMap2113 = ColorMap()
        newColorMap2113.LetterComboParent = "ey're"
        newColorMap2113.ipaParent = "ɛr"
        newColorMap2113.color = "lightGrey"
        
        let newColorMap2114 = ColorMap()
        newColorMap2114.LetterComboParent = "ey're"
        newColorMap2114.ipaParent = "ɛr"
        newColorMap2114.color = "lightGrey"
        
        let newColorMap2115 = ColorMap()
        newColorMap2115.LetterComboParent = "ey're"
        newColorMap2115.ipaParent = "ɛr"
        newColorMap2115.color = "darkGrey"
        
        let newColorMap2116 = ColorMap()
        newColorMap2116.LetterComboParent = "ey're"
        newColorMap2116.ipaParent = "ɛr"
        newColorMap2116.color = "lightGrey"
        
        newLetterCombo604.colorMapList.append(objectsIn: [newColorMap2112,newColorMap2113,newColorMap2114,newColorMap2115,newColorMap2116])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo604])
        //===================================
        let newLetterCombo186 = LetterCombo()
        newLetterCombo186.letterCombo = "ayer"
        newLetterCombo186.ipaParent = "ɛr"
        
        let newColorMap412 = ColorMap()
        newColorMap412.LetterComboParent = "ayer"
        newColorMap412.ipaParent = "ɛr"
        newColorMap412.color = "darkGreen"
        
        let newColorMap413 = ColorMap()
        newColorMap413.LetterComboParent = "ayer"
        newColorMap413.ipaParent = "ɛr"
        newColorMap413.color = "lightGrey"
        
        let newColorMap414 = ColorMap()
        newColorMap414.LetterComboParent = "ayer"
        newColorMap414.ipaParent = "ɛr"
        newColorMap414.color = "lightGrey"
        
        let newColorMap415 = ColorMap()
        newColorMap415.LetterComboParent = "ayer"
        newColorMap415.ipaParent = "ɛr"
        newColorMap415.color = "darkGrey"
        
        newLetterCombo186.colorMapList.append(objectsIn: [newColorMap412,newColorMap413,newColorMap414,newColorMap415])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo186])
        //===================================
        let newLetterCombo739 = LetterCombo()
        newLetterCombo739.letterCombo = "heir"
        newLetterCombo739.ipaParent = "ɛr"
        
        let newColorMap2424 = ColorMap()
        newColorMap2424.LetterComboParent = "heir"
        newColorMap2424.ipaParent = "ɛr"
        newColorMap2424.color = "lightGrey"
        
        let newColorMap2425 = ColorMap()
        newColorMap2425.LetterComboParent = "heir"
        newColorMap2425.ipaParent = "ɛr"
        newColorMap2425.color = "darkGreen"
        
        let newColorMap2426 = ColorMap()
        newColorMap2426.LetterComboParent = "heir"
        newColorMap2426.ipaParent = "ɛr"
        newColorMap2426.color = "darkGreen"
        
        let newColorMap2427 = ColorMap()
        newColorMap2427.LetterComboParent = "heir"
        newColorMap2427.ipaParent = "ɛr"
        newColorMap2427.color = "darkGrey"
        
        newLetterCombo739.colorMapList.append(objectsIn: [newColorMap2424,newColorMap2425,newColorMap2426,newColorMap2427])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo739])
        //===================================
        let newLetterCombo187 = LetterCombo()
        newLetterCombo187.letterCombo = "aire"
        newLetterCombo187.ipaParent = "ɛr"
        
        let newColorMap416 = ColorMap()
        newColorMap416.LetterComboParent = "aire"
        newColorMap416.ipaParent = "ɛr"
        newColorMap416.color = "darkGreen"
        
        let newColorMap417 = ColorMap()
        newColorMap417.LetterComboParent = "aire"
        newColorMap417.ipaParent = "ɛr"
        newColorMap417.color = "darkGreen"
        
        let newColorMap418 = ColorMap()
        newColorMap418.LetterComboParent = "aire"
        newColorMap418.ipaParent = "ɛr"
        newColorMap418.color = "darkGrey"
        
        let newColorMap419 = ColorMap()
        newColorMap419.LetterComboParent = "aire"
        newColorMap419.ipaParent = "ɛr"
        newColorMap419.color = "lightGrey"
        
        newLetterCombo187.colorMapList.append(objectsIn: [newColorMap416,newColorMap417,newColorMap418,newColorMap419])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo187])
        //===================================
        let newLetterCombo188 = LetterCombo()
        newLetterCombo188.letterCombo = "ere"
        newLetterCombo188.ipaParent = "ɛr"
        
        let newColorMap420 = ColorMap()
        newColorMap420.LetterComboParent = "ere"
        newColorMap420.ipaParent = "ɛr"
        newColorMap420.color = "darkGreen"
        
        let newColorMap421 = ColorMap()
        newColorMap421.LetterComboParent = "ere"
        newColorMap421.ipaParent = "ɛr"
        newColorMap421.color = "darkGrey"
        
        let newColorMap422 = ColorMap()
        newColorMap422.LetterComboParent = "ere"
        newColorMap422.ipaParent = "ɛr"
        newColorMap422.color = "lightGrey"
        
        newLetterCombo188.colorMapList.append(objectsIn: [newColorMap420,newColorMap421,newColorMap422])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo188])
        //===================================
        let newLetterCombo189 = LetterCombo()
        newLetterCombo189.letterCombo = "eir"
        newLetterCombo189.ipaParent = "ɛr"
        
        let newColorMap423 = ColorMap()
        newColorMap423.LetterComboParent = "eir"
        newColorMap423.ipaParent = "ɛr"
        newColorMap423.color = "darkGreen"
        
        let newColorMap424 = ColorMap()
        newColorMap424.LetterComboParent = "eir"
        newColorMap424.ipaParent = "ɛr"
        newColorMap424.color = "darkGreen"
        
        let newColorMap425 = ColorMap()
        newColorMap425.LetterComboParent = "eir"
        newColorMap425.ipaParent = "ɛr"
        newColorMap425.color = "darkGrey"
        
        newLetterCombo189.colorMapList.append(objectsIn: [newColorMap423,newColorMap424,newColorMap425])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo189])
        //===================================
        let newLetterCombo190 = LetterCombo()
        newLetterCombo190.letterCombo = "are"
        newLetterCombo190.ipaParent = "ɛr"
        
        let newColorMap426 = ColorMap()
        newColorMap426.LetterComboParent = "are"
        newColorMap426.ipaParent = "ɛr"
        newColorMap426.color = "darkGreen"
        
        let newColorMap427 = ColorMap()
        newColorMap427.LetterComboParent = "are"
        newColorMap427.ipaParent = "ɛr"
        newColorMap427.color = "darkGrey"
        
        let newColorMap428 = ColorMap()
        newColorMap428.LetterComboParent = "are"
        newColorMap428.ipaParent = "ɛr"
        newColorMap428.color = "lightGrey"
        
        newLetterCombo190.colorMapList.append(objectsIn: [newColorMap426,newColorMap427,newColorMap428])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo190])
        //===================================
        let newLetterCombo191 = LetterCombo()
        newLetterCombo191.letterCombo = "aer"
        newLetterCombo191.ipaParent = "ɛr"
        
        let newColorMap429 = ColorMap()
        newColorMap429.LetterComboParent = "aer"
        newColorMap429.ipaParent = "ɛr"
        newColorMap429.color = "darkGreen"
        
        let newColorMap430 = ColorMap()
        newColorMap430.LetterComboParent = "aer"
        newColorMap430.ipaParent = "ɛr"
        newColorMap430.color = "darkGreen"
        
        let newColorMap431 = ColorMap()
        newColorMap431.LetterComboParent = "aer"
        newColorMap431.ipaParent = "ɛr"
        newColorMap431.color = "darkGrey"
        
        newLetterCombo191.colorMapList.append(objectsIn: [newColorMap429,newColorMap430,newColorMap431])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo191])
        //===================================
        let newLetterCombo192 = LetterCombo()
        newLetterCombo192.letterCombo = "air"
        newLetterCombo192.ipaParent = "ɛr"
        
        let newColorMap432 = ColorMap()
        newColorMap432.LetterComboParent = "air"
        newColorMap432.ipaParent = "ɛr"
        newColorMap432.color = "darkGreen"
        
        let newColorMap433 = ColorMap()
        newColorMap433.LetterComboParent = "air"
        newColorMap433.ipaParent = "ɛr"
        newColorMap433.color = "darkGreen"
        
        let newColorMap434 = ColorMap()
        newColorMap434.LetterComboParent = "air"
        newColorMap434.ipaParent = "ɛr"
        newColorMap434.color = "darkGrey"
        
        newLetterCombo192.colorMapList.append(objectsIn: [newColorMap432,newColorMap433,newColorMap434])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo192])
        //===================================
        let newLetterCombo193 = LetterCombo()
        newLetterCombo193.letterCombo = "ear"
        newLetterCombo193.ipaParent = "ɛr"
        
        let newColorMap435 = ColorMap()
        newColorMap435.LetterComboParent = "ear"
        newColorMap435.ipaParent = "ɛr"
        newColorMap435.color = "darkGreen"
        
        let newColorMap436 = ColorMap()
        newColorMap436.LetterComboParent = "ear"
        newColorMap436.ipaParent = "ɛr"
        newColorMap436.color = "darkGreen"
        
        let newColorMap437 = ColorMap()
        newColorMap437.LetterComboParent = "ear"
        newColorMap437.ipaParent = "ɛr"
        newColorMap437.color = "darkGrey"
        
        newLetterCombo193.colorMapList.append(objectsIn: [newColorMap435,newColorMap436,newColorMap437])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo193])
        //===================================
        let newLetterCombo194 = LetterCombo()
        newLetterCombo194.letterCombo = "err"
        newLetterCombo194.ipaParent = "ɛr"
        
        let newColorMap438 = ColorMap()
        newColorMap438.LetterComboParent = "err"
        newColorMap438.ipaParent = "ɛr"
        newColorMap438.color = "darkGreen"
        
        let newColorMap439 = ColorMap()
        newColorMap439.LetterComboParent = "err"
        newColorMap439.ipaParent = "ɛr"
        newColorMap439.color = "darkGrey"
        
        let newColorMap440 = ColorMap()
        newColorMap440.LetterComboParent = "err"
        newColorMap440.ipaParent = "ɛr"
        newColorMap440.color = "darkGrey"
        
        newLetterCombo194.colorMapList.append(objectsIn: [newColorMap438,newColorMap439,newColorMap440])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo194])
        //===================================
        let newLetterCombo196 = LetterCombo()
        newLetterCombo196.letterCombo = "arr"
        newLetterCombo196.ipaParent = "ɛr"
        
        let newColorMap444 = ColorMap()
        newColorMap444.LetterComboParent = "arr"
        newColorMap444.ipaParent = "ɛr"
        newColorMap444.color = "darkGreen"
        
        let newColorMap445 = ColorMap()
        newColorMap445.LetterComboParent = "arr"
        newColorMap445.ipaParent = "ɛr"
        newColorMap445.color = "darkGrey"
        
        let newColorMap446 = ColorMap()
        newColorMap446.LetterComboParent = "arr"
        newColorMap446.ipaParent = "ɛr"
        newColorMap446.color = "darkGrey"
        
        newLetterCombo196.colorMapList.append(objectsIn: [newColorMap444,newColorMap445,newColorMap446])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo196])
        //===================================
        let newLetterCombo605 = LetterCombo()
        newLetterCombo605.letterCombo = "aar"
        newLetterCombo605.ipaParent = "ɛr"
        
        let newColorMap2117 = ColorMap()
        newColorMap2117.LetterComboParent = "aar"
        newColorMap2117.ipaParent = "ɛr"
        newColorMap2117.color = "darkGreen"
        
        let newColorMap2118 = ColorMap()
        newColorMap2118.LetterComboParent = "aar"
        newColorMap2118.ipaParent = "ɛr"
        newColorMap2118.color = "darkGreen"
        
        let newColorMap2119 = ColorMap()
        newColorMap2119.LetterComboParent = "aar"
        newColorMap2119.ipaParent = "ɛr"
        newColorMap2119.color = "darkGrey"
        
        newLetterCombo605.colorMapList.append(objectsIn: [newColorMap2117,newColorMap2118,newColorMap2119])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo605])
        //===================================
        let newLetterCombo197 = LetterCombo()
        newLetterCombo197.letterCombo = "ar"
        newLetterCombo197.ipaParent = "ɛr"
        
        let newColorMap447 = ColorMap()
        newColorMap447.LetterComboParent = "ar"
        newColorMap447.ipaParent = "ɛr"
        newColorMap447.color = "darkGreen"
        
        let newColorMap448 = ColorMap()
        newColorMap448.LetterComboParent = "ar"
        newColorMap448.ipaParent = "ɛr"
        newColorMap448.color = "darkGrey"
        
        newLetterCombo197.colorMapList.append(objectsIn: [newColorMap447,newColorMap448])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo197])
        //===================================
        let newLetterCombo198 = LetterCombo()
        newLetterCombo198.letterCombo = "er"
        newLetterCombo198.ipaParent = "ɛr"
        
        let newColorMap449 = ColorMap()
        newColorMap449.LetterComboParent = "er"
        newColorMap449.ipaParent = "ɛr"
        newColorMap449.color = "darkGreen"
        
        let newColorMap450 = ColorMap()
        newColorMap450.LetterComboParent = "er"
        newColorMap450.ipaParent = "ɛr"
        newColorMap450.color = "darkGrey"
        
        newLetterCombo198.colorMapList.append(objectsIn: [newColorMap449,newColorMap450])
        newIPALetter24.letterCombos.append(objectsIn: [newLetterCombo198])
        
        // =========================================
        // MARK: - "ɡz"
        // =========================================
        let newIPALetter25 = IPALetter()
        newIPALetter25.ipaLetter = "ɡz"
        
        //===================================
        let newLetterCombo741 = LetterCombo()
        newLetterCombo741.letterCombo = "xh"
        newLetterCombo741.ipaParent = "ɡz"
        
        let newColorMap2430 = ColorMap()
        newColorMap2430.LetterComboParent = "xh"
        newColorMap2430.ipaParent = "ɡz"
        newColorMap2430.color = "darkGrey"
        
        let newColorMap2431 = ColorMap()
        newColorMap2431.LetterComboParent = "xh"
        newColorMap2431.ipaParent = "ɡz"
        newColorMap2431.color = "lightGrey"
        
        newLetterCombo741.colorMapList.append(objectsIn: [newColorMap2430,newColorMap2431])
        newIPALetter25.letterCombos.append(objectsIn: [newLetterCombo741])
        //===================================
        let newLetterCombo199 = LetterCombo()
        newLetterCombo199.letterCombo = "x"
        newLetterCombo199.ipaParent = "ɡz"
        
        let newColorMap451 = ColorMap()
        newColorMap451.LetterComboParent = "x"
        newColorMap451.ipaParent = "ɡz"
        newColorMap451.color = "darkGrey"
        
        newLetterCombo199.colorMapList.append(objectsIn: [newColorMap451])
        newIPALetter25.letterCombos.append(objectsIn: [newLetterCombo199])
        
        // =========================================
        // MARK: - "ɪŋ"
        // =========================================
        let newIPALetter26 = IPALetter()
        newIPALetter26.ipaLetter = "ɪŋ"
        
        //===================================
        let newLetterCombo200 = LetterCombo()
        newLetterCombo200.letterCombo = "ing"
        newLetterCombo200.ipaParent = "ɪŋ"
        
        let newColorMap452 = ColorMap()
        newColorMap452.LetterComboParent = "ing"
        newColorMap452.ipaParent = "ɪŋ"
        newColorMap452.color = "seaBlue"
        
        let newColorMap453 = ColorMap()
        newColorMap453.LetterComboParent = "ing"
        newColorMap453.ipaParent = "ɪŋ"
        newColorMap453.color = "darkGrey"
        
        let newColorMap454 = ColorMap()
        newColorMap454.LetterComboParent = "ing"
        newColorMap454.ipaParent = "ɪŋ"
        newColorMap454.color = "darkGrey"
        
        newLetterCombo200.colorMapList.append(objectsIn: [newColorMap452,newColorMap453,newColorMap454])
        newIPALetter26.letterCombos.append(objectsIn: [newLetterCombo200])
        //===================================
        let newLetterCombo201 = LetterCombo()
        newLetterCombo201.letterCombo = "in"
        newLetterCombo201.ipaParent = "ɪŋ"
        
        let newColorMap455 = ColorMap()
        newColorMap455.LetterComboParent = "in"
        newColorMap455.ipaParent = "ɪŋ"
        newColorMap455.color = "seaBlue"
        
        let newColorMap456 = ColorMap()
        newColorMap456.LetterComboParent = "in"
        newColorMap456.ipaParent = "ɪŋ"
        newColorMap456.color = "darkGrey"
        
        newLetterCombo201.colorMapList.append(objectsIn: [newColorMap455,newColorMap456])
        newIPALetter26.letterCombos.append(objectsIn: [newLetterCombo201])
        //===================================
        let newLetterCombo202 = LetterCombo()
        newLetterCombo202.letterCombo = "en"
        newLetterCombo202.ipaParent = "ɪŋ"
        
        let newColorMap457 = ColorMap()
        newColorMap457.LetterComboParent = "en"
        newColorMap457.ipaParent = "ɪŋ"
        newColorMap457.color = "seaBlue"
        
        let newColorMap458 = ColorMap()
        newColorMap458.LetterComboParent = "en"
        newColorMap458.ipaParent = "ɪŋ"
        newColorMap458.color = "darkGrey"
        
        newLetterCombo202.colorMapList.append(objectsIn: [newColorMap457,newColorMap458])
        newIPALetter26.letterCombos.append(objectsIn: [newLetterCombo202])
        //===================================
        let newLetterCombo203 = LetterCombo()
        newLetterCombo203.letterCombo = "yn"
        newLetterCombo203.ipaParent = "ɪŋ"
        
        let newColorMap459 = ColorMap()
        newColorMap459.LetterComboParent = "yn"
        newColorMap459.ipaParent = "ɪŋ"
        newColorMap459.color = "seaBlue"
        
        let newColorMap460 = ColorMap()
        newColorMap460.LetterComboParent = "yn"
        newColorMap460.ipaParent = "ɪŋ"
        newColorMap460.color = "darkGrey"
        
        newLetterCombo203.colorMapList.append(objectsIn: [newColorMap459,newColorMap460])
        newIPALetter26.letterCombos.append(objectsIn: [newLetterCombo203])
        
        // =========================================
        // MARK: - "ɪr"
        // =========================================
        let newIPALetter27 = IPALetter()
        newIPALetter27.ipaLetter = "ɪr"
        
        //===================================
        let newLetterCombo204 = LetterCombo()
        newLetterCombo204.letterCombo = "eir"
        newLetterCombo204.ipaParent = "ɪr"
        
        let newColorMap461 = ColorMap()
        newColorMap461.LetterComboParent = "eir"
        newColorMap461.ipaParent = "ɪr"
        newColorMap461.color = "seaBlue"
        
        let newColorMap462 = ColorMap()
        newColorMap462.LetterComboParent = "eir"
        newColorMap462.ipaParent = "ɪr"
        newColorMap462.color = "seaBlue"
        
        let newColorMap463 = ColorMap()
        newColorMap463.LetterComboParent = "eir"
        newColorMap463.ipaParent = "ɪr"
        newColorMap463.color = "darkGrey"
        
        newLetterCombo204.colorMapList.append(objectsIn: [newColorMap461,newColorMap462,newColorMap463])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo204])
        //===================================
        let newLetterCombo205 = LetterCombo()
        newLetterCombo205.letterCombo = "ier"
        newLetterCombo205.ipaParent = "ɪr"
        
        let newColorMap464 = ColorMap()
        newColorMap464.LetterComboParent = "ier"
        newColorMap464.ipaParent = "ɪr"
        newColorMap464.color = "seaBlue"
        
        let newColorMap465 = ColorMap()
        newColorMap465.LetterComboParent = "ier"
        newColorMap465.ipaParent = "ɪr"
        newColorMap465.color = "seaBlue"
        
        let newColorMap466 = ColorMap()
        newColorMap466.LetterComboParent = "ier"
        newColorMap466.ipaParent = "ɪr"
        newColorMap466.color = "darkGrey"
        
        newLetterCombo205.colorMapList.append(objectsIn: [newColorMap464,newColorMap465,newColorMap466])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo205])
        //===================================
        let newLetterCombo206 = LetterCombo()
        newLetterCombo206.letterCombo = "irr"
        newLetterCombo206.ipaParent = "ɪr"
        
        let newColorMap467 = ColorMap()
        newColorMap467.LetterComboParent = "irr"
        newColorMap467.ipaParent = "ɪr"
        newColorMap467.color = "seaBlue"
        
        let newColorMap468 = ColorMap()
        newColorMap468.LetterComboParent = "irr"
        newColorMap468.ipaParent = "ɪr"
        newColorMap468.color = "darkGrey"
        
        let newColorMap469 = ColorMap()
        newColorMap469.LetterComboParent = "irr"
        newColorMap469.ipaParent = "ɪr"
        newColorMap469.color = "darkGrey"
        
        newLetterCombo206.colorMapList.append(objectsIn: [newColorMap467,newColorMap468,newColorMap469])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo206])
        //===================================
        let newLetterCombo207 = LetterCombo()
        newLetterCombo207.letterCombo = "ere"
        newLetterCombo207.ipaParent = "ɪr"
        
        let newColorMap470 = ColorMap()
        newColorMap470.LetterComboParent = "ere"
        newColorMap470.ipaParent = "ɪr"
        newColorMap470.color = "seaBlue"
        
        let newColorMap471 = ColorMap()
        newColorMap471.LetterComboParent = "ere"
        newColorMap471.ipaParent = "ɪr"
        newColorMap471.color = "darkGrey"
        
        let newColorMap472 = ColorMap()
        newColorMap472.LetterComboParent = "ere"
        newColorMap472.ipaParent = "ɪr"
        newColorMap472.color = "lightGrey"
        
        newLetterCombo207.colorMapList.append(objectsIn: [newColorMap470,newColorMap471,newColorMap472])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo207])
        //===================================
        let newLetterCombo208 = LetterCombo()
        newLetterCombo208.letterCombo = "ear"
        newLetterCombo208.ipaParent = "ɪr"
        
        let newColorMap473 = ColorMap()
        newColorMap473.LetterComboParent = "ear"
        newColorMap473.ipaParent = "ɪr"
        newColorMap473.color = "seaBlue"
        
        let newColorMap474 = ColorMap()
        newColorMap474.LetterComboParent = "ear"
        newColorMap474.ipaParent = "ɪr"
        newColorMap474.color = "seaBlue"
        
        let newColorMap475 = ColorMap()
        newColorMap475.LetterComboParent = "ear"
        newColorMap475.ipaParent = "ɪr"
        newColorMap475.color = "darkGrey"
        
        newLetterCombo208.colorMapList.append(objectsIn: [newColorMap473,newColorMap474,newColorMap475])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo208])
        //===================================
        let newLetterCombo209 = LetterCombo()
        newLetterCombo209.letterCombo = "eer"
        newLetterCombo209.ipaParent = "ɪr"
        
        let newColorMap476 = ColorMap()
        newColorMap476.LetterComboParent = "eer"
        newColorMap476.ipaParent = "ɪr"
        newColorMap476.color = "seaBlue"
        
        let newColorMap477 = ColorMap()
        newColorMap477.LetterComboParent = "eer"
        newColorMap477.ipaParent = "ɪr"
        newColorMap477.color = "seaBlue"
        
        let newColorMap478 = ColorMap()
        newColorMap478.LetterComboParent = "eer"
        newColorMap478.ipaParent = "ɪr"
        newColorMap478.color = "darkGrey"
        
        newLetterCombo209.colorMapList.append(objectsIn: [newColorMap476,newColorMap477,newColorMap478])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo209])
        //===================================
        let newLetterCombo210 = LetterCombo()
        newLetterCombo210.letterCombo = "eor"
        newLetterCombo210.ipaParent = "ɪr"
        
        let newColorMap479 = ColorMap()
        newColorMap479.LetterComboParent = "eor"
        newColorMap479.ipaParent = "ɪr"
        newColorMap479.color = "seaBlue"
        
        let newColorMap480 = ColorMap()
        newColorMap480.LetterComboParent = "eor"
        newColorMap480.ipaParent = "ɪr"
        newColorMap480.color = "seaBlue"
        
        let newColorMap481 = ColorMap()
        newColorMap481.LetterComboParent = "eor"
        newColorMap481.ipaParent = "ɪr"
        newColorMap481.color = "darkGrey"
        
        newLetterCombo210.colorMapList.append(objectsIn: [newColorMap479,newColorMap480,newColorMap481])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo210])
        //===================================
        let newLetterCombo211 = LetterCombo()
        newLetterCombo211.letterCombo = "er"
        newLetterCombo211.ipaParent = "ɪr"
        
        let newColorMap482 = ColorMap()
        newColorMap482.LetterComboParent = "er"
        newColorMap482.ipaParent = "ɪr"
        newColorMap482.color = "seaBlue"
        
        let newColorMap483 = ColorMap()
        newColorMap483.LetterComboParent = "er"
        newColorMap483.ipaParent = "ɪr"
        newColorMap483.color = "darkGrey"
        
        newLetterCombo211.colorMapList.append(objectsIn: [newColorMap482,newColorMap483])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo211])
        //===================================
        let newLetterCombo212 = LetterCombo()
        newLetterCombo212.letterCombo = "ir"
        newLetterCombo212.ipaParent = "ɪr"
        
        let newColorMap484 = ColorMap()
        newColorMap484.LetterComboParent = "ir"
        newColorMap484.ipaParent = "ɪr"
        newColorMap484.color = "seaBlue"
        
        let newColorMap485 = ColorMap()
        newColorMap485.LetterComboParent = "ir"
        newColorMap485.ipaParent = "ɪr"
        newColorMap485.color = "darkGrey"
        
        newLetterCombo212.colorMapList.append(objectsIn: [newColorMap484,newColorMap485])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo212])
        //===================================
        let newLetterCombo213 = LetterCombo()
        newLetterCombo213.letterCombo = "yr"
        newLetterCombo213.ipaParent = "ɪr"
        
        let newColorMap486 = ColorMap()
        newColorMap486.LetterComboParent = "yr"
        newColorMap486.ipaParent = "ɪr"
        newColorMap486.color = "seaBlue"
        
        let newColorMap487 = ColorMap()
        newColorMap487.LetterComboParent = "yr"
        newColorMap487.ipaParent = "ɪr"
        newColorMap487.color = "darkGrey"
        
        newLetterCombo213.colorMapList.append(objectsIn: [newColorMap486,newColorMap487])
        newIPALetter27.letterCombos.append(objectsIn: [newLetterCombo213])
        
        // =========================================
        // MARK: - "jə"
        // =========================================
        let newIPALetter28 = IPALetter()
        newIPALetter28.ipaLetter = "jə"
        
        //===================================
        let newLetterCombo220 = LetterCombo()
        newLetterCombo220.letterCombo = "y'"
        newLetterCombo220.ipaParent = "jə"
        
        let newColorMap501 = ColorMap()
        newColorMap501.LetterComboParent = "y'"
        newColorMap501.ipaParent = "jə"
        newColorMap501.color = "yellow"
        
        let newColorMap502 = ColorMap()
        newColorMap502.LetterComboParent = "y'"
        newColorMap502.ipaParent = "jə"
        newColorMap502.color = "lightGrey"
        
        newLetterCombo220.colorMapList.append(objectsIn: [newColorMap501,newColorMap502])
        newIPALetter28.letterCombos.append(objectsIn: [newLetterCombo220])
        //===================================
        let newLetterCombo221 = LetterCombo()
        newLetterCombo221.letterCombo = "u"
        newLetterCombo221.ipaParent = "jə"
        
        let newColorMap503 = ColorMap()
        newColorMap503.LetterComboParent = "u"
        newColorMap503.ipaParent = "jə"
        newColorMap503.color = "yellow"
        
        newLetterCombo221.colorMapList.append(objectsIn: [newColorMap503])
        newIPALetter28.letterCombos.append(objectsIn: [newLetterCombo221])
        
        // =========================================
        // MARK: - "ju"
        // =========================================
        let newIPALetter30 = IPALetter()
        newIPALetter30.ipaLetter = "ju"
        
        //===================================
        let newLetterCombo233 = LetterCombo()
        newLetterCombo233.letterCombo = "ew"
        newLetterCombo233.ipaParent = "ju"
        
        let newColorMap537 = ColorMap()
        newColorMap537.LetterComboParent = "ew"
        newColorMap537.ipaParent = "ju"
        newColorMap537.color = "yellow"
        
        let newColorMap538 = ColorMap()
        newColorMap538.LetterComboParent = "ew"
        newColorMap538.ipaParent = "ju"
        newColorMap538.color = "yellow"
        
        newLetterCombo233.colorMapList.append(objectsIn: [newColorMap537,newColorMap538])
        newIPALetter30.letterCombos.append(objectsIn: [newLetterCombo233])
        //===================================
        let newLetterCombo237 = LetterCombo()
        newLetterCombo237.letterCombo = "ut"
        newLetterCombo237.ipaParent = "ju"
        
        let newColorMap545 = ColorMap()
        newColorMap545.LetterComboParent = "ut"
        newColorMap545.ipaParent = "ju"
        newColorMap545.color = "yellow"
        
        let newColorMap546 = ColorMap()
        newColorMap546.LetterComboParent = "ut"
        newColorMap546.ipaParent = "ju"
        newColorMap546.color = "lightGrey"
        
        newLetterCombo237.colorMapList.append(objectsIn: [newColorMap545,newColorMap546])
        newIPALetter30.letterCombos.append(objectsIn: [newLetterCombo237])
        //===================================
        let newLetterCombo239 = LetterCombo()
        newLetterCombo239.letterCombo = "u"
        newLetterCombo239.ipaParent = "ju"
        
        let newColorMap549 = ColorMap()
        newColorMap549.LetterComboParent = "u"
        newColorMap549.ipaParent = "ju"
        newColorMap549.color = "yellow"
        
        newLetterCombo239.colorMapList.append(objectsIn: [newColorMap549])
        newIPALetter30.letterCombos.append(objectsIn: [newLetterCombo239])
        
        // =========================================
        // MARK: - "ks"
        // =========================================
        let newIPALetter32 = IPALetter()
        newIPALetter32.ipaLetter = "ks"
        
        //===================================
        let newLetterCombo249 = LetterCombo()
        newLetterCombo249.letterCombo = "xc"
        newLetterCombo249.ipaParent = "ks"
        
        let newColorMap575 = ColorMap()
        newColorMap575.LetterComboParent = "xc"
        newColorMap575.ipaParent = "ks"
        newColorMap575.color = "black"
        
        let newColorMap576 = ColorMap()
        newColorMap576.LetterComboParent = "xc"
        newColorMap576.ipaParent = "ks"
        newColorMap576.color = "lightGrey"
        
        newLetterCombo249.colorMapList.append(objectsIn: [newColorMap575,newColorMap576])
        newIPALetter32.letterCombos.append(objectsIn: [newLetterCombo249])
        //===================================
        let newLetterCombo251 = LetterCombo()
        newLetterCombo251.letterCombo = "xe"
        newLetterCombo251.ipaParent = "ks"
        
        let newColorMap579 = ColorMap()
        newColorMap579.LetterComboParent = "xe"
        newColorMap579.ipaParent = "ks"
        newColorMap579.color = "black"
        
        let newColorMap580 = ColorMap()
        newColorMap580.LetterComboParent = "xe"
        newColorMap580.ipaParent = "ks"
        newColorMap580.color = "lightGrey"
        
        newLetterCombo251.colorMapList.append(objectsIn: [newColorMap579,newColorMap580])
        newIPALetter32.letterCombos.append(objectsIn: [newLetterCombo251])
        //===================================
        let newLetterCombo252 = LetterCombo()
        newLetterCombo252.letterCombo = "x"
        newLetterCombo252.ipaParent = "ks"
        
        let newColorMap581 = ColorMap()
        newColorMap581.LetterComboParent = "x"
        newColorMap581.ipaParent = "ks"
        newColorMap581.color = "black"
        
        newLetterCombo252.colorMapList.append(objectsIn: [newColorMap581])
        newIPALetter32.letterCombos.append(objectsIn: [newLetterCombo252])
        
        // =========================================
        // MARK: - "kʃ"
        // =========================================
        let newIPALetter33 = IPALetter()
        newIPALetter33.ipaLetter = "kʃ"
        
        //===================================
        let newLetterCombo254 = LetterCombo()
        newLetterCombo254.letterCombo = "x"
        newLetterCombo254.ipaParent = "kʃ"
        
        let newColorMap585 = ColorMap()
        newColorMap585.LetterComboParent = "x"
        newColorMap585.ipaParent = "kʃ"
        newColorMap585.color = "yellow"
        
        newLetterCombo254.colorMapList.append(objectsIn: [newColorMap585])
        newIPALetter33.letterCombos.append(objectsIn: [newLetterCombo254])
        
        // =========================================
        // MARK: - "kw"
        // =========================================
        let newIPALetter34 = IPALetter()
        newIPALetter34.ipaLetter = "kw"
        
        //===================================
        let newLetterCombo255 = LetterCombo()
        newLetterCombo255.letterCombo = "cqu"
        newLetterCombo255.ipaParent = "kw"
        
        let newColorMap586 = ColorMap()
        newColorMap586.LetterComboParent = "cqu"
        newColorMap586.ipaParent = "kw"
        newColorMap586.color = "lightGrey"
        
        let newColorMap587 = ColorMap()
        newColorMap587.LetterComboParent = "cqu"
        newColorMap587.ipaParent = "kw"
        newColorMap587.color = "black"
        
        let newColorMap588 = ColorMap()
        newColorMap588.LetterComboParent = "cqu"
        newColorMap588.ipaParent = "kw"
        newColorMap588.color = "black"
        
        newLetterCombo255.colorMapList.append(objectsIn: [newColorMap586,newColorMap587,newColorMap588])
        newIPALetter34.letterCombos.append(objectsIn: [newLetterCombo255])
        //===================================
        let newLetterCombo257 = LetterCombo()
        newLetterCombo257.letterCombo = "qu"
        newLetterCombo257.ipaParent = "kw"
        
        let newColorMap592 = ColorMap()
        newColorMap592.LetterComboParent = "qu"
        newColorMap592.ipaParent = "kw"
        newColorMap592.color = "black"
        
        let newColorMap593 = ColorMap()
        newColorMap593.LetterComboParent = "qu"
        newColorMap593.ipaParent = "kw"
        newColorMap593.color = "black"
        
        newLetterCombo257.colorMapList.append(objectsIn: [newColorMap592,newColorMap593])
        newIPALetter34.letterCombos.append(objectsIn: [newLetterCombo257])
        
        // =========================================
        // MARK: - "oʊ"
        // =========================================
        let newIPALetter35 = IPALetter()
        newIPALetter35.ipaLetter = "oʊ"
        
        //===================================
        let newLetterCombo259 = LetterCombo()
        newLetterCombo259.letterCombo = "ough"
        newLetterCombo259.ipaParent = "oʊ"
        
        let newColorMap596 = ColorMap()
        newColorMap596.LetterComboParent = "ough"
        newColorMap596.ipaParent = "oʊ"
        newColorMap596.color = "purple"
        
        let newColorMap597 = ColorMap()
        newColorMap597.LetterComboParent = "ough"
        newColorMap597.ipaParent = "oʊ"
        newColorMap597.color = "purple"
        
        let newColorMap598 = ColorMap()
        newColorMap598.LetterComboParent = "ough"
        newColorMap598.ipaParent = "oʊ"
        newColorMap598.color = "lightGrey"
        
        let newColorMap599 = ColorMap()
        newColorMap599.LetterComboParent = "ough"
        newColorMap599.ipaParent = "oʊ"
        newColorMap599.color = "lightGrey"
        
        newLetterCombo259.colorMapList.append(objectsIn: [newColorMap596,newColorMap597,newColorMap598,newColorMap599])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo259])
        //===================================
        let newLetterCombo260 = LetterCombo()
        newLetterCombo260.letterCombo = "owe"
        newLetterCombo260.ipaParent = "oʊ"
        
        let newColorMap600 = ColorMap()
        newColorMap600.LetterComboParent = "owe"
        newColorMap600.ipaParent = "oʊ"
        newColorMap600.color = "purple"
        
        let newColorMap601 = ColorMap()
        newColorMap601.LetterComboParent = "owe"
        newColorMap601.ipaParent = "oʊ"
        newColorMap601.color = "lightGrey"
        
        let newColorMap602 = ColorMap()
        newColorMap602.LetterComboParent = "owe"
        newColorMap602.ipaParent = "oʊ"
        newColorMap602.color = "lightGrey"
        
        newLetterCombo260.colorMapList.append(objectsIn: [newColorMap600,newColorMap601,newColorMap602])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo260])
        //===================================
        let newLetterCombo261 = LetterCombo()
        newLetterCombo261.letterCombo = "eau"
        newLetterCombo261.ipaParent = "oʊ"
        
        let newColorMap603 = ColorMap()
        newColorMap603.LetterComboParent = "eau"
        newColorMap603.ipaParent = "oʊ"
        newColorMap603.color = "purple"
        
        let newColorMap604 = ColorMap()
        newColorMap604.LetterComboParent = "eau"
        newColorMap604.ipaParent = "oʊ"
        newColorMap604.color = "purple"
        
        let newColorMap605 = ColorMap()
        newColorMap605.LetterComboParent = "eau"
        newColorMap605.ipaParent = "oʊ"
        newColorMap605.color = "purple"
        
        newLetterCombo261.colorMapList.append(objectsIn: [newColorMap603,newColorMap604,newColorMap605])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo261])
        //===================================
        let newLetterCombo262 = LetterCombo()
        newLetterCombo262.letterCombo = "aoh"
        newLetterCombo262.ipaParent = "oʊ"
        
        let newColorMap606 = ColorMap()
        newColorMap606.LetterComboParent = "aoh"
        newColorMap606.ipaParent = "oʊ"
        newColorMap606.color = "purple"
        
        let newColorMap607 = ColorMap()
        newColorMap607.LetterComboParent = "aoh"
        newColorMap607.ipaParent = "oʊ"
        newColorMap607.color = "purple"
        
        let newColorMap608 = ColorMap()
        newColorMap608.LetterComboParent = "aoh"
        newColorMap608.ipaParent = "oʊ"
        newColorMap608.color = "lightGrey"
        
        newLetterCombo262.colorMapList.append(objectsIn: [newColorMap606,newColorMap607,newColorMap608])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo262])
        //===================================
        let newLetterCombo263 = LetterCombo()
        newLetterCombo263.letterCombo = "ow"
        newLetterCombo263.ipaParent = "oʊ"
        
        let newColorMap609 = ColorMap()
        newColorMap609.LetterComboParent = "ow"
        newColorMap609.ipaParent = "oʊ"
        newColorMap609.color = "purple"
        
        let newColorMap610 = ColorMap()
        newColorMap610.LetterComboParent = "ow"
        newColorMap610.ipaParent = "oʊ"
        newColorMap610.color = "lightGrey"
        
        newLetterCombo263.colorMapList.append(objectsIn: [newColorMap609,newColorMap610])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo263])
        //===================================
        let newLetterCombo264 = LetterCombo()
        newLetterCombo264.letterCombo = "oa"
        newLetterCombo264.ipaParent = "oʊ"
        
        let newColorMap611 = ColorMap()
        newColorMap611.LetterComboParent = "oa"
        newColorMap611.ipaParent = "oʊ"
        newColorMap611.color = "purple"
        
        let newColorMap612 = ColorMap()
        newColorMap612.LetterComboParent = "oa"
        newColorMap612.ipaParent = "oʊ"
        newColorMap612.color = "purple"
        
        newLetterCombo264.colorMapList.append(objectsIn: [newColorMap611,newColorMap612])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo264])
        //===================================
        let newLetterCombo265 = LetterCombo()
        newLetterCombo265.letterCombo = "ew"
        newLetterCombo265.ipaParent = "oʊ"
        
        let newColorMap613 = ColorMap()
        newColorMap613.LetterComboParent = "ew"
        newColorMap613.ipaParent = "oʊ"
        newColorMap613.color = "purple"
        
        let newColorMap614 = ColorMap()
        newColorMap614.LetterComboParent = "ew"
        newColorMap614.ipaParent = "oʊ"
        newColorMap614.color = "lightGrey"
        
        newLetterCombo265.colorMapList.append(objectsIn: [newColorMap613,newColorMap614])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo265])
        //===================================
        let newLetterCombo266 = LetterCombo()
        newLetterCombo266.letterCombo = "oe"
        newLetterCombo266.ipaParent = "oʊ"
        
        let newColorMap615 = ColorMap()
        newColorMap615.LetterComboParent = "oe"
        newColorMap615.ipaParent = "oʊ"
        newColorMap615.color = "purple"
        
        let newColorMap616 = ColorMap()
        newColorMap616.LetterComboParent = "oe"
        newColorMap616.ipaParent = "oʊ"
        newColorMap616.color = "purple"
        
        newLetterCombo266.colorMapList.append(objectsIn: [newColorMap615,newColorMap616])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo266])
        //===================================
        let newLetterCombo267 = LetterCombo()
        newLetterCombo267.letterCombo = "oh"
        newLetterCombo267.ipaParent = "oʊ"
        
        let newColorMap617 = ColorMap()
        newColorMap617.LetterComboParent = "oh"
        newColorMap617.ipaParent = "oʊ"
        newColorMap617.color = "purple"
        
        let newColorMap618 = ColorMap()
        newColorMap618.LetterComboParent = "oh"
        newColorMap618.ipaParent = "oʊ"
        newColorMap618.color = "lightGrey"
        
        newLetterCombo267.colorMapList.append(objectsIn: [newColorMap617,newColorMap618])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo267])
        //===================================
        let newLetterCombo268 = LetterCombo()
        newLetterCombo268.letterCombo = "ot"
        newLetterCombo268.ipaParent = "oʊ"
        
        let newColorMap619 = ColorMap()
        newColorMap619.LetterComboParent = "ot"
        newColorMap619.ipaParent = "oʊ"
        newColorMap619.color = "purple"
        
        let newColorMap620 = ColorMap()
        newColorMap620.LetterComboParent = "ot"
        newColorMap620.ipaParent = "oʊ"
        newColorMap620.color = "lightGrey"
        
        newLetterCombo268.colorMapList.append(objectsIn: [newColorMap619,newColorMap620])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo268])
        //===================================
        let newLetterCombo269 = LetterCombo()
        newLetterCombo269.letterCombo = "ou"
        newLetterCombo269.ipaParent = "oʊ"
        
        let newColorMap621 = ColorMap()
        newColorMap621.LetterComboParent = "ou"
        newColorMap621.ipaParent = "oʊ"
        newColorMap621.color = "purple"
        
        let newColorMap622 = ColorMap()
        newColorMap622.LetterComboParent = "ou"
        newColorMap622.ipaParent = "oʊ"
        newColorMap622.color = "purple"
        
        newLetterCombo269.colorMapList.append(objectsIn: [newColorMap621,newColorMap622])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo269])
        //===================================
        let newLetterCombo270 = LetterCombo()
        newLetterCombo270.letterCombo = "o"
        newLetterCombo270.ipaParent = "oʊ"
        
        let newColorMap623 = ColorMap()
        newColorMap623.LetterComboParent = "o"
        newColorMap623.ipaParent = "oʊ"
        newColorMap623.color = "purple"
        
        newLetterCombo270.colorMapList.append(objectsIn: [newColorMap623])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo270])
        //===================================
        let newLetterCombo606 = LetterCombo()
        newLetterCombo606.letterCombo = "e"
        newLetterCombo606.ipaParent = "oʊ"
        
        let newColorMap2120 = ColorMap()
        newColorMap2120.LetterComboParent = "e"
        newColorMap2120.ipaParent = "oʊ"
        newColorMap2120.color = "purple"
        
        newLetterCombo606.colorMapList.append(objectsIn: [newColorMap2120])
        newIPALetter35.letterCombos.append(objectsIn: [newLetterCombo606])
        
        // =========================================
        // MARK: - "ɔɪ"
        // =========================================
        let newIPALetter36 = IPALetter()
        newIPALetter36.ipaLetter = "ɔɪ"
        
        //===================================
        let newLetterCombo271 = LetterCombo()
        newLetterCombo271.letterCombo = "awy"
        newLetterCombo271.ipaParent = "ɔɪ"
        
        let newColorMap624 = ColorMap()
        newColorMap624.LetterComboParent = "awy"
        newColorMap624.ipaParent = "ɔɪ"
        newColorMap624.color = "turquoise"
        
        let newColorMap625 = ColorMap()
        newColorMap625.LetterComboParent = "awy"
        newColorMap625.ipaParent = "ɔɪ"
        newColorMap625.color = "turquoise"
        
        let newColorMap626 = ColorMap()
        newColorMap626.LetterComboParent = "awy"
        newColorMap626.ipaParent = "ɔɪ"
        newColorMap626.color = "turquoise"
        
        newLetterCombo271.colorMapList.append(objectsIn: [newColorMap624,newColorMap625,newColorMap626])
        newIPALetter36.letterCombos.append(objectsIn: [newLetterCombo271])
        //===================================
        let newLetterCombo272 = LetterCombo()
        newLetterCombo272.letterCombo = "uoy"
        newLetterCombo272.ipaParent = "ɔɪ"
        
        let newColorMap627 = ColorMap()
        newColorMap627.LetterComboParent = "uoy"
        newColorMap627.ipaParent = "ɔɪ"
        newColorMap627.color = "turquoise"
        
        let newColorMap628 = ColorMap()
        newColorMap628.LetterComboParent = "uoy"
        newColorMap628.ipaParent = "ɔɪ"
        newColorMap628.color = "turquoise"
        
        let newColorMap629 = ColorMap()
        newColorMap629.LetterComboParent = "uoy"
        newColorMap629.ipaParent = "ɔɪ"
        newColorMap629.color = "turquoise"
        
        newLetterCombo272.colorMapList.append(objectsIn: [newColorMap627,newColorMap628,newColorMap629])
        newIPALetter36.letterCombos.append(objectsIn: [newLetterCombo272])
        //===================================
        let newLetterCombo273 = LetterCombo()
        newLetterCombo273.letterCombo = "ois"
        newLetterCombo273.ipaParent = "ɔɪ"
        
        let newColorMap630 = ColorMap()
        newColorMap630.LetterComboParent = "ois"
        newColorMap630.ipaParent = "ɔɪ"
        newColorMap630.color = "turquoise"
        
        let newColorMap631 = ColorMap()
        newColorMap631.LetterComboParent = "ois"
        newColorMap631.ipaParent = "ɔɪ"
        newColorMap631.color = "turquoise"
        
        let newColorMap632 = ColorMap()
        newColorMap632.LetterComboParent = "ois"
        newColorMap632.ipaParent = "ɔɪ"
        newColorMap632.color = "lightGrey"
        
        newLetterCombo273.colorMapList.append(objectsIn: [newColorMap630,newColorMap631,newColorMap632])
        newIPALetter36.letterCombos.append(objectsIn: [newLetterCombo273])
        //===================================
        let newLetterCombo274 = LetterCombo()
        newLetterCombo274.letterCombo = "oi"
        newLetterCombo274.ipaParent = "ɔɪ"
        
        let newColorMap633 = ColorMap()
        newColorMap633.LetterComboParent = "oi"
        newColorMap633.ipaParent = "ɔɪ"
        newColorMap633.color = "turquoise"
        
        let newColorMap634 = ColorMap()
        newColorMap634.LetterComboParent = "oi"
        newColorMap634.ipaParent = "ɔɪ"
        newColorMap634.color = "turquoise"
        
        newLetterCombo274.colorMapList.append(objectsIn: [newColorMap633,newColorMap634])
        newIPALetter36.letterCombos.append(objectsIn: [newLetterCombo274])
        //===================================
        let newLetterCombo275 = LetterCombo()
        newLetterCombo275.letterCombo = "oy"
        newLetterCombo275.ipaParent = "ɔɪ"
        
        let newColorMap635 = ColorMap()
        newColorMap635.LetterComboParent = "oy"
        newColorMap635.ipaParent = "ɔɪ"
        newColorMap635.color = "turquoise"
        
        let newColorMap636 = ColorMap()
        newColorMap636.LetterComboParent = "oy"
        newColorMap636.ipaParent = "ɔɪ"
        newColorMap636.color = "turquoise"
        
        newLetterCombo275.colorMapList.append(objectsIn: [newColorMap635,newColorMap636])
        newIPALetter36.letterCombos.append(objectsIn: [newLetterCombo275])
        //===================================
        let newLetterCombo276 = LetterCombo()
        newLetterCombo276.letterCombo = "eu"
        newLetterCombo276.ipaParent = "ɔɪ"
        
        let newColorMap637 = ColorMap()
        newColorMap637.LetterComboParent = "eu"
        newColorMap637.ipaParent = "ɔɪ"
        newColorMap637.color = "turquoise"
        
        let newColorMap638 = ColorMap()
        newColorMap638.LetterComboParent = "eu"
        newColorMap638.ipaParent = "ɔɪ"
        newColorMap638.color = "turquoise"
        
        newLetterCombo276.colorMapList.append(objectsIn: [newColorMap637,newColorMap638])
        newIPALetter36.letterCombos.append(objectsIn: [newLetterCombo276])
        //===================================
        let newLetterCombo607 = LetterCombo()
        newLetterCombo607.letterCombo = "aw"
        newLetterCombo607.ipaParent = "ɔɪ"
        
        let newColorMap2121 = ColorMap()
        newColorMap2121.LetterComboParent = "aw"
        newColorMap2121.ipaParent = "ɔɪ"
        newColorMap2121.color = "turquoise"
        
        let newColorMap2122 = ColorMap()
        newColorMap2122.LetterComboParent = "aw"
        newColorMap2122.ipaParent = "ɔɪ"
        newColorMap2122.color = "lightGrey"
        
        newLetterCombo607.colorMapList.append(objectsIn: [newColorMap2121,newColorMap2122])
        newIPALetter36.letterCombos.append(objectsIn: [newLetterCombo607])
        //===================================
        let newLetterCombo608 = LetterCombo()
        newLetterCombo608.letterCombo = "uo"
        newLetterCombo608.ipaParent = "ɔɪ"
        
        let newColorMap2123 = ColorMap()
        newColorMap2123.LetterComboParent = "uo"
        newColorMap2123.ipaParent = "ɔɪ"
        newColorMap2123.color = "turquoise"
        
        let newColorMap2124 = ColorMap()
        newColorMap2124.LetterComboParent = "uo"
        newColorMap2124.ipaParent = "ɔɪ"
        newColorMap2124.color = "turquoise"
        
        newLetterCombo608.colorMapList.append(objectsIn: [newColorMap2123,newColorMap2124])
        newIPALetter36.letterCombos.append(objectsIn: [newLetterCombo608])
        //===================================
        let newLetterCombo609 = LetterCombo()
        newLetterCombo609.letterCombo = "o"
        newLetterCombo609.ipaParent = "ɔɪ"
        
        let newColorMap2125 = ColorMap()
        newColorMap2125.LetterComboParent = "o"
        newColorMap2125.ipaParent = "ɔɪ"
        newColorMap2125.color = "turquoise"
        
        newLetterCombo609.colorMapList.append(objectsIn: [newColorMap2125])
        newIPALetter36.letterCombos.append(objectsIn: [newLetterCombo609])
        
        // =========================================
        // MARK: - "ɔr"
        // =========================================
        let newIPALetter38 = IPALetter()
        newIPALetter38.ipaLetter = "ɔr"
        
        //===================================
        let newLetterCombo278 = LetterCombo()
        newLetterCombo278.letterCombo = "owar"
        newLetterCombo278.ipaParent = "ɔr"
        
        let newColorMap642 = ColorMap()
        newColorMap642.LetterComboParent = "owar"
        newColorMap642.ipaParent = "ɔr"
        newColorMap642.color = "purple"
        
        let newColorMap643 = ColorMap()
        newColorMap643.LetterComboParent = "owar"
        newColorMap643.ipaParent = "ɔr"
        newColorMap643.color = "lightGrey"
        
        let newColorMap644 = ColorMap()
        newColorMap644.LetterComboParent = "owar"
        newColorMap644.ipaParent = "ɔr"
        newColorMap644.color = "lightGrey"
        
        let newColorMap645 = ColorMap()
        newColorMap645.LetterComboParent = "owar"
        newColorMap645.ipaParent = "ɔr"
        newColorMap645.color = "darkGrey"
        
        newLetterCombo278.colorMapList.append(objectsIn: [newColorMap642,newColorMap643,newColorMap644,newColorMap645])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo278])
        //===================================
        let newLetterCombo279 = LetterCombo()
        newLetterCombo279.letterCombo = "orr"
        newLetterCombo279.ipaParent = "ɔr"
        
        let newColorMap646 = ColorMap()
        newColorMap646.LetterComboParent = "orr"
        newColorMap646.ipaParent = "ɔr"
        newColorMap646.color = "purple"
        
        let newColorMap647 = ColorMap()
        newColorMap647.LetterComboParent = "orr"
        newColorMap647.ipaParent = "ɔr"
        newColorMap647.color = "darkGrey"
        
        let newColorMap648 = ColorMap()
        newColorMap648.LetterComboParent = "orr"
        newColorMap648.ipaParent = "ɔr"
        newColorMap648.color = "darkGrey"
        
        newLetterCombo279.colorMapList.append(objectsIn: [newColorMap646,newColorMap647,newColorMap648])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo279])
        //===================================
        let newLetterCombo280 = LetterCombo()
        newLetterCombo280.letterCombo = "oor"
        newLetterCombo280.ipaParent = "ɔr"
        
        let newColorMap649 = ColorMap()
        newColorMap649.LetterComboParent = "oor"
        newColorMap649.ipaParent = "ɔr"
        newColorMap649.color = "purple"
        
        let newColorMap650 = ColorMap()
        newColorMap650.LetterComboParent = "oor"
        newColorMap650.ipaParent = "ɔr"
        newColorMap650.color = "purple"
        
        let newColorMap651 = ColorMap()
        newColorMap651.LetterComboParent = "oor"
        newColorMap651.ipaParent = "ɔr"
        newColorMap651.color = "darkGrey"
        
        newLetterCombo280.colorMapList.append(objectsIn: [newColorMap649,newColorMap650,newColorMap651])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo280])
        //===================================
        let newLetterCombo281 = LetterCombo()
        newLetterCombo281.letterCombo = "our"
        newLetterCombo281.ipaParent = "ɔr"
        
        let newColorMap652 = ColorMap()
        newColorMap652.LetterComboParent = "our"
        newColorMap652.ipaParent = "ɔr"
        newColorMap652.color = "purple"
        
        let newColorMap653 = ColorMap()
        newColorMap653.LetterComboParent = "our"
        newColorMap653.ipaParent = "ɔr"
        newColorMap653.color = "purple"
        
        let newColorMap654 = ColorMap()
        newColorMap654.LetterComboParent = "our"
        newColorMap654.ipaParent = "ɔr"
        newColorMap654.color = "darkGrey"
        
        newLetterCombo281.colorMapList.append(objectsIn: [newColorMap652,newColorMap653,newColorMap654])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo281])
        //===================================
        let newLetterCombo282 = LetterCombo()
        newLetterCombo282.letterCombo = "ore"
        newLetterCombo282.ipaParent = "ɔr"
        
        let newColorMap655 = ColorMap()
        newColorMap655.LetterComboParent = "ore"
        newColorMap655.ipaParent = "ɔr"
        newColorMap655.color = "purple"
        
        let newColorMap656 = ColorMap()
        newColorMap656.LetterComboParent = "ore"
        newColorMap656.ipaParent = "ɔr"
        newColorMap656.color = "darkGrey"
        
        let newColorMap657 = ColorMap()
        newColorMap657.LetterComboParent = "ore"
        newColorMap657.ipaParent = "ɔr"
        newColorMap657.color = "lightGrey"
        
        newLetterCombo282.colorMapList.append(objectsIn: [newColorMap655,newColorMap656,newColorMap657])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo282])
        //===================================
        let newLetterCombo283 = LetterCombo()
        newLetterCombo283.letterCombo = "oar"
        newLetterCombo283.ipaParent = "ɔr"
        
        let newColorMap658 = ColorMap()
        newColorMap658.LetterComboParent = "oar"
        newColorMap658.ipaParent = "ɔr"
        newColorMap658.color = "purple"
        
        let newColorMap659 = ColorMap()
        newColorMap659.LetterComboParent = "oar"
        newColorMap659.ipaParent = "ɔr"
        newColorMap659.color = "purple"
        
        let newColorMap660 = ColorMap()
        newColorMap660.LetterComboParent = "oar"
        newColorMap660.ipaParent = "ɔr"
        newColorMap660.color = "darkGrey"
        
        newLetterCombo283.colorMapList.append(objectsIn: [newColorMap658,newColorMap659,newColorMap660])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo283])
        //===================================
        let newLetterCombo284 = LetterCombo()
        newLetterCombo284.letterCombo = "arr"
        newLetterCombo284.ipaParent = "ɔr"
        
        let newColorMap661 = ColorMap()
        newColorMap661.LetterComboParent = "arr"
        newColorMap661.ipaParent = "ɔr"
        newColorMap661.color = "purple"
        
        let newColorMap662 = ColorMap()
        newColorMap662.LetterComboParent = "arr"
        newColorMap662.ipaParent = "ɔr"
        newColorMap662.color = "darkGrey"
        
        let newColorMap663 = ColorMap()
        newColorMap663.LetterComboParent = "arr"
        newColorMap663.ipaParent = "ɔr"
        newColorMap663.color = "darkGrey"
        
        newLetterCombo284.colorMapList.append(objectsIn: [newColorMap661,newColorMap662,newColorMap663])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo284])
        //===================================
        let newLetterCombo285 = LetterCombo()
        newLetterCombo285.letterCombo = "awr"
        newLetterCombo285.ipaParent = "ɔr"
        
        let newColorMap664 = ColorMap()
        newColorMap664.LetterComboParent = "awr"
        newColorMap664.ipaParent = "ɔr"
        newColorMap664.color = "purple"
        
        let newColorMap665 = ColorMap()
        newColorMap665.LetterComboParent = "awr"
        newColorMap665.ipaParent = "ɔr"
        newColorMap665.color = "lightGrey"
        
        let newColorMap666 = ColorMap()
        newColorMap666.LetterComboParent = "awr"
        newColorMap666.ipaParent = "ɔr"
        newColorMap666.color = "darkGrey"
        
        newLetterCombo285.colorMapList.append(objectsIn: [newColorMap664,newColorMap665,newColorMap666])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo285])
        //===================================
        let newLetterCombo287 = LetterCombo()
        newLetterCombo287.letterCombo = "aur"
        newLetterCombo287.ipaParent = "ɔr"
        
        let newColorMap670 = ColorMap()
        newColorMap670.LetterComboParent = "aur"
        newColorMap670.ipaParent = "ɔr"
        newColorMap670.color = "purple"
        
        let newColorMap671 = ColorMap()
        newColorMap671.LetterComboParent = "aur"
        newColorMap671.ipaParent = "ɔr"
        newColorMap671.color = "purple"
        
        let newColorMap672 = ColorMap()
        newColorMap672.LetterComboParent = "aur"
        newColorMap672.ipaParent = "ɔr"
        newColorMap672.color = "darkGrey"
        
        newLetterCombo287.colorMapList.append(objectsIn: [newColorMap670,newColorMap671,newColorMap672])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo287])
        //===================================
        let newLetterCombo288 = LetterCombo()
        newLetterCombo288.letterCombo = "aor"
        newLetterCombo288.ipaParent = "ɔr"
        
        let newColorMap673 = ColorMap()
        newColorMap673.LetterComboParent = "aor"
        newColorMap673.ipaParent = "ɔr"
        newColorMap673.color = "purple"
        
        let newColorMap674 = ColorMap()
        newColorMap674.LetterComboParent = "aor"
        newColorMap674.ipaParent = "ɔr"
        newColorMap674.color = "purple"
        
        let newColorMap675 = ColorMap()
        newColorMap675.LetterComboParent = "aor"
        newColorMap675.ipaParent = "ɔr"
        newColorMap675.color = "darkGrey"
        
        newLetterCombo288.colorMapList.append(objectsIn: [newColorMap673,newColorMap674,newColorMap675])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo288])
        //===================================
        let newLetterCombo610 = LetterCombo()
        newLetterCombo610.letterCombo = "ort"
        newLetterCombo610.ipaParent = "ɔr"
        
        let newColorMap2126 = ColorMap()
        newColorMap2126.LetterComboParent = "ort"
        newColorMap2126.ipaParent = "ɔr"
        newColorMap2126.color = "purple"
        
        let newColorMap2127 = ColorMap()
        newColorMap2127.LetterComboParent = "ort"
        newColorMap2127.ipaParent = "ɔr"
        newColorMap2127.color = "darkGrey"
        
        let newColorMap2128 = ColorMap()
        newColorMap2128.LetterComboParent = "ort"
        newColorMap2128.ipaParent = "ɔr"
        newColorMap2128.color = "lightGrey"
        
        newLetterCombo610.colorMapList.append(objectsIn: [newColorMap2126,newColorMap2127,newColorMap2128])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo610])
        //===================================
        let newLetterCombo289 = LetterCombo()
        newLetterCombo289.letterCombo = "or"
        newLetterCombo289.ipaParent = "ɔr"
        
        let newColorMap676 = ColorMap()
        newColorMap676.LetterComboParent = "or"
        newColorMap676.ipaParent = "ɔr"
        newColorMap676.color = "purple"
        
        let newColorMap677 = ColorMap()
        newColorMap677.LetterComboParent = "or"
        newColorMap677.ipaParent = "ɔr"
        newColorMap677.color = "darkGrey"
        
        newLetterCombo289.colorMapList.append(objectsIn: [newColorMap676,newColorMap677])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo289])
        //===================================
        let newLetterCombo290 = LetterCombo()
        newLetterCombo290.letterCombo = "ar"
        newLetterCombo290.ipaParent = "ɔr"
        
        let newColorMap678 = ColorMap()
        newColorMap678.LetterComboParent = "ar"
        newColorMap678.ipaParent = "ɔr"
        newColorMap678.color = "purple"
        
        let newColorMap679 = ColorMap()
        newColorMap679.LetterComboParent = "ar"
        newColorMap679.ipaParent = "ɔr"
        newColorMap679.color = "darkGrey"
        
        newLetterCombo290.colorMapList.append(objectsIn: [newColorMap678,newColorMap679])
        newIPALetter38.letterCombos.append(objectsIn: [newLetterCombo290])
        
        // =========================================
        // MARK: - "tʃ"
        // =========================================
        let newIPALetter39 = IPALetter()
        newIPALetter39.ipaLetter = "tʃ"
        
        //===================================
        let newLetterCombo291 = LetterCombo()
        newLetterCombo291.letterCombo = "tch"
        newLetterCombo291.ipaParent = "tʃ"
        
        let newColorMap680 = ColorMap()
        newColorMap680.LetterComboParent = "tch"
        newColorMap680.ipaParent = "tʃ"
        newColorMap680.color = "brownRed"
        
        let newColorMap681 = ColorMap()
        newColorMap681.LetterComboParent = "tch"
        newColorMap681.ipaParent = "tʃ"
        newColorMap681.color = "brownRed"
        
        let newColorMap682 = ColorMap()
        newColorMap682.LetterComboParent = "tch"
        newColorMap682.ipaParent = "tʃ"
        newColorMap682.color = "brownRed"
        
        newLetterCombo291.colorMapList.append(objectsIn: [newColorMap680,newColorMap681,newColorMap682])
        newIPALetter39.letterCombos.append(objectsIn: [newLetterCombo291])
        //===================================
        let newLetterCombo293 = LetterCombo()
        newLetterCombo293.letterCombo = "che"
        newLetterCombo293.ipaParent = "tʃ"
        
        let newColorMap686 = ColorMap()
        newColorMap686.LetterComboParent = "che"
        newColorMap686.ipaParent = "tʃ"
        newColorMap686.color = "brownRed"
        
        let newColorMap687 = ColorMap()
        newColorMap687.LetterComboParent = "che"
        newColorMap687.ipaParent = "tʃ"
        newColorMap687.color = "brownRed"
        
        let newColorMap688 = ColorMap()
        newColorMap688.LetterComboParent = "che"
        newColorMap688.ipaParent = "tʃ"
        newColorMap688.color = "lightGrey"
        
        newLetterCombo293.colorMapList.append(objectsIn: [newColorMap686,newColorMap687,newColorMap688])
        newIPALetter39.letterCombos.append(objectsIn: [newLetterCombo293])
        //====================================
        let newLetterCombo297 = LetterCombo()
        newLetterCombo297.letterCombo = "ch"
        newLetterCombo297.ipaParent = "tʃ"
        
        let newColorMap695 = ColorMap()
        newColorMap695.LetterComboParent = "ch"
        newColorMap695.ipaParent = "tʃ"
        newColorMap695.color = "brownRed"
        
        let newColorMap696 = ColorMap()
        newColorMap696.LetterComboParent = "ch"
        newColorMap696.ipaParent = "tʃ"
        newColorMap696.color = "brownRed"
        
        newLetterCombo297.colorMapList.append(objectsIn: [newColorMap695,newColorMap696])
        newIPALetter39.letterCombos.append(objectsIn: [newLetterCombo297])
        //===================================
        let newLetterCombo298 = LetterCombo()
        newLetterCombo298.letterCombo = "cz"
        newLetterCombo298.ipaParent = "tʃ"
        
        let newColorMap697 = ColorMap()
        newColorMap697.LetterComboParent = "cz"
        newColorMap697.ipaParent = "tʃ"
        newColorMap697.color = "brownRed"
        
        let newColorMap698 = ColorMap()
        newColorMap698.LetterComboParent = "cz"
        newColorMap698.ipaParent = "tʃ"
        newColorMap698.color = "brownRed"
        
        newLetterCombo298.colorMapList.append(objectsIn: [newColorMap697,newColorMap698])
        newIPALetter39.letterCombos.append(objectsIn: [newLetterCombo298])
        //===================================
        let newLetterCombo611 = LetterCombo()
        newLetterCombo611.letterCombo = "cc"
        newLetterCombo611.ipaParent = "tʃ"
        
        let newColorMap2129 = ColorMap()
        newColorMap2129.LetterComboParent = "cc"
        newColorMap2129.ipaParent = "tʃ"
        newColorMap2129.color = "brownRed"
        
        let newColorMap2130 = ColorMap()
        newColorMap2130.LetterComboParent = "cc"
        newColorMap2130.ipaParent = "tʃ"
        newColorMap2130.color = "brownRed"
        
        newLetterCombo611.colorMapList.append(objectsIn: [newColorMap2129,newColorMap2130])
        newIPALetter39.letterCombos.append(objectsIn: [newLetterCombo611])
        //===================================
        let newLetterCombo299 = LetterCombo()
        newLetterCombo299.letterCombo = "t"
        newLetterCombo299.ipaParent = "tʃ"
        
        let newColorMap699 = ColorMap()
        newColorMap699.LetterComboParent = "t"
        newColorMap699.ipaParent = "tʃ"
        newColorMap699.color = "brownRed"
        
        newLetterCombo299.colorMapList.append(objectsIn: [newColorMap699])
        newIPALetter39.letterCombos.append(objectsIn: [newLetterCombo299])
        //===================================
        let newLetterCombo300 = LetterCombo()
        newLetterCombo300.letterCombo = "c"
        newLetterCombo300.ipaParent = "tʃ"
        
        let newColorMap701 = ColorMap()
        newColorMap701.LetterComboParent = "c"
        newColorMap701.ipaParent = "tʃ"
        newColorMap701.color = "brownRed"
        
        newLetterCombo300.colorMapList.append(objectsIn: [newColorMap701])
        newIPALetter39.letterCombos.append(objectsIn: [newLetterCombo300])
        
        // =========================================
        // MARK: - "weɪ"
        // =========================================
        let newIPALetter41 = IPALetter()
        newIPALetter41.ipaLetter = "weɪ"
        
        //===================================
        let newLetterCombo313 = LetterCombo()
        newLetterCombo313.letterCombo = "a"
        newLetterCombo313.ipaParent = "weɪ"
        
        let newColorMap737 = ColorMap()
        newColorMap737.LetterComboParent = "a"
        newColorMap737.ipaParent = "weɪ"
        newColorMap737.color = "yellow"
        
        newLetterCombo313.colorMapList.append(objectsIn: [newColorMap737])
        newIPALetter41.letterCombos.append(objectsIn: [newLetterCombo313])
        
        // =========================================
        // MARK: - "wə"
        // =========================================
        let newIPALetter42 = IPALetter()
        newIPALetter42.ipaLetter = "wə"
        
        //===================================
        let newLetterCombo316 = LetterCombo()
        newLetterCombo316.letterCombo = "o"
        newLetterCombo316.ipaParent = "wə"
        
        let newColorMap743 = ColorMap()
        newColorMap743.LetterComboParent = "o"
        newColorMap743.ipaParent = "wə"
        newColorMap743.color = "yellow"
        
        newLetterCombo316.colorMapList.append(objectsIn: [newColorMap743])
        newIPALetter42.letterCombos.append(objectsIn: [newLetterCombo316])
        
        // =========================================
        // MARK: - "wɪ"
        // =========================================
        let newIPALetter20 = IPALetter()
        newIPALetter20.ipaLetter = "wɪ"
        
        //==========================================
        let newLetterCombo317 = LetterCombo()
        newLetterCombo317.letterCombo = "a"
        newLetterCombo317.ipaParent = "wɪ"
        
        let newColorMap744 = ColorMap()
        newColorMap744.LetterComboParent = "a"
        newColorMap744.ipaParent = "wɪ"
        newColorMap744.color = "yellow"
        
        newLetterCombo317.colorMapList.append(objectsIn: [newColorMap744])
        newIPALetter20.letterCombos.append(objectsIn: [newLetterCombo317])
        
        // =========================================
        // MARK: - "f"
        // =========================================
        let newIPALetter43 = IPALetter()
        newIPALetter43.ipaLetter = "f"
        
        //===================================
        let newLetterCombo318 = LetterCombo()
        newLetterCombo318.letterCombo = "ffe"
        newLetterCombo318.ipaParent = "f"
        
        let newColorMap745 = ColorMap()
        newColorMap745.LetterComboParent = "ffe"
        newColorMap745.ipaParent = "f"
        newColorMap745.color = "black"
        
        let newColorMap746 = ColorMap()
        newColorMap746.LetterComboParent = "ffe"
        newColorMap746.ipaParent = "f"
        newColorMap746.color = "black"
        
        let newColorMap747 = ColorMap()
        newColorMap747.LetterComboParent = "ffe"
        newColorMap747.ipaParent = "f"
        newColorMap747.color = "lightGrey"
        
        newLetterCombo318.colorMapList.append(objectsIn: [newColorMap745,newColorMap746,newColorMap747])
        newIPALetter43.letterCombos.append(objectsIn: [newLetterCombo318])
        //===================================
        let newLetterCombo319 = LetterCombo()
        newLetterCombo319.letterCombo = "pph"
        newLetterCombo319.ipaParent = "f"
        
        let newColorMap748 = ColorMap()
        newColorMap748.LetterComboParent = "pph"
        newColorMap748.ipaParent = "f"
        newColorMap748.color = "yellow"
        
        let newColorMap749 = ColorMap()
        newColorMap749.LetterComboParent = "pph"
        newColorMap749.ipaParent = "f"
        newColorMap749.color = "yellow"
        
        let newColorMap750 = ColorMap()
        newColorMap750.LetterComboParent = "pph"
        newColorMap750.ipaParent = "f"
        newColorMap750.color = "yellow"
        
        newLetterCombo319.colorMapList.append(objectsIn: [newColorMap748,newColorMap749,newColorMap750])
        newIPALetter43.letterCombos.append(objectsIn: [newLetterCombo319])
        //===================================
        let newLetterCombo320 = LetterCombo()
        newLetterCombo320.letterCombo = "ff"
        newLetterCombo320.ipaParent = "f"
        
        let newColorMap751 = ColorMap()
        newColorMap751.LetterComboParent = "ff"
        newColorMap751.ipaParent = "f"
        newColorMap751.color = "black"
        
        let newColorMap752 = ColorMap()
        newColorMap752.LetterComboParent = "ff"
        newColorMap752.ipaParent = "f"
        newColorMap752.color = "black"
        
        newLetterCombo320.colorMapList.append(objectsIn: [newColorMap751,newColorMap752])
        newIPALetter43.letterCombos.append(objectsIn: [newLetterCombo320])
        //===================================
        let newLetterCombo321 = LetterCombo()
        newLetterCombo321.letterCombo = "fe"
        newLetterCombo321.ipaParent = "f"
        
        let newColorMap753 = ColorMap()
        newColorMap753.LetterComboParent = "fe"
        newColorMap753.ipaParent = "f"
        newColorMap753.color = "black"
        
        let newColorMap754 = ColorMap()
        newColorMap754.LetterComboParent = "fe"
        newColorMap754.ipaParent = "f"
        newColorMap754.color = "lightGrey"
        
        newLetterCombo321.colorMapList.append(objectsIn: [newColorMap753,newColorMap754])
        newIPALetter43.letterCombos.append(objectsIn: [newLetterCombo321])
        //===================================
        let newLetterCombo322 = LetterCombo()
        newLetterCombo322.letterCombo = "gh"
        newLetterCombo322.ipaParent = "f"
        
        let newColorMap755 = ColorMap()
        newColorMap755.LetterComboParent = "gh"
        newColorMap755.ipaParent = "f"
        newColorMap755.color = "yellow"
        
        let newColorMap756 = ColorMap()
        newColorMap756.LetterComboParent = "gh"
        newColorMap756.ipaParent = "f"
        newColorMap756.color = "yellow"
        
        newLetterCombo322.colorMapList.append(objectsIn: [newColorMap755,newColorMap756])
        newIPALetter43.letterCombos.append(objectsIn: [newLetterCombo322])
        //===================================
        let newLetterCombo323 = LetterCombo()
        newLetterCombo323.letterCombo = "lf"
        newLetterCombo323.ipaParent = "f"
        
        let newColorMap757 = ColorMap()
        newColorMap757.LetterComboParent = "lf"
        newColorMap757.ipaParent = "f"
        newColorMap757.color = "lightGrey"
        
        let newColorMap758 = ColorMap()
        newColorMap758.LetterComboParent = "lf"
        newColorMap758.ipaParent = "f"
        newColorMap758.color = "black"
        
        newLetterCombo323.colorMapList.append(objectsIn: [newColorMap757,newColorMap758])
        newIPALetter43.letterCombos.append(objectsIn: [newLetterCombo323])
        //===================================
        let newLetterCombo324 = LetterCombo()
        newLetterCombo324.letterCombo = "ph"
        newLetterCombo324.ipaParent = "f"
        
        let newColorMap759 = ColorMap()
        newColorMap759.LetterComboParent = "ph"
        newColorMap759.ipaParent = "f"
        newColorMap759.color = "yellow"
        
        let newColorMap760 = ColorMap()
        newColorMap760.LetterComboParent = "ph"
        newColorMap760.ipaParent = "f"
        newColorMap760.color = "yellow"
        
        newLetterCombo324.colorMapList.append(objectsIn: [newColorMap759,newColorMap760])
        newIPALetter43.letterCombos.append(objectsIn: [newLetterCombo324])
        //===================================
        let newLetterCombo325 = LetterCombo()
        newLetterCombo325.letterCombo = "f"
        newLetterCombo325.ipaParent = "f"
        
        let newColorMap761 = ColorMap()
        newColorMap761.LetterComboParent = "f"
        newColorMap761.ipaParent = "f"
        newColorMap761.color = "black"
        
        newLetterCombo325.colorMapList.append(objectsIn: [newColorMap761])
        newIPALetter43.letterCombos.append(objectsIn: [newLetterCombo325])
        
        // =========================================
        // MARK: - "h"
        // =========================================
        let newIPALetter44 = IPALetter()
        newIPALetter44.ipaLetter = "h"
        
        //===================================
        let newLetterCombo326 = LetterCombo()
        newLetterCombo326.letterCombo = "wh"
        newLetterCombo326.ipaParent = "h"
        
        let newColorMap762 = ColorMap()
        newColorMap762.LetterComboParent = "wh"
        newColorMap762.ipaParent = "h"
        newColorMap762.color = "lightGrey"
        
        let newColorMap763 = ColorMap()
        newColorMap763.LetterComboParent = "wh"
        newColorMap763.ipaParent = "h"
        newColorMap763.color = "black"
        
        newLetterCombo326.colorMapList.append(objectsIn: [newColorMap762,newColorMap763])
        newIPALetter44.letterCombos.append(objectsIn: [newLetterCombo326])
        //===================================
        let newLetterCombo327 = LetterCombo()
        newLetterCombo327.letterCombo = "h"
        newLetterCombo327.ipaParent = "h"
        
        let newColorMap764 = ColorMap()
        newColorMap764.LetterComboParent = "h"
        newColorMap764.ipaParent = "h"
        newColorMap764.color = "black"
        
        newLetterCombo327.colorMapList.append(objectsIn: [newColorMap764])
        newIPALetter44.letterCombos.append(objectsIn: [newLetterCombo327])
        //===================================
        let newLetterCombo328 = LetterCombo()
        newLetterCombo328.letterCombo = "j"
        newLetterCombo328.ipaParent = "h"
        
        let newColorMap765 = ColorMap()
        newColorMap765.LetterComboParent = "j"
        newColorMap765.ipaParent = "h"
        newColorMap765.color = "yellow"
        
        newLetterCombo328.colorMapList.append(objectsIn: [newColorMap765])
        newIPALetter44.letterCombos.append(objectsIn: [newLetterCombo328])
        
        // =========================================
        // MARK: - "j"
        // =========================================
        let newIPALetter45 = IPALetter()
        newIPALetter45.ipaLetter = "j"
        
        //===================================
        let newLetterCombo612 = LetterCombo()
        newLetterCombo612.letterCombo = "ue"
        newLetterCombo612.ipaParent = "j"
        
        let newColorMap2131 = ColorMap()
        newColorMap2131.LetterComboParent = "ue"
        newColorMap2131.ipaParent = "j"
        newColorMap2131.color = "blueGrey"
        
        let newColorMap2132 = ColorMap()
        newColorMap2132.LetterComboParent = "ue"
        newColorMap2132.ipaParent = "j"
        newColorMap2132.color = "blueGrey"
        
        newLetterCombo612.colorMapList.append(objectsIn: [newColorMap2131,newColorMap2132])
        newIPALetter45.letterCombos.append(objectsIn: [newLetterCombo612])
        //===================================
        let newLetterCombo613 = LetterCombo()
        newLetterCombo613.letterCombo = "ea"
        newLetterCombo613.ipaParent = "j"
        
        let newColorMap2133 = ColorMap()
        newColorMap2133.LetterComboParent = "ea"
        newColorMap2133.ipaParent = "j"
        newColorMap2133.color = "blueGrey"
        
        let newColorMap2134 = ColorMap()
        newColorMap2134.LetterComboParent = "ea"
        newColorMap2134.ipaParent = "j"
        newColorMap2134.color = "blueGrey"
        
        newLetterCombo613.colorMapList.append(objectsIn: [newColorMap2133,newColorMap2134])
        newIPALetter45.letterCombos.append(objectsIn: [newLetterCombo613])
        //===================================
        let newLetterCombo329 = LetterCombo()
        newLetterCombo329.letterCombo = "y"
        newLetterCombo329.ipaParent = "j"
        
        let newColorMap766 = ColorMap()
        newColorMap766.LetterComboParent = "y"
        newColorMap766.ipaParent = "j"
        newColorMap766.color = "blueGrey"
        
        newLetterCombo329.colorMapList.append(objectsIn: [newColorMap766])
        newIPALetter45.letterCombos.append(objectsIn: [newLetterCombo329])
        //===================================
        let newLetterCombo330 = LetterCombo()
        newLetterCombo330.letterCombo = "i"
        newLetterCombo330.ipaParent = "j"
        
        let newColorMap767 = ColorMap()
        newColorMap767.LetterComboParent = "i"
        newColorMap767.ipaParent = "j"
        newColorMap767.color = "blueGrey"
        
        newLetterCombo330.colorMapList.append(objectsIn: [newColorMap767])
        newIPALetter45.letterCombos.append(objectsIn: [newLetterCombo330])
        //===================================
        let newLetterCombo331 = LetterCombo()
        newLetterCombo331.letterCombo = "j"
        newLetterCombo331.ipaParent = "j"
        
        let newColorMap768 = ColorMap()
        newColorMap768.LetterComboParent = "j"
        newColorMap768.ipaParent = "j"
        newColorMap768.color = "blueGrey"
        
        newLetterCombo331.colorMapList.append(objectsIn: [newColorMap768])
        newIPALetter45.letterCombos.append(objectsIn: [newLetterCombo331])
        //===================================
        let newLetterCombo614 = LetterCombo()
        newLetterCombo614.letterCombo = "o"
        newLetterCombo614.ipaParent = "j"
        
        let newColorMap2135 = ColorMap()
        newColorMap2135.LetterComboParent = "o"
        newColorMap2135.ipaParent = "j"
        newColorMap2135.color = "blueGrey"
        
        newLetterCombo614.colorMapList.append(objectsIn: [newColorMap2135])
        newIPALetter45.letterCombos.append(objectsIn: [newLetterCombo614])
        //===================================
        let newLetterCombo615 = LetterCombo()
        newLetterCombo615.letterCombo = "u"
        newLetterCombo615.ipaParent = "j"
        
        let newColorMap2136 = ColorMap()
        newColorMap2136.LetterComboParent = "u"
        newColorMap2136.ipaParent = "j"
        newColorMap2136.color = "blueGrey"
        
        newLetterCombo615.colorMapList.append(objectsIn: [newColorMap2136])
        newIPALetter45.letterCombos.append(objectsIn: [newLetterCombo615])
        //===================================
        let newLetterCombo616 = LetterCombo()
        newLetterCombo616.letterCombo = "e"
        newLetterCombo616.ipaParent = "j"
        
        let newColorMap2137 = ColorMap()
        newColorMap2137.LetterComboParent = "e"
        newColorMap2137.ipaParent = "j"
        newColorMap2137.color = "blueGrey"
        
        newLetterCombo616.colorMapList.append(objectsIn: [newColorMap2137])
        newIPALetter45.letterCombos.append(objectsIn: [newLetterCombo616])
        
        // =========================================
        // MARK: - "k"
        // =========================================
        let newIPALetter46 = IPALetter()
        newIPALetter46.ipaLetter = "k"
        
        //===================================
        let newLetterCombo332 = LetterCombo()
        newLetterCombo332.letterCombo = "que"
        newLetterCombo332.ipaParent = "k"
        
        let newColorMap769 = ColorMap()
        newColorMap769.LetterComboParent = "que"
        newColorMap769.ipaParent = "k"
        newColorMap769.color = "yellow"
        
        let newColorMap770 = ColorMap()
        newColorMap770.LetterComboParent = "que"
        newColorMap770.ipaParent = "k"
        newColorMap770.color = "lightGrey"
        
        let newColorMap771 = ColorMap()
        newColorMap771.LetterComboParent = "que"
        newColorMap771.ipaParent = "k"
        newColorMap771.color = "lightGrey"
        
        newLetterCombo332.colorMapList.append(objectsIn: [newColorMap769,newColorMap770,newColorMap771])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo332])
        //===================================
        let newLetterCombo333 = LetterCombo()
        newLetterCombo333.letterCombo = "cch"
        newLetterCombo333.ipaParent = "k"
        
        let newColorMap772 = ColorMap()
        newColorMap772.LetterComboParent = "cch"
        newColorMap772.ipaParent = "k"
        newColorMap772.color = "black"
        
        let newColorMap773 = ColorMap()
        newColorMap773.LetterComboParent = "cch"
        newColorMap773.ipaParent = "k"
        newColorMap773.color = "black"
        
        let newColorMap774 = ColorMap()
        newColorMap774.LetterComboParent = "cch"
        newColorMap774.ipaParent = "k"
        newColorMap774.color = "lightGrey"
        
        newLetterCombo333.colorMapList.append(objectsIn: [newColorMap772,newColorMap773,newColorMap774])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo333])
        //===================================
        let newLetterCombo749 = LetterCombo()
        newLetterCombo749.letterCombo = "che"
        newLetterCombo749.ipaParent = "k"
        
        let newColorMap2455 = ColorMap()
        newColorMap2455.LetterComboParent = "che"
        newColorMap2455.ipaParent = "k"
        newColorMap2455.color = "black"
        
        let newColorMap2456 = ColorMap()
        newColorMap2456.LetterComboParent = "che"
        newColorMap2456.ipaParent = "k"
        newColorMap2456.color = "lightGrey"
        
        let newColorMap2457 = ColorMap()
        newColorMap2457.LetterComboParent = "che"
        newColorMap2457.ipaParent = "k"
        newColorMap2457.color = "lightGrey"
        
        newLetterCombo749.colorMapList.append(objectsIn: [newColorMap2455,newColorMap2456,newColorMap2457])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo749])
        //===================================
        let newLetterCombo334 = LetterCombo()
        newLetterCombo334.letterCombo = "ke"
        newLetterCombo334.ipaParent = "k"
        
        let newColorMap775 = ColorMap()
        newColorMap775.LetterComboParent = "ke"
        newColorMap775.ipaParent = "k"
        newColorMap775.color = "black"
        
        let newColorMap776 = ColorMap()
        newColorMap776.LetterComboParent = "ke"
        newColorMap776.ipaParent = "k"
        newColorMap776.color = "lightGrey"
        
        newLetterCombo334.colorMapList.append(objectsIn: [newColorMap775,newColorMap776])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo334])
        //===================================
        let newLetterCombo335 = LetterCombo()
        newLetterCombo335.letterCombo = "ck"
        newLetterCombo335.ipaParent = "k"
        
        let newColorMap777 = ColorMap()
        newColorMap777.LetterComboParent = "ck"
        newColorMap777.ipaParent = "k"
        newColorMap777.color = "black"
        
        let newColorMap778 = ColorMap()
        newColorMap778.LetterComboParent = "ck"
        newColorMap778.ipaParent = "k"
        newColorMap778.color = "black"
        
        newLetterCombo335.colorMapList.append(objectsIn: [newColorMap777,newColorMap778])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo335])
        //===================================
        let newLetterCombo336 = LetterCombo()
        newLetterCombo336.letterCombo = "cc"
        newLetterCombo336.ipaParent = "k"
        
        let newColorMap779 = ColorMap()
        newColorMap779.LetterComboParent = "cc"
        newColorMap779.ipaParent = "k"
        newColorMap779.color = "black"
        
        let newColorMap780 = ColorMap()
        newColorMap780.LetterComboParent = "cc"
        newColorMap780.ipaParent = "k"
        newColorMap780.color = "black"
        
        newLetterCombo336.colorMapList.append(objectsIn: [newColorMap779,newColorMap780])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo336])
        //===================================
        let newLetterCombo337 = LetterCombo()
        newLetterCombo337.letterCombo = "ch"
        newLetterCombo337.ipaParent = "k"
        
        let newColorMap781 = ColorMap()
        newColorMap781.LetterComboParent = "ch"
        newColorMap781.ipaParent = "k"
        newColorMap781.color = "black"
        
        let newColorMap782 = ColorMap()
        newColorMap782.LetterComboParent = "ch"
        newColorMap782.ipaParent = "k"
        newColorMap782.color = "lightGrey"
        
        newLetterCombo337.colorMapList.append(objectsIn: [newColorMap781,newColorMap782])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo337])
        //===================================
        let newLetterCombo338 = LetterCombo()
        newLetterCombo338.letterCombo = "kh"
        newLetterCombo338.ipaParent = "k"
        
        let newColorMap783 = ColorMap()
        newColorMap783.LetterComboParent = "kh"
        newColorMap783.ipaParent = "k"
        newColorMap783.color = "black"
        
        let newColorMap784 = ColorMap()
        newColorMap784.LetterComboParent = "kh"
        newColorMap784.ipaParent = "k"
        newColorMap784.color = "lightGrey"
        
        newLetterCombo338.colorMapList.append(objectsIn: [newColorMap783,newColorMap784])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo338])
        //===================================
        let newLetterCombo339 = LetterCombo()
        newLetterCombo339.letterCombo = "lk"
        newLetterCombo339.ipaParent = "k"
        
        let newColorMap785 = ColorMap()
        newColorMap785.LetterComboParent = "lk"
        newColorMap785.ipaParent = "k"
        newColorMap785.color = "lightGrey"
        
        let newColorMap786 = ColorMap()
        newColorMap786.LetterComboParent = "lk"
        newColorMap786.ipaParent = "k"
        newColorMap786.color = "black"
        
        newLetterCombo339.colorMapList.append(objectsIn: [newColorMap785,newColorMap786])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo339])
        //===================================
        let newLetterCombo617 = LetterCombo()
        newLetterCombo617.letterCombo = "ct"
        newLetterCombo617.ipaParent = "k"
        
        let newColorMap2138 = ColorMap()
        newColorMap2138.LetterComboParent = "ct"
        newColorMap2138.ipaParent = "k"
        newColorMap2138.color = "black"
        
        let newColorMap2139 = ColorMap()
        newColorMap2139.LetterComboParent = "ct"
        newColorMap2139.ipaParent = "k"
        newColorMap2139.color = "lightGrey"
        
        newLetterCombo617.colorMapList.append(objectsIn: [newColorMap2138,newColorMap2139])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo617])
        //===================================
        let newLetterCombo340 = LetterCombo()
        newLetterCombo340.letterCombo = "c"
        newLetterCombo340.ipaParent = "k"
        
        let newColorMap787 = ColorMap()
        newColorMap787.LetterComboParent = "c"
        newColorMap787.ipaParent = "k"
        newColorMap787.color = "black"
        
        newLetterCombo340.colorMapList.append(objectsIn: [newColorMap787])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo340])
        //===================================
        let newLetterCombo341 = LetterCombo()
        newLetterCombo341.letterCombo = "q"
        newLetterCombo341.ipaParent = "k"
        
        let newColorMap788 = ColorMap()
        newColorMap788.LetterComboParent = "q"
        newColorMap788.ipaParent = "k"
        newColorMap788.color = "yellow"
        
        newLetterCombo341.colorMapList.append(objectsIn: [newColorMap788])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo341])
        //===================================
        let newLetterCombo342 = LetterCombo()
        newLetterCombo342.letterCombo = "k"
        newLetterCombo342.ipaParent = "k"
        
        let newColorMap789 = ColorMap()
        newColorMap789.LetterComboParent = "k"
        newColorMap789.ipaParent = "k"
        newColorMap789.color = "black"
        
        newLetterCombo342.colorMapList.append(objectsIn: [newColorMap789])
        newIPALetter46.letterCombos.append(objectsIn: [newLetterCombo342])
        
        // =========================================
        // MARK: - "ŋ"
        // =========================================
        let newIPALetter47 = IPALetter()
        newIPALetter47.ipaLetter = "ŋ"
        
        //===================================
        let newLetterCombo343 = LetterCombo()
        newLetterCombo343.letterCombo = "ngue"
        newLetterCombo343.ipaParent = "ŋ"
        
        let newColorMap790 = ColorMap()
        newColorMap790.LetterComboParent = "ngue"
        newColorMap790.ipaParent = "ŋ"
        newColorMap790.color = "darkGrey"
        
        let newColorMap791 = ColorMap()
        newColorMap791.LetterComboParent = "ngue"
        newColorMap791.ipaParent = "ŋ"
        newColorMap791.color = "darkGrey"
        
        let newColorMap792 = ColorMap()
        newColorMap792.LetterComboParent = "ngue"
        newColorMap792.ipaParent = "ŋ"
        newColorMap792.color = "lightGrey"
        
        let newColorMap793 = ColorMap()
        newColorMap793.LetterComboParent = "ngue"
        newColorMap793.ipaParent = "ŋ"
        newColorMap793.color = "lightGrey"
        
        newLetterCombo343.colorMapList.append(objectsIn: [newColorMap790,newColorMap791,newColorMap792,newColorMap793])
        newIPALetter47.letterCombos.append(objectsIn: [newLetterCombo343])
        //===================================
        let newLetterCombo344 = LetterCombo()
        newLetterCombo344.letterCombo = "ng"
        newLetterCombo344.ipaParent = "ŋ"
        
        let newColorMap794 = ColorMap()
        newColorMap794.LetterComboParent = "ng"
        newColorMap794.ipaParent = "ŋ"
        newColorMap794.color = "darkGrey"
        
        let newColorMap795 = ColorMap()
        newColorMap795.LetterComboParent = "ng"
        newColorMap795.ipaParent = "ŋ"
        newColorMap795.color = "darkGrey"
        
        newLetterCombo344.colorMapList.append(objectsIn: [newColorMap794,newColorMap795])
        newIPALetter47.letterCombos.append(objectsIn: [newLetterCombo344])
        //===================================
        let newLetterCombo345 = LetterCombo()
        newLetterCombo345.letterCombo = "nd"
        newLetterCombo345.ipaParent = "ŋ"
        
        let newColorMap796 = ColorMap()
        newColorMap796.LetterComboParent = "nd"
        newColorMap796.ipaParent = "ŋ"
        newColorMap796.color = "darkGrey"
        
        let newColorMap797 = ColorMap()
        newColorMap797.LetterComboParent = "nd"
        newColorMap797.ipaParent = "ŋ"
        newColorMap797.color = "lightGrey"
        
        newLetterCombo345.colorMapList.append(objectsIn: [newColorMap796,newColorMap797])
        newIPALetter47.letterCombos.append(objectsIn: [newLetterCombo345])
        //===================================
        let newLetterCombo346 = LetterCombo()
        newLetterCombo346.letterCombo = "n"
        newLetterCombo346.ipaParent = "ŋ"
        
        let newColorMap798 = ColorMap()
        newColorMap798.LetterComboParent = "n"
        newColorMap798.ipaParent = "ŋ"
        newColorMap798.color = "darkGrey"
        
        newLetterCombo346.colorMapList.append(objectsIn: [newColorMap798])
        newIPALetter47.letterCombos.append(objectsIn: [newLetterCombo346])
        
        // =========================================
        // MARK: - "s"
        // =========================================
        let newIPALetter48 = IPALetter()
        newIPALetter48.ipaLetter = "s"
        
        //===================================
        let newLetterCombo347 = LetterCombo()
        newLetterCombo347.letterCombo = "sce"
        newLetterCombo347.ipaParent = "s"
        
        let newColorMap799 = ColorMap()
        newColorMap799.LetterComboParent = "sce"
        newColorMap799.ipaParent = "s"
        newColorMap799.color = "black"
        
        let newColorMap800 = ColorMap()
        newColorMap800.LetterComboParent = "sce"
        newColorMap800.ipaParent = "s"
        newColorMap800.color = "lightGrey"
        
        let newColorMap801 = ColorMap()
        newColorMap801.LetterComboParent = "sce"
        newColorMap801.ipaParent = "s"
        newColorMap801.color = "lightGrey"
        
        newLetterCombo347.colorMapList.append(objectsIn: [newColorMap799,newColorMap800,newColorMap801])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo347])
        //===================================
        let newLetterCombo348 = LetterCombo()
        newLetterCombo348.letterCombo = "ss"
        newLetterCombo348.ipaParent = "s"
        
        let newColorMap802 = ColorMap()
        newColorMap802.LetterComboParent = "ss"
        newColorMap802.ipaParent = "s"
        newColorMap802.color = "black"
        
        let newColorMap803 = ColorMap()
        newColorMap803.LetterComboParent = "ss"
        newColorMap803.ipaParent = "s"
        newColorMap803.color = "black"
        
        newLetterCombo348.colorMapList.append(objectsIn: [newColorMap802,newColorMap803])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo348])
        //===================================
        let newLetterCombo349 = LetterCombo()
        newLetterCombo349.letterCombo = "se"
        newLetterCombo349.ipaParent = "s"
        
        let newColorMap804 = ColorMap()
        newColorMap804.LetterComboParent = "se"
        newColorMap804.ipaParent = "s"
        newColorMap804.color = "black"
        
        let newColorMap805 = ColorMap()
        newColorMap805.LetterComboParent = "se"
        newColorMap805.ipaParent = "s"
        newColorMap805.color = "lightGrey"
        
        newLetterCombo349.colorMapList.append(objectsIn: [newColorMap804,newColorMap805])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo349])
        //===================================
        let newLetterCombo350 = LetterCombo()
        newLetterCombo350.letterCombo = "st"
        newLetterCombo350.ipaParent = "s"
        
        let newColorMap806 = ColorMap()
        newColorMap806.LetterComboParent = "st"
        newColorMap806.ipaParent = "s"
        newColorMap806.color = "black"
        
        let newColorMap807 = ColorMap()
        newColorMap807.LetterComboParent = "st"
        newColorMap807.ipaParent = "s"
        newColorMap807.color = "lightGrey"
        
        newLetterCombo350.colorMapList.append(objectsIn: [newColorMap806,newColorMap807])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo350])
        //===================================
        let newLetterCombo351 = LetterCombo()
        newLetterCombo351.letterCombo = "ce"
        newLetterCombo351.ipaParent = "s"
        
        let newColorMap808 = ColorMap()
        newColorMap808.LetterComboParent = "ce"
        newColorMap808.ipaParent = "s"
        newColorMap808.color = "darkGrey"
        
        let newColorMap809 = ColorMap()
        newColorMap809.LetterComboParent = "ce"
        newColorMap809.ipaParent = "s"
        newColorMap809.color = "lightGrey"
        
        newLetterCombo351.colorMapList.append(objectsIn: [newColorMap808,newColorMap809])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo351])
        //===================================
        let newLetterCombo352 = LetterCombo()
        newLetterCombo352.letterCombo = "ps"
        newLetterCombo352.ipaParent = "s"
        
        let newColorMap810 = ColorMap()
        newColorMap810.LetterComboParent = "ps"
        newColorMap810.ipaParent = "s"
        newColorMap810.color = "lightGrey"
        
        let newColorMap811 = ColorMap()
        newColorMap811.LetterComboParent = "ps"
        newColorMap811.ipaParent = "s"
        newColorMap811.color = "black"
        
        newLetterCombo352.colorMapList.append(objectsIn: [newColorMap810,newColorMap811])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo352])
        //===================================
        let newLetterCombo353 = LetterCombo()
        newLetterCombo353.letterCombo = "sc"
        newLetterCombo353.ipaParent = "s"
        
        let newColorMap812 = ColorMap()
        newColorMap812.LetterComboParent = "sc"
        newColorMap812.ipaParent = "s"
        newColorMap812.color = "black"
        
        let newColorMap813 = ColorMap()
        newColorMap813.LetterComboParent = "sc"
        newColorMap813.ipaParent = "s"
        newColorMap813.color = "lightGrey"
        
        newLetterCombo353.colorMapList.append(objectsIn: [newColorMap812,newColorMap813])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo353])
        //===================================
        let newLetterCombo354 = LetterCombo()
        newLetterCombo354.letterCombo = "sw"
        newLetterCombo354.ipaParent = "s"
        
        let newColorMap814 = ColorMap()
        newColorMap814.LetterComboParent = "sw"
        newColorMap814.ipaParent = "s"
        newColorMap814.color = "black"
        
        let newColorMap815 = ColorMap()
        newColorMap815.LetterComboParent = "sw"
        newColorMap815.ipaParent = "s"
        newColorMap815.color = "lightGrey"
        
        newLetterCombo354.colorMapList.append(objectsIn: [newColorMap814,newColorMap815])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo354])
        //===================================
        let newLetterCombo618 = LetterCombo()
        newLetterCombo618.letterCombo = "es"
        newLetterCombo618.ipaParent = "s"
        
        let newColorMap2140 = ColorMap()
        newColorMap2140.LetterComboParent = "es"
        newColorMap2140.ipaParent = "s"
        newColorMap2140.color = "lightGrey"
        
        let newColorMap2141 = ColorMap()
        newColorMap2141.LetterComboParent = "es"
        newColorMap2141.ipaParent = "s"
        newColorMap2141.color = "black"
        
        newLetterCombo618.colorMapList.append(objectsIn: [newColorMap2140,newColorMap2141])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo618])
        //===================================
        let newLetterCombo619 = LetterCombo()
        newLetterCombo619.letterCombo = "'s"
        newLetterCombo619.ipaParent = "s"
        
        let newColorMap2142 = ColorMap()
        newColorMap2142.LetterComboParent = "'s"
        newColorMap2142.ipaParent = "s"
        newColorMap2142.color = "lightGrey"
        
        let newColorMap2143 = ColorMap()
        newColorMap2143.LetterComboParent = "'s"
        newColorMap2143.ipaParent = "s"
        newColorMap2143.color = "black"
        
        newLetterCombo619.colorMapList.append(objectsIn: [newColorMap2142,newColorMap2143])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo619])
        //===================================
        let newLetterCombo620 = LetterCombo()
        newLetterCombo620.letterCombo = "s'"
        newLetterCombo620.ipaParent = "s"
        
        let newColorMap2144 = ColorMap()
        newColorMap2144.LetterComboParent = "s'"
        newColorMap2144.ipaParent = "s"
        newColorMap2144.color = "black"
        
        let newColorMap2145 = ColorMap()
        newColorMap2145.LetterComboParent = "s'"
        newColorMap2145.ipaParent = "s"
        newColorMap2145.color = "lightGrey"
        
        newLetterCombo620.colorMapList.append(objectsIn: [newColorMap2144,newColorMap2145])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo620])
        //===================================
        let newLetterCombo355 = LetterCombo()
        newLetterCombo355.letterCombo = "s"
        newLetterCombo355.ipaParent = "s"
        
        let newColorMap816 = ColorMap()
        newColorMap816.LetterComboParent = "s"
        newColorMap816.ipaParent = "s"
        newColorMap816.color = "black"
        
        newLetterCombo355.colorMapList.append(objectsIn: [newColorMap816])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo355])
        //===================================
        let newLetterCombo356 = LetterCombo()
        newLetterCombo356.letterCombo = "c"
        newLetterCombo356.ipaParent = "s"
        
        let newColorMap817 = ColorMap()
        newColorMap817.LetterComboParent = "c"
        newColorMap817.ipaParent = "s"
        newColorMap817.color = "darkGrey"
        
        newLetterCombo356.colorMapList.append(objectsIn: [newColorMap817])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo356])
        //===================================
        let newLetterCombo357 = LetterCombo()
        newLetterCombo357.letterCombo = "z"
        newLetterCombo357.ipaParent = "s"
        
        let newColorMap818 = ColorMap()
        newColorMap818.LetterComboParent = "z"
        newColorMap818.ipaParent = "s"
        newColorMap818.color = "darkGrey"
        
        newLetterCombo357.colorMapList.append(objectsIn: [newColorMap818])
        newIPALetter48.letterCombos.append(objectsIn: [newLetterCombo357])
        
        // =========================================
        // MARK: - "ʃ"
        // =========================================
        let newIPALetter49 = IPALetter()
        newIPALetter49.ipaLetter = "ʃ"
        
        //===================================
        let newLetterCombo360 = LetterCombo()
        newLetterCombo360.letterCombo = "che"
        newLetterCombo360.ipaParent = "ʃ"
        
        let newColorMap825 = ColorMap()
        newColorMap825.LetterComboParent = "che"
        newColorMap825.ipaParent = "ʃ"
        newColorMap825.color = "tan"
        
        let newColorMap826 = ColorMap()
        newColorMap826.LetterComboParent = "che"
        newColorMap826.ipaParent = "ʃ"
        newColorMap826.color = "tan"
        
        let newColorMap827 = ColorMap()
        newColorMap827.LetterComboParent = "che"
        newColorMap827.ipaParent = "ʃ"
        newColorMap827.color = "lightGrey"
        
        newLetterCombo360.colorMapList.append(objectsIn: [newColorMap825,newColorMap826,newColorMap827])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo360])
        //===================================
        let newLetterCombo361 = LetterCombo()
        newLetterCombo361.letterCombo = "she"
        newLetterCombo361.ipaParent = "ʃ"
        
        let newColorMap828 = ColorMap()
        newColorMap828.LetterComboParent = "she"
        newColorMap828.ipaParent = "ʃ"
        newColorMap828.color = "tan"
        
        let newColorMap829 = ColorMap()
        newColorMap829.LetterComboParent = "she"
        newColorMap829.ipaParent = "ʃ"
        newColorMap829.color = "tan"
        
        let newColorMap830 = ColorMap()
        newColorMap830.LetterComboParent = "she"
        newColorMap830.ipaParent = "ʃ"
        newColorMap830.color = "lightGrey"
        
        newLetterCombo361.colorMapList.append(objectsIn: [newColorMap828,newColorMap829,newColorMap830])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo361])
        //===================================
        let newLetterCombo363 = LetterCombo()
        newLetterCombo363.letterCombo = "sh"
        newLetterCombo363.ipaParent = "ʃ"
        
        let newColorMap834 = ColorMap()
        newColorMap834.LetterComboParent = "sh"
        newColorMap834.ipaParent = "ʃ"
        newColorMap834.color = "tan"
        
        let newColorMap835 = ColorMap()
        newColorMap835.LetterComboParent = "sh"
        newColorMap835.ipaParent = "ʃ"
        newColorMap835.color = "tan"
        
        newLetterCombo363.colorMapList.append(objectsIn: [newColorMap834,newColorMap835])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo363])
        //===================================
        let newLetterCombo364 = LetterCombo()
        newLetterCombo364.letterCombo = "sc"
        newLetterCombo364.ipaParent = "ʃ"
        
        let newColorMap836 = ColorMap()
        newColorMap836.LetterComboParent = "sc"
        newColorMap836.ipaParent = "ʃ"
        newColorMap836.color = "tan"
        
        let newColorMap837 = ColorMap()
        newColorMap837.LetterComboParent = "sc"
        newColorMap837.ipaParent = "ʃ"
        newColorMap837.color = "tan"
        
        newLetterCombo364.colorMapList.append(objectsIn: [newColorMap836,newColorMap837])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo364])
        //===================================
        let newLetterCombo365 = LetterCombo()
        newLetterCombo365.letterCombo = "ce"
        newLetterCombo365.ipaParent = "ʃ"
        
        let newColorMap838 = ColorMap()
        newColorMap838.LetterComboParent = "ce"
        newColorMap838.ipaParent = "ʃ"
        newColorMap838.color = "tan"
        
        let newColorMap839 = ColorMap()
        newColorMap839.LetterComboParent = "ce"
        newColorMap839.ipaParent = "ʃ"
        newColorMap839.color = "lightGrey"
        
        newLetterCombo365.colorMapList.append(objectsIn: [newColorMap838,newColorMap839])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo365])
        //===================================
        let newLetterCombo366 = LetterCombo()
        newLetterCombo366.letterCombo = "ch"
        newLetterCombo366.ipaParent = "ʃ"
        
        let newColorMap840 = ColorMap()
        newColorMap840.LetterComboParent = "ch"
        newColorMap840.ipaParent = "ʃ"
        newColorMap840.color = "tan"
        
        let newColorMap841 = ColorMap()
        newColorMap841.LetterComboParent = "ch"
        newColorMap841.ipaParent = "ʃ"
        newColorMap841.color = "tan"
        
        newLetterCombo366.colorMapList.append(objectsIn: [newColorMap840,newColorMap841])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo366])
        //===================================
        let newLetterCombo368 = LetterCombo()
        newLetterCombo368.letterCombo = "ss"
        newLetterCombo368.ipaParent = "ʃ"
        
        let newColorMap844 = ColorMap()
        newColorMap844.LetterComboParent = "ss"
        newColorMap844.ipaParent = "ʃ"
        newColorMap844.color = "tan"
        
        let newColorMap845 = ColorMap()
        newColorMap845.LetterComboParent = "ss"
        newColorMap845.ipaParent = "ʃ"
        newColorMap845.color = "tan"
        
        newLetterCombo368.colorMapList.append(objectsIn: [newColorMap844,newColorMap845])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo368])
        //===================================
        let newLetterCombo369 = LetterCombo()
        newLetterCombo369.letterCombo = "t"
        newLetterCombo369.ipaParent = "ʃ"
        
        let newColorMap846 = ColorMap()
        newColorMap846.LetterComboParent = "t"
        newColorMap846.ipaParent = "ʃ"
        newColorMap846.color = "tan"
        
        newLetterCombo369.colorMapList.append(objectsIn: [newColorMap846])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo369])
        //===================================
        let newLetterCombo370 = LetterCombo()
        newLetterCombo370.letterCombo = "s"
        newLetterCombo370.ipaParent = "ʃ"
        
        let newColorMap848 = ColorMap()
        newColorMap848.LetterComboParent = "s"
        newColorMap848.ipaParent = "ʃ"
        newColorMap848.color = "tan"
        
        newLetterCombo370.colorMapList.append(objectsIn: [newColorMap848])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo370])
        //===================================
        let newLetterCombo621 = LetterCombo()
        newLetterCombo621.letterCombo = "c"
        newLetterCombo621.ipaParent = "ʃ"
        
        let newColorMap2146 = ColorMap()
        newColorMap2146.LetterComboParent = "c"
        newColorMap2146.ipaParent = "ʃ"
        newColorMap2146.color = "tan"
        
        newLetterCombo621.colorMapList.append(objectsIn: [newColorMap2146])
        newIPALetter49.letterCombos.append(objectsIn: [newLetterCombo621])
        
        // =========================================
        // MARK: - "w"
        // =========================================
        let newIPALetter50 = IPALetter()
        newIPALetter50.ipaLetter = "w"
        
        //===================================
        let newLetterCombo371 = LetterCombo()
        newLetterCombo371.letterCombo = "wh"
        newLetterCombo371.ipaParent = "w"
        
        let newColorMap849 = ColorMap()
        newColorMap849.LetterComboParent = "wh"
        newColorMap849.ipaParent = "w"
        newColorMap849.color = "black"
        
        let newColorMap850 = ColorMap()
        newColorMap850.LetterComboParent = "wh"
        newColorMap850.ipaParent = "w"
        newColorMap850.color = "lightGrey"
        
        newLetterCombo371.colorMapList.append(objectsIn: [newColorMap849,newColorMap850])
        newIPALetter50.letterCombos.append(objectsIn: [newLetterCombo371])
        //===================================
        let newLetterCombo372 = LetterCombo()
        newLetterCombo372.letterCombo = "w"
        newLetterCombo372.ipaParent = "w"
        
        let newColorMap851 = ColorMap()
        newColorMap851.LetterComboParent = "w"
        newColorMap851.ipaParent = "w"
        newColorMap851.color = "black"
        
        newLetterCombo372.colorMapList.append(objectsIn: [newColorMap851])
        newIPALetter50.letterCombos.append(objectsIn: [newLetterCombo372])
        //===================================
        let newLetterCombo373 = LetterCombo()
        newLetterCombo373.letterCombo = "u"
        newLetterCombo373.ipaParent = "w"
        
        let newColorMap852 = ColorMap()
        newColorMap852.LetterComboParent = "u"
        newColorMap852.ipaParent = "w"
        newColorMap852.color = "yellow"
        
        newLetterCombo373.colorMapList.append(objectsIn: [newColorMap852])
        newIPALetter50.letterCombos.append(objectsIn: [newLetterCombo373])
        //===================================
        let newLetterCombo374 = LetterCombo()
        newLetterCombo374.letterCombo = "o"
        newLetterCombo374.ipaParent = "w"
        
        let newColorMap853 = ColorMap()
        newColorMap853.LetterComboParent = "o"
        newColorMap853.ipaParent = "w"
        newColorMap853.color = "yellow"
        
        newLetterCombo374.colorMapList.append(objectsIn: [newColorMap853])
        newIPALetter50.letterCombos.append(objectsIn: [newLetterCombo374])
        //===================================
        let newLetterCombo622 = LetterCombo()
        newLetterCombo622.letterCombo = "j"
        newLetterCombo622.ipaParent = "w"
        
        let newColorMap2147 = ColorMap()
        newColorMap2147.LetterComboParent = "j"
        newColorMap2147.ipaParent = "w"
        newColorMap2147.color = "yellow"
        
        newLetterCombo622.colorMapList.append(objectsIn: [newColorMap2147])
        newIPALetter50.letterCombos.append(objectsIn: [newLetterCombo622])
        
        // =========================================
        // MARK: - "ʒ"
        // =========================================
        let newIPALetter51 = IPALetter()
        newIPALetter51.ipaLetter = "ʒ"
        
        //===================================
        let newLetterCombo375 = LetterCombo()
        newLetterCombo375.letterCombo = "ge"
        newLetterCombo375.ipaParent = "ʒ"
        
        let newColorMap854 = ColorMap()
        newColorMap854.LetterComboParent = "ge"
        newColorMap854.ipaParent = "ʒ"
        newColorMap854.color = "brownPurple"
        
        let newColorMap855 = ColorMap()
        newColorMap855.LetterComboParent = "ge"
        newColorMap855.ipaParent = "ʒ"
        newColorMap855.color = "lightGrey"
        
        newLetterCombo375.colorMapList.append(objectsIn: [newColorMap854,newColorMap855])
        newIPALetter51.letterCombos.append(objectsIn: [newLetterCombo375])
        //===================================
        let newLetterCombo377 = LetterCombo()
        newLetterCombo377.letterCombo = "s"
        newLetterCombo377.ipaParent = "ʒ"
        
        let newColorMap858 = ColorMap()
        newColorMap858.LetterComboParent = "s"
        newColorMap858.ipaParent = "ʒ"
        newColorMap858.color = "brownPurple"
        
        newLetterCombo377.colorMapList.append(objectsIn: [newColorMap858])
        newIPALetter51.letterCombos.append(objectsIn: [newLetterCombo377])
        //===================================
        let newLetterCombo378 = LetterCombo()
        newLetterCombo378.letterCombo = "t"
        newLetterCombo378.ipaParent = "ʒ"
        
        let newColorMap860 = ColorMap()
        newColorMap860.LetterComboParent = "t"
        newColorMap860.ipaParent = "ʒ"
        newColorMap860.color = "brownPurple"
        
        newLetterCombo378.colorMapList.append(objectsIn: [newColorMap860])
        newIPALetter51.letterCombos.append(objectsIn: [newLetterCombo378])
        //===================================
        let newLetterCombo379 = LetterCombo()
        newLetterCombo379.letterCombo = "g"
        newLetterCombo379.ipaParent = "ʒ"
        
        let newColorMap861 = ColorMap()
        newColorMap861.LetterComboParent = "g"
        newColorMap861.ipaParent = "ʒ"
        newColorMap861.color = "brownPurple"
        
        newLetterCombo379.colorMapList.append(objectsIn: [newColorMap861])
        newIPALetter51.letterCombos.append(objectsIn: [newLetterCombo379])
        //===================================
        let newLetterCombo380 = LetterCombo()
        newLetterCombo380.letterCombo = "z"
        newLetterCombo380.ipaParent = "ʒ"
        
        let newColorMap862 = ColorMap()
        newColorMap862.LetterComboParent = "z"
        newColorMap862.ipaParent = "ʒ"
        newColorMap862.color = "brownPurple"
        
        newLetterCombo380.colorMapList.append(objectsIn: [newColorMap862])
        newIPALetter51.letterCombos.append(objectsIn: [newLetterCombo380])
        
        // =========================================
        // MARK: - "æ"
        // =========================================
        let newIPALetter52 = IPALetter()
        newIPALetter52.ipaLetter = "æ"
        
        //===================================
        let newLetterCombo623 = LetterCombo()
        newLetterCombo623.letterCombo = "aha"
        newLetterCombo623.ipaParent = "æ"
        
        let newColorMap2148 = ColorMap()
        newColorMap2148.LetterComboParent = "aha"
        newColorMap2148.ipaParent = "æ"
        newColorMap2148.color = "red"
        
        let newColorMap2149 = ColorMap()
        newColorMap2149.LetterComboParent = "aha"
        newColorMap2149.ipaParent = "æ"
        newColorMap2149.color = "lightGrey"
        
        let newColorMap2150 = ColorMap()
        newColorMap2150.LetterComboParent = "aha"
        newColorMap2150.ipaParent = "æ"
        newColorMap2150.color = "lightGrey"
        
        newLetterCombo623.colorMapList.append(objectsIn: [newColorMap2148,newColorMap2149,newColorMap2150])
        newIPALetter52.letterCombos.append(objectsIn: [newLetterCombo623])
        //===================================
        let newLetterCombo381 = LetterCombo()
        newLetterCombo381.letterCombo = "ah"
        newLetterCombo381.ipaParent = "æ"
        
        let newColorMap863 = ColorMap()
        newColorMap863.LetterComboParent = "ah"
        newColorMap863.ipaParent = "æ"
        newColorMap863.color = "red"
        
        let newColorMap864 = ColorMap()
        newColorMap864.LetterComboParent = "ah"
        newColorMap864.ipaParent = "æ"
        newColorMap864.color = "lightGrey"
        
        newLetterCombo381.colorMapList.append(objectsIn: [newColorMap863,newColorMap864])
        newIPALetter52.letterCombos.append(objectsIn: [newLetterCombo381])
        //===================================
        let newLetterCombo382 = LetterCombo()
        newLetterCombo382.letterCombo = "au"
        newLetterCombo382.ipaParent = "æ"
        
        let newColorMap865 = ColorMap()
        newColorMap865.LetterComboParent = "au"
        newColorMap865.ipaParent = "æ"
        newColorMap865.color = "red"
        
        let newColorMap866 = ColorMap()
        newColorMap866.LetterComboParent = "au"
        newColorMap866.ipaParent = "æ"
        newColorMap866.color = "red"
        
        newLetterCombo382.colorMapList.append(objectsIn: [newColorMap865,newColorMap866])
        newIPALetter52.letterCombos.append(objectsIn: [newLetterCombo382])
        //===================================
        let newLetterCombo624 = LetterCombo()
        newLetterCombo624.letterCombo = "ae"
        newLetterCombo624.ipaParent = "æ"
        
        let newColorMap2151 = ColorMap()
        newColorMap2151.LetterComboParent = "ae"
        newColorMap2151.ipaParent = "æ"
        newColorMap2151.color = "red"
        
        let newColorMap2152 = ColorMap()
        newColorMap2152.LetterComboParent = "ae"
        newColorMap2152.ipaParent = "æ"
        newColorMap2152.color = "red"
        
        newLetterCombo624.colorMapList.append(objectsIn: [newColorMap2151,newColorMap2152])
        newIPALetter52.letterCombos.append(objectsIn: [newLetterCombo624])
        //===================================
        let newLetterCombo625 = LetterCombo()
        newLetterCombo625.letterCombo = "ai"
        newLetterCombo625.ipaParent = "æ"
        
        let newColorMap2153 = ColorMap()
        newColorMap2153.LetterComboParent = "ai"
        newColorMap2153.ipaParent = "æ"
        newColorMap2153.color = "red"
        
        let newColorMap2154 = ColorMap()
        newColorMap2154.LetterComboParent = "ai"
        newColorMap2154.ipaParent = "æ"
        newColorMap2154.color = "red"
        
        newLetterCombo625.colorMapList.append(objectsIn: [newColorMap2153,newColorMap2154])
        newIPALetter52.letterCombos.append(objectsIn: [newLetterCombo625])
        //===================================
        let newLetterCombo383 = LetterCombo()
        newLetterCombo383.letterCombo = "a"
        newLetterCombo383.ipaParent = "æ"
        
        let newColorMap867 = ColorMap()
        newColorMap867.LetterComboParent = "a"
        newColorMap867.ipaParent = "æ"
        newColorMap867.color = "red"
        
        newLetterCombo383.colorMapList.append(objectsIn: [newColorMap867])
        newIPALetter52.letterCombos.append(objectsIn: [newLetterCombo383])
        
        // =========================================
        // MARK: - "ɑ"
        // =========================================
        let newIPALetter53 = IPALetter()
        newIPALetter53.ipaLetter = "ɑ"
        
        //===================================
        let newLetterCombo626 = LetterCombo()
        newLetterCombo626.letterCombo = "ough"
        newLetterCombo626.ipaParent = "ɑ"
        
        let newColorMap2155 = ColorMap()
        newColorMap2155.LetterComboParent = "ough"
        newColorMap2155.ipaParent = "ɑ"
        newColorMap2155.color = "green"
        
        let newColorMap2156 = ColorMap()
        newColorMap2156.LetterComboParent = "ough"
        newColorMap2156.ipaParent = "ɑ"
        newColorMap2156.color = "green"
        
        let newColorMap2157 = ColorMap()
        newColorMap2157.LetterComboParent = "ough"
        newColorMap2157.ipaParent = "ɑ"
        newColorMap2157.color = "lightGrey"
        
        let newColorMap2158 = ColorMap()
        newColorMap2158.LetterComboParent = "ough"
        newColorMap2158.ipaParent = "ɑ"
        newColorMap2158.color = "lightGrey"
        
        newLetterCombo626.colorMapList.append(objectsIn: [newColorMap2155,newColorMap2156,newColorMap2157,newColorMap2158])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo626])
        //===================================
        let newLetterCombo627 = LetterCombo()
        newLetterCombo627.letterCombo = "augh"
        newLetterCombo627.ipaParent = "ɑ"
        
        let newColorMap2159 = ColorMap()
        newColorMap2159.LetterComboParent = "augh"
        newColorMap2159.ipaParent = "ɑ"
        newColorMap2159.color = "green"
        
        let newColorMap2160 = ColorMap()
        newColorMap2160.LetterComboParent = "augh"
        newColorMap2160.ipaParent = "ɑ"
        newColorMap2160.color = "green"
        
        let newColorMap2161 = ColorMap()
        newColorMap2161.LetterComboParent = "augh"
        newColorMap2161.ipaParent = "ɑ"
        newColorMap2161.color = "lightGrey"
        
        let newColorMap2162 = ColorMap()
        newColorMap2162.LetterComboParent = "augh"
        newColorMap2162.ipaParent = "ɑ"
        newColorMap2162.color = "lightGrey"
        
        newLetterCombo627.colorMapList.append(objectsIn: [newColorMap2159,newColorMap2160,newColorMap2161,newColorMap2162])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo627])
        //===================================
        let newLetterCombo628 = LetterCombo()
        newLetterCombo628.letterCombo = "awe"
        newLetterCombo628.ipaParent = "ɑ"
        
        let newColorMap2163 = ColorMap()
        newColorMap2163.LetterComboParent = "awe"
        newColorMap2163.ipaParent = "ɑ"
        newColorMap2163.color = "green"
        
        let newColorMap2164 = ColorMap()
        newColorMap2164.LetterComboParent = "awe"
        newColorMap2164.ipaParent = "ɑ"
        newColorMap2164.color = "lightGrey"
        
        let newColorMap2165 = ColorMap()
        newColorMap2165.LetterComboParent = "awe"
        newColorMap2165.ipaParent = "ɑ"
        newColorMap2165.color = "lightGrey"
        
        newLetterCombo628.colorMapList.append(objectsIn: [newColorMap2163,newColorMap2164,newColorMap2165])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo628])
        //===================================
        let newLetterCombo385 = LetterCombo()
        newLetterCombo385.letterCombo = "ach"
        newLetterCombo385.ipaParent = "ɑ"
        
        let newColorMap870 = ColorMap()
        newColorMap870.LetterComboParent = "ach"
        newColorMap870.ipaParent = "ɑ"
        newColorMap870.color = "green"
        
        let newColorMap871 = ColorMap()
        newColorMap871.LetterComboParent = "ach"
        newColorMap871.ipaParent = "ɑ"
        newColorMap871.color = "lightGrey"
        
        let newColorMap872 = ColorMap()
        newColorMap872.LetterComboParent = "ach"
        newColorMap872.ipaParent = "ɑ"
        newColorMap872.color = "lightGrey"
        
        newLetterCombo385.colorMapList.append(objectsIn: [newColorMap870,newColorMap871,newColorMap872])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo385])
        //===================================
        let newLetterCombo386 = LetterCombo()
        newLetterCombo386.letterCombo = "oh"
        newLetterCombo386.ipaParent = "ɑ"
        
        let newColorMap873 = ColorMap()
        newColorMap873.LetterComboParent = "oh"
        newColorMap873.ipaParent = "ɑ"
        newColorMap873.color = "green"
        
        let newColorMap874 = ColorMap()
        newColorMap874.LetterComboParent = "oh"
        newColorMap874.ipaParent = "ɑ"
        newColorMap874.color = "lightGrey"
        
        newLetterCombo386.colorMapList.append(objectsIn: [newColorMap873,newColorMap874])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo386])
        //===================================
        let newLetterCombo387 = LetterCombo()
        newLetterCombo387.letterCombo = "ho"
        newLetterCombo387.ipaParent = "ɑ"
        
        let newColorMap875 = ColorMap()
        newColorMap875.LetterComboParent = "ho"
        newColorMap875.ipaParent = "ɑ"
        newColorMap875.color = "lightGrey"
        
        let newColorMap876 = ColorMap()
        newColorMap876.LetterComboParent = "ho"
        newColorMap876.ipaParent = "ɑ"
        newColorMap876.color = "green"
        
        newLetterCombo387.colorMapList.append(objectsIn: [newColorMap875,newColorMap876])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo387])
        //===================================
        let newLetterCombo388 = LetterCombo()
        newLetterCombo388.letterCombo = "ah"
        newLetterCombo388.ipaParent = "ɑ"
        
        let newColorMap877 = ColorMap()
        newColorMap877.LetterComboParent = "ah"
        newColorMap877.ipaParent = "ɑ"
        newColorMap877.color = "green"
        
        let newColorMap878 = ColorMap()
        newColorMap878.LetterComboParent = "ah"
        newColorMap878.ipaParent = "ɑ"
        newColorMap878.color = "lightGrey"
        
        newLetterCombo388.colorMapList.append(objectsIn: [newColorMap877,newColorMap878])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo388])
        //===================================
        let newLetterCombo389 = LetterCombo()
        newLetterCombo389.letterCombo = "ow"
        newLetterCombo389.ipaParent = "ɑ"
        
        let newColorMap879 = ColorMap()
        newColorMap879.LetterComboParent = "ow"
        newColorMap879.ipaParent = "ɑ"
        newColorMap879.color = "green"
        
        let newColorMap880 = ColorMap()
        newColorMap880.LetterComboParent = "ow"
        newColorMap880.ipaParent = "ɑ"
        newColorMap880.color = "lightGrey"
        
        newLetterCombo389.colorMapList.append(objectsIn: [newColorMap879,newColorMap880])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo389])
        //===================================
        let newLetterCombo390 = LetterCombo()
        newLetterCombo390.letterCombo = "ua"
        newLetterCombo390.ipaParent = "ɑ"
        
        let newColorMap881 = ColorMap()
        newColorMap881.LetterComboParent = "ua"
        newColorMap881.ipaParent = "ɑ"
        newColorMap881.color = "green"
        
        let newColorMap882 = ColorMap()
        newColorMap882.LetterComboParent = "ua"
        newColorMap882.ipaParent = "ɑ"
        newColorMap882.color = "green"
        
        newLetterCombo390.colorMapList.append(objectsIn: [newColorMap881,newColorMap882])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo390])
        //===================================
        let newLetterCombo629 = LetterCombo()
        newLetterCombo629.letterCombo = "aa"
        newLetterCombo629.ipaParent = "ɑ"
        
        let newColorMap2166 = ColorMap()
        newColorMap2166.LetterComboParent = "aa"
        newColorMap2166.ipaParent = "ɑ"
        newColorMap2166.color = "green"
        
        let newColorMap2167 = ColorMap()
        newColorMap2167.LetterComboParent = "aa"
        newColorMap2167.ipaParent = "ɑ"
        newColorMap2167.color = "green"
        
        newLetterCombo629.colorMapList.append(objectsIn: [newColorMap2166,newColorMap2167])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo629])
        //===================================
        let newLetterCombo630 = LetterCombo()
        newLetterCombo630.letterCombo = "is"
        newLetterCombo630.ipaParent = "ɑ"
        
        let newColorMap2168 = ColorMap()
        newColorMap2168.LetterComboParent = "is"
        newColorMap2168.ipaParent = "ɑ"
        newColorMap2168.color = "green"
        
        let newColorMap2169 = ColorMap()
        newColorMap2169.LetterComboParent = "is"
        newColorMap2169.ipaParent = "ɑ"
        newColorMap2169.color = "lightGrey"
        
        newLetterCombo630.colorMapList.append(objectsIn: [newColorMap2168,newColorMap2169])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo630])
        //===================================
        let newLetterCombo631 = LetterCombo()
        newLetterCombo631.letterCombo = "aw"
        newLetterCombo631.ipaParent = "ɑ"
        
        let newColorMap2170 = ColorMap()
        newColorMap2170.LetterComboParent = "aw"
        newColorMap2170.ipaParent = "ɑ"
        newColorMap2170.color = "green"
        
        let newColorMap2171 = ColorMap()
        newColorMap2171.LetterComboParent = "aw"
        newColorMap2171.ipaParent = "ɑ"
        newColorMap2171.color = "lightGrey"
        
        newLetterCombo631.colorMapList.append(objectsIn: [newColorMap2170,newColorMap2171])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo631])
        //===================================
        let newLetterCombo632 = LetterCombo()
        newLetterCombo632.letterCombo = "au"
        newLetterCombo632.ipaParent = "ɑ"
        
        let newColorMap2172 = ColorMap()
        newColorMap2172.LetterComboParent = "au"
        newColorMap2172.ipaParent = "ɑ"
        newColorMap2172.color = "green"
        
        let newColorMap2173 = ColorMap()
        newColorMap2173.LetterComboParent = "au"
        newColorMap2173.ipaParent = "ɑ"
        newColorMap2173.color = "green"
        
        newLetterCombo632.colorMapList.append(objectsIn: [newColorMap2172,newColorMap2173])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo632])
        //===================================
        let newLetterCombo633 = LetterCombo()
        newLetterCombo633.letterCombo = "oa"
        newLetterCombo633.ipaParent = "ɑ"
        
        let newColorMap2174 = ColorMap()
        newColorMap2174.LetterComboParent = "oa"
        newColorMap2174.ipaParent = "ɑ"
        newColorMap2174.color = "green"
        
        let newColorMap2175 = ColorMap()
        newColorMap2175.LetterComboParent = "oa"
        newColorMap2175.ipaParent = "ɑ"
        newColorMap2175.color = "green"
        
        newLetterCombo633.colorMapList.append(objectsIn: [newColorMap2174,newColorMap2175])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo633])
        //===================================
        let newLetterCombo735 = LetterCombo()
        newLetterCombo735.letterCombo = "ou"
        newLetterCombo735.ipaParent = "ɑ"
        
        let newColorMap2418 = ColorMap()
        newColorMap2418.LetterComboParent = "ou"
        newColorMap2418.ipaParent = "ɑ"
        newColorMap2418.color = "green"
        
        let newColorMap2419 = ColorMap()
        newColorMap2419.LetterComboParent = "ou"
        newColorMap2419.ipaParent = "ɑ"
        newColorMap2419.color = "green"
        
        newLetterCombo735.colorMapList.append(objectsIn: [newColorMap2418,newColorMap2419])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo735])
        //===================================
        let newLetterCombo634 = LetterCombo()
        newLetterCombo634.letterCombo = "'a"
        newLetterCombo634.ipaParent = "ɑ"
        
        let newColorMap2176 = ColorMap()
        newColorMap2176.LetterComboParent = "'a"
        newColorMap2176.ipaParent = "ɑ"
        newColorMap2176.color = "lightGrey"
        
        let newColorMap2177 = ColorMap()
        newColorMap2177.LetterComboParent = "'a"
        newColorMap2177.ipaParent = "ɑ"
        newColorMap2177.color = "green"
        
        newLetterCombo634.colorMapList.append(objectsIn: [newColorMap2176,newColorMap2177])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo634])
        //===================================
        let newLetterCombo391 = LetterCombo()
        newLetterCombo391.letterCombo = "o"
        newLetterCombo391.ipaParent = "ɑ"
        
        let newColorMap883 = ColorMap()
        newColorMap883.LetterComboParent = "o"
        newColorMap883.ipaParent = "ɑ"
        newColorMap883.color = "green"
        
        newLetterCombo391.colorMapList.append(objectsIn: [newColorMap883])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo391])
        //===================================
        let newLetterCombo392 = LetterCombo()
        newLetterCombo392.letterCombo = "a"
        newLetterCombo392.ipaParent = "ɑ"
        
        let newColorMap884 = ColorMap()
        newColorMap884.LetterComboParent = "a"
        newColorMap884.ipaParent = "ɑ"
        newColorMap884.color = "green"
        
        newLetterCombo392.colorMapList.append(objectsIn: [newColorMap884])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo392])
        //===================================
        let newLetterCombo393 = LetterCombo()
        newLetterCombo393.letterCombo = "i"
        newLetterCombo393.ipaParent = "ɑ"
        
        let newColorMap885 = ColorMap()
        newColorMap885.LetterComboParent = "i"
        newColorMap885.ipaParent = "ɑ"
        newColorMap885.color = "green"
        
        newLetterCombo393.colorMapList.append(objectsIn: [newColorMap885])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo393])
        //===================================
        let newLetterCombo736 = LetterCombo()
        newLetterCombo736.letterCombo = "e"
        newLetterCombo736.ipaParent = "ɑ"
        
        let newColorMap2420 = ColorMap()
        newColorMap2420.LetterComboParent = "e"
        newColorMap2420.ipaParent = "ɑ"
        newColorMap2420.color = "green"
        
        newLetterCombo736.colorMapList.append(objectsIn: [newColorMap2420])
        newIPALetter53.letterCombos.append(objectsIn: [newLetterCombo736])
        
        // =========================================
        // MARK: - "ə"
        // =========================================
        let newIPALetter54 = IPALetter()
        newIPALetter54.ipaLetter = "ə"
        
        //===================================
        let newLetterCombo394 = LetterCombo()
        newLetterCombo394.letterCombo = "ough"
        newLetterCombo394.ipaParent = "ə"
        
        let newColorMap886 = ColorMap()
        newColorMap886.LetterComboParent = "ough"
        newColorMap886.ipaParent = "ə"
        newColorMap886.color = "lightPink"
        
        let newColorMap887 = ColorMap()
        newColorMap887.LetterComboParent = "ough"
        newColorMap887.ipaParent = "ə"
        newColorMap887.color = "lightPink"
        
        let newColorMap888 = ColorMap()
        newColorMap888.LetterComboParent = "ough"
        newColorMap888.ipaParent = "ə"
        newColorMap888.color = "lightGrey"
        
        let newColorMap889 = ColorMap()
        newColorMap889.LetterComboParent = "ough"
        newColorMap889.ipaParent = "ə"
        newColorMap889.color = "lightGrey"
        
        newLetterCombo394.colorMapList.append(objectsIn: [newColorMap886,newColorMap887,newColorMap888,newColorMap889])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo394])
        //===================================
        let newLetterCombo635 = LetterCombo()
        newLetterCombo635.letterCombo = "iou"
        newLetterCombo635.ipaParent = "ə"
        
        let newColorMap2178 = ColorMap()
        newColorMap2178.LetterComboParent = "iou"
        newColorMap2178.ipaParent = "ə"
        newColorMap2178.color = "lightPink"
        
        let newColorMap2179 = ColorMap()
        newColorMap2179.LetterComboParent = "iou"
        newColorMap2179.ipaParent = "ə"
        newColorMap2179.color = "lightPink"
        
        let newColorMap2180 = ColorMap()
        newColorMap2180.LetterComboParent = "iou"
        newColorMap2180.ipaParent = "ə"
        newColorMap2180.color = "lightPink"
        
        newLetterCombo635.colorMapList.append(objectsIn: [newColorMap2178,newColorMap2179,newColorMap2180])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo635])
        //===================================
        let newLetterCombo636 = LetterCombo()
        newLetterCombo636.letterCombo = "eou"
        newLetterCombo636.ipaParent = "ə"
        
        let newColorMap2181 = ColorMap()
        newColorMap2181.LetterComboParent = "eou"
        newColorMap2181.ipaParent = "ə"
        newColorMap2181.color = "lightPink"
        
        let newColorMap2182 = ColorMap()
        newColorMap2182.LetterComboParent = "eou"
        newColorMap2182.ipaParent = "ə"
        newColorMap2182.color = "lightPink"
        
        let newColorMap2183 = ColorMap()
        newColorMap2183.LetterComboParent = "eou"
        newColorMap2183.ipaParent = "ə"
        newColorMap2183.color = "lightPink"
        
        newLetterCombo636.colorMapList.append(objectsIn: [newColorMap2181,newColorMap2182,newColorMap2183])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo636])
        //===================================
        let newLetterCombo637 = LetterCombo()
        newLetterCombo637.letterCombo = "ia"
        newLetterCombo637.ipaParent = "ə"
        
        let newColorMap2184 = ColorMap()
        newColorMap2184.LetterComboParent = "ia"
        newColorMap2184.ipaParent = "ə"
        newColorMap2184.color = "lightPink"
        
        let newColorMap2185 = ColorMap()
        newColorMap2185.LetterComboParent = "ia"
        newColorMap2185.ipaParent = "ə"
        newColorMap2185.color = "lightPink"
        
        newLetterCombo637.colorMapList.append(objectsIn: [newColorMap2184,newColorMap2185])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo637])
        //===================================
        let newLetterCombo395 = LetterCombo()
        newLetterCombo395.letterCombo = "aa"
        newLetterCombo395.ipaParent = "ə"
        
        let newColorMap890 = ColorMap()
        newColorMap890.LetterComboParent = "aa"
        newColorMap890.ipaParent = "ə"
        newColorMap890.color = "lightPink"
        
        let newColorMap891 = ColorMap()
        newColorMap891.LetterComboParent = "aa"
        newColorMap891.ipaParent = "ə"
        newColorMap891.color = "lightPink"
        
        newLetterCombo395.colorMapList.append(objectsIn: [newColorMap890,newColorMap891])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo395])
        //===================================
        let newLetterCombo396 = LetterCombo()
        newLetterCombo396.letterCombo = "ei"
        newLetterCombo396.ipaParent = "ə"
        
        let newColorMap892 = ColorMap()
        newColorMap892.LetterComboParent = "ei"
        newColorMap892.ipaParent = "ə"
        newColorMap892.color = "lightPink"
        
        let newColorMap893 = ColorMap()
        newColorMap893.LetterComboParent = "ei"
        newColorMap893.ipaParent = "ə"
        newColorMap893.color = "lightPink"
        
        newLetterCombo396.colorMapList.append(objectsIn: [newColorMap892,newColorMap893])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo396])
        //===================================
        let newLetterCombo397 = LetterCombo()
        newLetterCombo397.letterCombo = "ie"
        newLetterCombo397.ipaParent = "ə"
        
        let newColorMap894 = ColorMap()
        newColorMap894.LetterComboParent = "ie"
        newColorMap894.ipaParent = "ə"
        newColorMap894.color = "lightPink"
        
        let newColorMap895 = ColorMap()
        newColorMap895.LetterComboParent = "ie"
        newColorMap895.ipaParent = "ə"
        newColorMap895.color = "lightPink"
        
        newLetterCombo397.colorMapList.append(objectsIn: [newColorMap894,newColorMap895])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo397])
        //===================================
        let newLetterCombo398 = LetterCombo()
        newLetterCombo398.letterCombo = "ae"
        newLetterCombo398.ipaParent = "ə"
        
        let newColorMap896 = ColorMap()
        newColorMap896.LetterComboParent = "ae"
        newColorMap896.ipaParent = "ə"
        newColorMap896.color = "lightPink"
        
        let newColorMap897 = ColorMap()
        newColorMap897.LetterComboParent = "ae"
        newColorMap897.ipaParent = "ə"
        newColorMap897.color = "lightPink"
        
        newLetterCombo398.colorMapList.append(objectsIn: [newColorMap896,newColorMap897])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo398])
        //===================================
        let newLetterCombo399 = LetterCombo()
        newLetterCombo399.letterCombo = "ah"
        newLetterCombo399.ipaParent = "ə"
        
        let newColorMap898 = ColorMap()
        newColorMap898.LetterComboParent = "ah"
        newColorMap898.ipaParent = "ə"
        newColorMap898.color = "lightPink"
        
        let newColorMap899 = ColorMap()
        newColorMap899.LetterComboParent = "ah"
        newColorMap899.ipaParent = "ə"
        newColorMap899.color = "lightGrey"
        
        newLetterCombo399.colorMapList.append(objectsIn: [newColorMap898,newColorMap899])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo399])
        //===================================
        let newLetterCombo400 = LetterCombo()
        newLetterCombo400.letterCombo = "ai"
        newLetterCombo400.ipaParent = "ə"
        
        let newColorMap900 = ColorMap()
        newColorMap900.LetterComboParent = "ai"
        newColorMap900.ipaParent = "ə"
        newColorMap900.color = "lightPink"
        
        let newColorMap901 = ColorMap()
        newColorMap901.LetterComboParent = "ai"
        newColorMap901.ipaParent = "ə"
        newColorMap901.color = "lightPink"
        
        newLetterCombo400.colorMapList.append(objectsIn: [newColorMap900,newColorMap901])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo400])
        //===================================
        let newLetterCombo401 = LetterCombo()
        newLetterCombo401.letterCombo = "ua"
        newLetterCombo401.ipaParent = "ə"
        
        let newColorMap902 = ColorMap()
        newColorMap902.LetterComboParent = "ua"
        newColorMap902.ipaParent = "ə"
        newColorMap902.color = "lightPink"
        
        let newColorMap903 = ColorMap()
        newColorMap903.LetterComboParent = "ua"
        newColorMap903.ipaParent = "ə"
        newColorMap903.color = "lightPink"
        
        newLetterCombo401.colorMapList.append(objectsIn: [newColorMap902,newColorMap903])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo401])
        //===================================
        let newLetterCombo402 = LetterCombo()
        newLetterCombo402.letterCombo = "oe"
        newLetterCombo402.ipaParent = "ə"
        
        let newColorMap904 = ColorMap()
        newColorMap904.LetterComboParent = "oe"
        newColorMap904.ipaParent = "ə"
        newColorMap904.color = "lightPink"
        
        let newColorMap905 = ColorMap()
        newColorMap905.LetterComboParent = "oe"
        newColorMap905.ipaParent = "ə"
        newColorMap905.color = "lightPink"
        
        newLetterCombo402.colorMapList.append(objectsIn: [newColorMap904,newColorMap905])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo402])
        //===================================
        let newLetterCombo403 = LetterCombo()
        newLetterCombo403.letterCombo = "au"
        newLetterCombo403.ipaParent = "ə"
        
        let newColorMap906 = ColorMap()
        newColorMap906.LetterComboParent = "au"
        newColorMap906.ipaParent = "ə"
        newColorMap906.color = "lightPink"
        
        let newColorMap907 = ColorMap()
        newColorMap907.LetterComboParent = "au"
        newColorMap907.ipaParent = "ə"
        newColorMap907.color = "lightPink"
        
        newLetterCombo403.colorMapList.append(objectsIn: [newColorMap906,newColorMap907])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo403])
        //===================================
        let newLetterCombo404 = LetterCombo()
        newLetterCombo404.letterCombo = "ue"
        newLetterCombo404.ipaParent = "ə"
        
        let newColorMap908 = ColorMap()
        newColorMap908.LetterComboParent = "ue"
        newColorMap908.ipaParent = "ə"
        newColorMap908.color = "lightPink"
        
        let newColorMap909 = ColorMap()
        newColorMap909.LetterComboParent = "ue"
        newColorMap909.ipaParent = "ə"
        newColorMap909.color = "lightPink"
        
        newLetterCombo404.colorMapList.append(objectsIn: [newColorMap908,newColorMap909])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo404])
        //===================================
        let newLetterCombo405 = LetterCombo()
        newLetterCombo405.letterCombo = "oo"
        newLetterCombo405.ipaParent = "ə"
        
        let newColorMap910 = ColorMap()
        newColorMap910.LetterComboParent = "oo"
        newColorMap910.ipaParent = "ə"
        newColorMap910.color = "lightPink"
        
        let newColorMap911 = ColorMap()
        newColorMap911.LetterComboParent = "oo"
        newColorMap911.ipaParent = "ə"
        newColorMap911.color = "lightPink"
        
        newLetterCombo405.colorMapList.append(objectsIn: [newColorMap910,newColorMap911])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo405])
        //===================================
        let newLetterCombo406 = LetterCombo()
        newLetterCombo406.letterCombo = "ou"
        newLetterCombo406.ipaParent = "ə"
        
        let newColorMap912 = ColorMap()
        newColorMap912.LetterComboParent = "ou"
        newColorMap912.ipaParent = "ə"
        newColorMap912.color = "lightPink"
        
        let newColorMap913 = ColorMap()
        newColorMap913.LetterComboParent = "ou"
        newColorMap913.ipaParent = "ə"
        newColorMap913.color = "lightPink"
        
        newLetterCombo406.colorMapList.append(objectsIn: [newColorMap912,newColorMap913])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo406])
        //===================================
        let newLetterCombo746 = LetterCombo()
        newLetterCombo746.letterCombo = "iu"
        newLetterCombo746.ipaParent = "ə"
        
        let newColorMap2443 = ColorMap()
        newColorMap2443.LetterComboParent = "iu"
        newColorMap2443.ipaParent = "ə"
        newColorMap2443.color = "lightPink"
        
        let newColorMap2444 = ColorMap()
        newColorMap2444.LetterComboParent = "iu"
        newColorMap2444.ipaParent = "ə"
        newColorMap2444.color = "lightPink"
        
        newLetterCombo746.colorMapList.append(objectsIn: [newColorMap2443,newColorMap2444])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo746])
        //===================================
        let newLetterCombo407 = LetterCombo()
        newLetterCombo407.letterCombo = "ui"
        newLetterCombo407.ipaParent = "ə"
        
        let newColorMap914 = ColorMap()
        newColorMap914.LetterComboParent = "ui"
        newColorMap914.ipaParent = "ə"
        newColorMap914.color = "lightPink"
        
        let newColorMap915 = ColorMap()
        newColorMap915.LetterComboParent = "ui"
        newColorMap915.ipaParent = "ə"
        newColorMap915.color = "lightPink"
        
        newLetterCombo407.colorMapList.append(objectsIn: [newColorMap914,newColorMap915])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo407])
        //===================================
        let newLetterCombo723 = LetterCombo()
        newLetterCombo723.letterCombo = "io"
        newLetterCombo723.ipaParent = "ə"
        
        let newColorMap2394 = ColorMap()
        newColorMap2394.LetterComboParent = "io"
        newColorMap2394.ipaParent = "ə"
        newColorMap2394.color = "lightPink"
        
        let newColorMap2395 = ColorMap()
        newColorMap2395.LetterComboParent = "io"
        newColorMap2395.ipaParent = "ə"
        newColorMap2395.color = "lightPink"
        
        newLetterCombo723.colorMapList.append(objectsIn: [newColorMap2394,newColorMap2395])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo723])
        //===================================
        let newLetterCombo724 = LetterCombo()
        newLetterCombo724.letterCombo = "ih"
        newLetterCombo724.ipaParent = "ə"
        
        let newColorMap2396 = ColorMap()
        newColorMap2396.LetterComboParent = "ih"
        newColorMap2396.ipaParent = "ə"
        newColorMap2396.color = "lightPink"
        
        let newColorMap2397 = ColorMap()
        newColorMap2397.LetterComboParent = "ih"
        newColorMap2397.ipaParent = "ə"
        newColorMap2397.color = "lightGrey"
        
        newLetterCombo724.colorMapList.append(objectsIn: [newColorMap2396,newColorMap2397])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo724])
        //===================================
        let newLetterCombo725 = LetterCombo()
        newLetterCombo725.letterCombo = "ea"
        newLetterCombo725.ipaParent = "ə"
        
        let newColorMap2398 = ColorMap()
        newColorMap2398.LetterComboParent = "ea"
        newColorMap2398.ipaParent = "ə"
        newColorMap2398.color = "lightPink"
        
        let newColorMap2399 = ColorMap()
        newColorMap2399.LetterComboParent = "ea"
        newColorMap2399.ipaParent = "ə"
        newColorMap2399.color = "lightPink"
        
        newLetterCombo725.colorMapList.append(objectsIn: [newColorMap2398,newColorMap2399])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo725])
        //===================================
        let newLetterCombo726 = LetterCombo()
        newLetterCombo726.letterCombo = "oi"
        newLetterCombo726.ipaParent = "ə"
        
        let newColorMap2400 = ColorMap()
        newColorMap2400.LetterComboParent = "oi"
        newColorMap2400.ipaParent = "ə"
        newColorMap2400.color = "lightPink"
        
        let newColorMap2401 = ColorMap()
        newColorMap2401.LetterComboParent = "oi"
        newColorMap2401.ipaParent = "ə"
        newColorMap2401.color = "lightPink"
        
        newLetterCombo726.colorMapList.append(objectsIn: [newColorMap2400,newColorMap2401])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo726])
        //===================================
        let newLetterCombo727 = LetterCombo()
        newLetterCombo727.letterCombo = "eo"
        newLetterCombo727.ipaParent = "ə"
        
        let newColorMap2402 = ColorMap()
        newColorMap2402.LetterComboParent = "eo"
        newColorMap2402.ipaParent = "ə"
        newColorMap2402.color = "lightPink"
        
        let newColorMap2403 = ColorMap()
        newColorMap2403.LetterComboParent = "eo"
        newColorMap2403.ipaParent = "ə"
        newColorMap2403.color = "lightPink"
        
        newLetterCombo727.colorMapList.append(objectsIn: [newColorMap2402,newColorMap2403])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo727])
        //===================================
        let newLetterCombo742 = LetterCombo()
        newLetterCombo742.letterCombo = "eu"
        newLetterCombo742.ipaParent = "ə"
        
        let newColorMap2432 = ColorMap()
        newColorMap2432.LetterComboParent = "eu"
        newColorMap2432.ipaParent = "ə"
        newColorMap2432.color = "lightPink"
        
        let newColorMap2433 = ColorMap()
        newColorMap2433.LetterComboParent = "eu"
        newColorMap2433.ipaParent = "ə"
        newColorMap2433.color = "lightPink"
        
        newLetterCombo742.colorMapList.append(objectsIn: [newColorMap2432,newColorMap2433])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo742])
        //===================================
        let newLetterCombo638 = LetterCombo()
        newLetterCombo638.letterCombo = "er"
        newLetterCombo638.ipaParent = "ə"
        
        let newColorMap2186 = ColorMap()
        newColorMap2186.LetterComboParent = "er"
        newColorMap2186.ipaParent = "ə"
        newColorMap2186.color = "lightPink"
        
        let newColorMap2187 = ColorMap()
        newColorMap2187.LetterComboParent = "er"
        newColorMap2187.ipaParent = "ə"
        newColorMap2187.color = "lightGrey"
        
        newLetterCombo638.colorMapList.append(objectsIn: [newColorMap2186,newColorMap2187])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo638])
        //===================================
        let newLetterCombo408 = LetterCombo()
        newLetterCombo408.letterCombo = "o"
        newLetterCombo408.ipaParent = "ə"
        
        let newColorMap916 = ColorMap()
        newColorMap916.LetterComboParent = "o"
        newColorMap916.ipaParent = "ə"
        newColorMap916.color = "lightPink"
        
        newLetterCombo408.colorMapList.append(objectsIn: [newColorMap916])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo408])
        //===================================
        let newLetterCombo409 = LetterCombo()
        newLetterCombo409.letterCombo = "a"
        newLetterCombo409.ipaParent = "ə"
        
        let newColorMap917 = ColorMap()
        newColorMap917.LetterComboParent = "a"
        newColorMap917.ipaParent = "ə"
        newColorMap917.color = "lightPink"
        
        newLetterCombo409.colorMapList.append(objectsIn: [newColorMap917])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo409])
        //===================================
        let newLetterCombo410 = LetterCombo()
        newLetterCombo410.letterCombo = "i"
        newLetterCombo410.ipaParent = "ə"
        
        let newColorMap918 = ColorMap()
        newColorMap918.LetterComboParent = "i"
        newColorMap918.ipaParent = "ə"
        newColorMap918.color = "lightPink"
        
        newLetterCombo410.colorMapList.append(objectsIn: [newColorMap918])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo410])
        //===================================
        let newLetterCombo411 = LetterCombo()
        newLetterCombo411.letterCombo = "u"
        newLetterCombo411.ipaParent = "ə"
        
        let newColorMap919 = ColorMap()
        newColorMap919.LetterComboParent = "u"
        newColorMap919.ipaParent = "ə"
        newColorMap919.color = "lightPink"
        
        newLetterCombo411.colorMapList.append(objectsIn: [newColorMap919])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo411])
        //===================================
        let newLetterCombo412 = LetterCombo()
        newLetterCombo412.letterCombo = "e"
        newLetterCombo412.ipaParent = "ə"
        
        let newColorMap920 = ColorMap()
        newColorMap920.LetterComboParent = "e"
        newColorMap920.ipaParent = "ə"
        newColorMap920.color = "lightPink"
        
        newLetterCombo412.colorMapList.append(objectsIn: [newColorMap920])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo412])
        //===================================
        let newLetterCombo413 = LetterCombo()
        newLetterCombo413.letterCombo = "y"
        newLetterCombo413.ipaParent = "ə"
        
        let newColorMap921 = ColorMap()
        newColorMap921.LetterComboParent = "y"
        newColorMap921.ipaParent = "ə"
        newColorMap921.color = "lightPink"
        
        newLetterCombo413.colorMapList.append(objectsIn: [newColorMap921])
        newIPALetter54.letterCombos.append(objectsIn: [newLetterCombo413])
        
        // =========================================
        // MARK: - "ɛ"
        // =========================================
        let newIPALetter56 = IPALetter()
        newIPALetter56.ipaLetter = "ɛ"
        
        //===================================
        let newLetterCombo434 = LetterCombo()
        newLetterCombo434.letterCombo = "ai"
        newLetterCombo434.ipaParent = "ɛ"
        
        let newColorMap958 = ColorMap()
        newColorMap958.LetterComboParent = "ai"
        newColorMap958.ipaParent = "ɛ"
        newColorMap958.color = "darkGreen"
        
        let newColorMap959 = ColorMap()
        newColorMap959.LetterComboParent = "ai"
        newColorMap959.ipaParent = "ɛ"
        newColorMap959.color = "darkGreen"
        
        newLetterCombo434.colorMapList.append(objectsIn: [newColorMap958,newColorMap959])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo434])
        //===================================
        let newLetterCombo435 = LetterCombo()
        newLetterCombo435.letterCombo = "ea"
        newLetterCombo435.ipaParent = "ɛ"
        
        let newColorMap960 = ColorMap()
        newColorMap960.LetterComboParent = "ea"
        newColorMap960.ipaParent = "ɛ"
        newColorMap960.color = "darkGreen"
        
        let newColorMap961 = ColorMap()
        newColorMap961.LetterComboParent = "ea"
        newColorMap961.ipaParent = "ɛ"
        newColorMap961.color = "darkGreen"
        
        newLetterCombo435.colorMapList.append(objectsIn: [newColorMap960,newColorMap961])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo435])
        //===================================
        let newLetterCombo436 = LetterCombo()
        newLetterCombo436.letterCombo = "ae"
        newLetterCombo436.ipaParent = "ɛ"
        
        let newColorMap962 = ColorMap()
        newColorMap962.LetterComboParent = "ae"
        newColorMap962.ipaParent = "ɛ"
        newColorMap962.color = "darkGreen"
        
        let newColorMap963 = ColorMap()
        newColorMap963.LetterComboParent = "ae"
        newColorMap963.ipaParent = "ɛ"
        newColorMap963.color = "darkGreen"
        
        newLetterCombo436.colorMapList.append(objectsIn: [newColorMap962,newColorMap963])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo436])
        //===================================
        let newLetterCombo437 = LetterCombo()
        newLetterCombo437.letterCombo = "ay"
        newLetterCombo437.ipaParent = "ɛ"
        
        let newColorMap964 = ColorMap()
        newColorMap964.LetterComboParent = "ay"
        newColorMap964.ipaParent = "ɛ"
        newColorMap964.color = "darkGreen"
        
        let newColorMap965 = ColorMap()
        newColorMap965.LetterComboParent = "ay"
        newColorMap965.ipaParent = "ɛ"
        newColorMap965.color = "darkGreen"
        
        newLetterCombo437.colorMapList.append(objectsIn: [newColorMap964,newColorMap965])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo437])
        //===================================
        let newLetterCombo438 = LetterCombo()
        newLetterCombo438.letterCombo = "ie"
        newLetterCombo438.ipaParent = "ɛ"
        
        let newColorMap966 = ColorMap()
        newColorMap966.LetterComboParent = "ie"
        newColorMap966.ipaParent = "ɛ"
        newColorMap966.color = "darkGreen"
        
        let newColorMap967 = ColorMap()
        newColorMap967.LetterComboParent = "ie"
        newColorMap967.ipaParent = "ɛ"
        newColorMap967.color = "darkGreen"
        
        newLetterCombo438.colorMapList.append(objectsIn: [newColorMap966,newColorMap967])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo438])
        //===================================
        let newLetterCombo439 = LetterCombo()
        newLetterCombo439.letterCombo = "eo"
        newLetterCombo439.ipaParent = "ɛ"
        
        let newColorMap968 = ColorMap()
        newColorMap968.LetterComboParent = "eo"
        newColorMap968.ipaParent = "ɛ"
        newColorMap968.color = "darkGreen"
        
        let newColorMap969 = ColorMap()
        newColorMap969.LetterComboParent = "eo"
        newColorMap969.ipaParent = "ɛ"
        newColorMap969.color = "darkGreen"
        
        newLetterCombo439.colorMapList.append(objectsIn: [newColorMap968,newColorMap969])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo439])
        //===================================
        let newLetterCombo440 = LetterCombo()
        newLetterCombo440.letterCombo = "ue"
        newLetterCombo440.ipaParent = "ɛ"
        
        let newColorMap970 = ColorMap()
        newColorMap970.LetterComboParent = "ue"
        newColorMap970.ipaParent = "ɛ"
        newColorMap970.color = "darkGreen"
        
        let newColorMap971 = ColorMap()
        newColorMap971.LetterComboParent = "ue"
        newColorMap971.ipaParent = "ɛ"
        newColorMap971.color = "darkGreen"
        
        newLetterCombo440.colorMapList.append(objectsIn: [newColorMap970,newColorMap971])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo440])
        //===================================
        let newLetterCombo732 = LetterCombo()
        newLetterCombo732.letterCombo = "ei"
        newLetterCombo732.ipaParent = "ɛ"
        
        let newColorMap2412 = ColorMap()
        newColorMap2412.LetterComboParent = "ei"
        newColorMap2412.ipaParent = "ɛ"
        newColorMap2412.color = "darkGreen"
        
        let newColorMap2413 = ColorMap()
        newColorMap2413.LetterComboParent = "ei"
        newColorMap2413.ipaParent = "ɛ"
        newColorMap2413.color = "darkGreen"
        
        newLetterCombo732.colorMapList.append(objectsIn: [newColorMap2412,newColorMap2413])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo732])
        //===================================
        let newLetterCombo733 = LetterCombo()
        newLetterCombo733.letterCombo = "ey"
        newLetterCombo733.ipaParent = "ɛ"
        
        let newColorMap2414 = ColorMap()
        newColorMap2414.LetterComboParent = "ey"
        newColorMap2414.ipaParent = "ɛ"
        newColorMap2414.color = "darkGreen"
        
        let newColorMap2415 = ColorMap()
        newColorMap2415.LetterComboParent = "ey"
        newColorMap2415.ipaParent = "ɛ"
        newColorMap2415.color = "darkGreen"
        
        newLetterCombo733.colorMapList.append(objectsIn: [newColorMap2414,newColorMap2415])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo733])
        //===================================
        let newLetterCombo441 = LetterCombo()
        newLetterCombo441.letterCombo = "e"
        newLetterCombo441.ipaParent = "ɛ"
        
        let newColorMap972 = ColorMap()
        newColorMap972.LetterComboParent = "e"
        newColorMap972.ipaParent = "ɛ"
        newColorMap972.color = "darkGreen"
        
        newLetterCombo441.colorMapList.append(objectsIn: [newColorMap972])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo441])
        //===================================
        let newLetterCombo442 = LetterCombo()
        newLetterCombo442.letterCombo = "a"
        newLetterCombo442.ipaParent = "ɛ"
        
        let newColorMap973 = ColorMap()
        newColorMap973.LetterComboParent = "a"
        newColorMap973.ipaParent = "ɛ"
        newColorMap973.color = "darkGreen"
        
        newLetterCombo442.colorMapList.append(objectsIn: [newColorMap973])
        newIPALetter56.letterCombos.append(objectsIn: [newLetterCombo442])
        
        // =========================================
        // MARK: - "i"
        // =========================================
        let newIPALetter58 = IPALetter()
        newIPALetter58.ipaLetter = "i"
        
        //===================================
        let newLetterCombo452 = LetterCombo()
        newLetterCombo452.letterCombo = "eye"
        newLetterCombo452.ipaParent = "i"
        
        let newColorMap990 = ColorMap()
        newColorMap990.LetterComboParent = "eye"
        newColorMap990.ipaParent = "i"
        newColorMap990.color = "seaBlue"
        
        let newColorMap991 = ColorMap()
        newColorMap991.LetterComboParent = "eye"
        newColorMap991.ipaParent = "i"
        newColorMap991.color = "seaBlue"
        
        let newColorMap992 = ColorMap()
        newColorMap992.LetterComboParent = "eye"
        newColorMap992.ipaParent = "i"
        newColorMap992.color = "lightGrey"
        
        newLetterCombo452.colorMapList.append(objectsIn: [newColorMap990,newColorMap991,newColorMap992])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo452])
        //===================================
        let newLetterCombo453 = LetterCombo()
        newLetterCombo453.letterCombo = "ue"
        newLetterCombo453.ipaParent = "i"
        
        let newColorMap993 = ColorMap()
        newColorMap993.LetterComboParent = "ue"
        newColorMap993.ipaParent = "i"
        newColorMap993.color = "seaBlue"
        
        let newColorMap994 = ColorMap()
        newColorMap994.LetterComboParent = "ue"
        newColorMap994.ipaParent = "i"
        newColorMap994.color = "seaBlue"
        
        newLetterCombo453.colorMapList.append(objectsIn: [newColorMap993,newColorMap994])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo453])
        //===================================
        let newLetterCombo454 = LetterCombo()
        newLetterCombo454.letterCombo = "oe"
        newLetterCombo454.ipaParent = "i"
        
        let newColorMap995 = ColorMap()
        newColorMap995.LetterComboParent = "oe"
        newColorMap995.ipaParent = "i"
        newColorMap995.color = "seaBlue"
        
        let newColorMap996 = ColorMap()
        newColorMap996.LetterComboParent = "oe"
        newColorMap996.ipaParent = "i"
        newColorMap996.color = "seaBlue"
        
        newLetterCombo454.colorMapList.append(objectsIn: [newColorMap995,newColorMap996])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo454])
        //===================================
        let newLetterCombo455 = LetterCombo()
        newLetterCombo455.letterCombo = "is"
        newLetterCombo455.ipaParent = "i"
        
        let newColorMap997 = ColorMap()
        newColorMap997.LetterComboParent = "is"
        newColorMap997.ipaParent = "i"
        newColorMap997.color = "seaBlue"
        
        let newColorMap998 = ColorMap()
        newColorMap998.LetterComboParent = "is"
        newColorMap998.ipaParent = "i"
        newColorMap998.color = "lightGrey"
        
        newLetterCombo455.colorMapList.append(objectsIn: [newColorMap997,newColorMap998])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo455])
        //===================================
        let newLetterCombo456 = LetterCombo()
        newLetterCombo456.letterCombo = "ie"
        newLetterCombo456.ipaParent = "i"
        
        let newColorMap999 = ColorMap()
        newColorMap999.LetterComboParent = "ie"
        newColorMap999.ipaParent = "i"
        newColorMap999.color = "seaBlue"
        
        let newColorMap1000 = ColorMap()
        newColorMap1000.LetterComboParent = "ie"
        newColorMap1000.ipaParent = "i"
        newColorMap1000.color = "seaBlue"
        
        newLetterCombo456.colorMapList.append(objectsIn: [newColorMap999,newColorMap1000])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo456])
        //===================================
        let newLetterCombo457 = LetterCombo()
        newLetterCombo457.letterCombo = "ee"
        newLetterCombo457.ipaParent = "i"
        
        let newColorMap1001 = ColorMap()
        newColorMap1001.LetterComboParent = "ee"
        newColorMap1001.ipaParent = "i"
        newColorMap1001.color = "seaBlue"
        
        let newColorMap1002 = ColorMap()
        newColorMap1002.LetterComboParent = "ee"
        newColorMap1002.ipaParent = "i"
        newColorMap1002.color = "seaBlue"
        
        newLetterCombo457.colorMapList.append(objectsIn: [newColorMap1001,newColorMap1002])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo457])
        //===================================
        let newLetterCombo458 = LetterCombo()
        newLetterCombo458.letterCombo = "ea"
        newLetterCombo458.ipaParent = "i"
        
        let newColorMap1003 = ColorMap()
        newColorMap1003.LetterComboParent = "ea"
        newColorMap1003.ipaParent = "i"
        newColorMap1003.color = "seaBlue"
        
        let newColorMap1004 = ColorMap()
        newColorMap1004.LetterComboParent = "ea"
        newColorMap1004.ipaParent = "i"
        newColorMap1004.color = "seaBlue"
        
        newLetterCombo458.colorMapList.append(objectsIn: [newColorMap1003,newColorMap1004])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo458])
        //===================================
        let newLetterCombo459 = LetterCombo()
        newLetterCombo459.letterCombo = "ae"
        newLetterCombo459.ipaParent = "i"
        
        let newColorMap1005 = ColorMap()
        newColorMap1005.LetterComboParent = "ae"
        newColorMap1005.ipaParent = "i"
        newColorMap1005.color = "seaBlue"
        
        let newColorMap1006 = ColorMap()
        newColorMap1006.LetterComboParent = "ae"
        newColorMap1006.ipaParent = "i"
        newColorMap1006.color = "seaBlue"
        
        newLetterCombo459.colorMapList.append(objectsIn: [newColorMap1005,newColorMap1006])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo459])
        //===================================
        let newLetterCombo460 = LetterCombo()
        newLetterCombo460.letterCombo = "ei"
        newLetterCombo460.ipaParent = "i"
        
        let newColorMap1007 = ColorMap()
        newColorMap1007.LetterComboParent = "ei"
        newColorMap1007.ipaParent = "i"
        newColorMap1007.color = "seaBlue"
        
        let newColorMap1008 = ColorMap()
        newColorMap1008.LetterComboParent = "ei"
        newColorMap1008.ipaParent = "i"
        newColorMap1008.color = "seaBlue"
        
        newLetterCombo460.colorMapList.append(objectsIn: [newColorMap1007,newColorMap1008])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo460])
        //===================================
        let newLetterCombo461 = LetterCombo()
        newLetterCombo461.letterCombo = "eo"
        newLetterCombo461.ipaParent = "i"
        
        let newColorMap1009 = ColorMap()
        newColorMap1009.LetterComboParent = "eo"
        newColorMap1009.ipaParent = "i"
        newColorMap1009.color = "seaBlue"
        
        let newColorMap1010 = ColorMap()
        newColorMap1010.LetterComboParent = "eo"
        newColorMap1010.ipaParent = "i"
        newColorMap1010.color = "seaBlue"
        
        newLetterCombo461.colorMapList.append(objectsIn: [newColorMap1009,newColorMap1010])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo461])
        //===================================
        let newLetterCombo462 = LetterCombo()
        newLetterCombo462.letterCombo = "ey"
        newLetterCombo462.ipaParent = "i"
        
        let newColorMap1011 = ColorMap()
        newColorMap1011.LetterComboParent = "ey"
        newColorMap1011.ipaParent = "i"
        newColorMap1011.color = "seaBlue"
        
        let newColorMap1012 = ColorMap()
        newColorMap1012.LetterComboParent = "ey"
        newColorMap1012.ipaParent = "i"
        newColorMap1012.color = "seaBlue"
        
        newLetterCombo462.colorMapList.append(objectsIn: [newColorMap1011,newColorMap1012])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo462])
        //===================================
        let newLetterCombo464 = LetterCombo()
        newLetterCombo464.letterCombo = "y"
        newLetterCombo464.ipaParent = "i"
        
        let newColorMap1015 = ColorMap()
        newColorMap1015.LetterComboParent = "y"
        newColorMap1015.ipaParent = "i"
        newColorMap1015.color = "seaBlue"
        
        newLetterCombo464.colorMapList.append(objectsIn: [newColorMap1015])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo464])
        //===================================
        let newLetterCombo465 = LetterCombo()
        newLetterCombo465.letterCombo = "e"
        newLetterCombo465.ipaParent = "i"
        
        let newColorMap1016 = ColorMap()
        newColorMap1016.LetterComboParent = "e"
        newColorMap1016.ipaParent = "i"
        newColorMap1016.color = "seaBlue"
        
        newLetterCombo465.colorMapList.append(objectsIn: [newColorMap1016])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo465])
        //===================================
        let newLetterCombo466 = LetterCombo()
        newLetterCombo466.letterCombo = "i"
        newLetterCombo466.ipaParent = "i"
        
        let newColorMap1017 = ColorMap()
        newColorMap1017.LetterComboParent = "i"
        newColorMap1017.ipaParent = "i"
        newColorMap1017.color = "seaBlue"
        
        newLetterCombo466.colorMapList.append(objectsIn: [newColorMap1017])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo466])
        //===================================
        let newLetterCombo467 = LetterCombo()
        newLetterCombo467.letterCombo = "a"
        newLetterCombo467.ipaParent = "i"
        
        let newColorMap1018 = ColorMap()
        newColorMap1018.LetterComboParent = "a"
        newColorMap1018.ipaParent = "i"
        newColorMap1018.color = "seaBlue"
        
        newLetterCombo467.colorMapList.append(objectsIn: [newColorMap1018])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo467])
        //===================================
        let newLetterCombo639 = LetterCombo()
        newLetterCombo639.letterCombo = "o"
        newLetterCombo639.ipaParent = "i"
        
        let newColorMap2188 = ColorMap()
        newColorMap2188.LetterComboParent = "o"
        newColorMap2188.ipaParent = "i"
        newColorMap2188.color = "seaBlue"
        
        newLetterCombo639.colorMapList.append(objectsIn: [newColorMap2188])
        newIPALetter58.letterCombos.append(objectsIn: [newLetterCombo639])
        
        // =========================================
        // MARK: - "ɪ"
        // =========================================
        let newIPALetter59 = IPALetter()
        newIPALetter59.ipaLetter = "ɪ"
        
        //===================================
        let newLetterCombo640 = LetterCombo()
        newLetterCombo640.letterCombo = "iou"
        newLetterCombo640.ipaParent = "ɪ"
        
        let newColorMap2189 = ColorMap()
        newColorMap2189.LetterComboParent = "iou"
        newColorMap2189.ipaParent = "ɪ"
        newColorMap2189.color = "orange"
        
        let newColorMap2190 = ColorMap()
        newColorMap2190.LetterComboParent = "iou"
        newColorMap2190.ipaParent = "ɪ"
        newColorMap2190.color = "orange"
        
        let newColorMap2191 = ColorMap()
        newColorMap2191.LetterComboParent = "iou"
        newColorMap2191.ipaParent = "ɪ"
        newColorMap2191.color = "orange"
        
        newLetterCombo640.colorMapList.append(objectsIn: [newColorMap2189,newColorMap2190,newColorMap2191])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo640])
        //===================================
        let newLetterCombo641 = LetterCombo()
        newLetterCombo641.letterCombo = "eou"
        newLetterCombo641.ipaParent = "ɪ"
        
        let newColorMap2192 = ColorMap()
        newColorMap2192.LetterComboParent = "eou"
        newColorMap2192.ipaParent = "ɪ"
        newColorMap2192.color = "orange"
        
        let newColorMap2193 = ColorMap()
        newColorMap2193.LetterComboParent = "eou"
        newColorMap2193.ipaParent = "ɪ"
        newColorMap2193.color = "orange"
        
        let newColorMap2194 = ColorMap()
        newColorMap2194.LetterComboParent = "eou"
        newColorMap2194.ipaParent = "ɪ"
        newColorMap2194.color = "orange"
        
        newLetterCombo641.colorMapList.append(objectsIn: [newColorMap2192,newColorMap2193,newColorMap2194])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo641])
        //===================================
        let newLetterCombo468 = LetterCombo()
        newLetterCombo468.letterCombo = "ea"
        newLetterCombo468.ipaParent = "ɪ"
        
        let newColorMap1019 = ColorMap()
        newColorMap1019.LetterComboParent = "ea"
        newColorMap1019.ipaParent = "ɪ"
        newColorMap1019.color = "orange"
        
        let newColorMap1020 = ColorMap()
        newColorMap1020.LetterComboParent = "ea"
        newColorMap1020.ipaParent = "ɪ"
        newColorMap1020.color = "orange"
        
        newLetterCombo468.colorMapList.append(objectsIn: [newColorMap1019,newColorMap1020])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo468])
        //===================================
        let newLetterCombo469 = LetterCombo()
        newLetterCombo469.letterCombo = "ee"
        newLetterCombo469.ipaParent = "ɪ"
        
        let newColorMap1021 = ColorMap()
        newColorMap1021.LetterComboParent = "ee"
        newColorMap1021.ipaParent = "ɪ"
        newColorMap1021.color = "orange"
        
        let newColorMap1022 = ColorMap()
        newColorMap1022.LetterComboParent = "ee"
        newColorMap1022.ipaParent = "ɪ"
        newColorMap1022.color = "orange"
        
        newLetterCombo469.colorMapList.append(objectsIn: [newColorMap1021,newColorMap1022])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo469])
        //===================================
        let newLetterCombo470 = LetterCombo()
        newLetterCombo470.letterCombo = "ei"
        newLetterCombo470.ipaParent = "ɪ"
        
        let newColorMap1023 = ColorMap()
        newColorMap1023.LetterComboParent = "ei"
        newColorMap1023.ipaParent = "ɪ"
        newColorMap1023.color = "orange"
        
        let newColorMap1024 = ColorMap()
        newColorMap1024.LetterComboParent = "ei"
        newColorMap1024.ipaParent = "ɪ"
        newColorMap1024.color = "orange"
        
        newLetterCombo470.colorMapList.append(objectsIn: [newColorMap1023,newColorMap1024])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo470])
        //===================================
        let newLetterCombo471 = LetterCombo()
        newLetterCombo471.letterCombo = "ia"
        newLetterCombo471.ipaParent = "ɪ"
        
        let newColorMap1025 = ColorMap()
        newColorMap1025.LetterComboParent = "ia"
        newColorMap1025.ipaParent = "ɪ"
        newColorMap1025.color = "orange"
        
        let newColorMap1026 = ColorMap()
        newColorMap1026.LetterComboParent = "ia"
        newColorMap1026.ipaParent = "ɪ"
        newColorMap1026.color = "orange"
        
        newLetterCombo471.colorMapList.append(objectsIn: [newColorMap1025,newColorMap1026])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo471])
        //===================================
        let newLetterCombo472 = LetterCombo()
        newLetterCombo472.letterCombo = "ui"
        newLetterCombo472.ipaParent = "ɪ"
        
        let newColorMap1027 = ColorMap()
        newColorMap1027.LetterComboParent = "ui"
        newColorMap1027.ipaParent = "ɪ"
        newColorMap1027.color = "orange"
        
        let newColorMap1028 = ColorMap()
        newColorMap1028.LetterComboParent = "ui"
        newColorMap1028.ipaParent = "ɪ"
        newColorMap1028.color = "orange"
        
        newLetterCombo472.colorMapList.append(objectsIn: [newColorMap1027,newColorMap1028])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo472])
        //===================================
        let newLetterCombo642 = LetterCombo()
        newLetterCombo642.letterCombo = "aa"
        newLetterCombo642.ipaParent = "ɪ"
        
        let newColorMap2195 = ColorMap()
        newColorMap2195.LetterComboParent = "aa"
        newColorMap2195.ipaParent = "ɪ"
        newColorMap2195.color = "orange"
        
        let newColorMap2196 = ColorMap()
        newColorMap2196.LetterComboParent = "aa"
        newColorMap2196.ipaParent = "ɪ"
        newColorMap2196.color = "orange"
        
        newLetterCombo642.colorMapList.append(objectsIn: [newColorMap2195,newColorMap2196])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo642])
        //===================================
        let newLetterCombo643 = LetterCombo()
        newLetterCombo643.letterCombo = "ai"
        newLetterCombo643.ipaParent = "ɪ"
        
        let newColorMap2197 = ColorMap()
        newColorMap2197.LetterComboParent = "ai"
        newColorMap2197.ipaParent = "ɪ"
        newColorMap2197.color = "orange"
        
        let newColorMap2198 = ColorMap()
        newColorMap2198.LetterComboParent = "ai"
        newColorMap2198.ipaParent = "ɪ"
        newColorMap2198.color = "orange"
        
        newLetterCombo643.colorMapList.append(objectsIn: [newColorMap2197,newColorMap2198])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo643])
        //===================================
        let newLetterCombo644 = LetterCombo()
        newLetterCombo644.letterCombo = "ou"
        newLetterCombo644.ipaParent = "ɪ"
        
        let newColorMap2199 = ColorMap()
        newColorMap2199.LetterComboParent = "ou"
        newColorMap2199.ipaParent = "ɪ"
        newColorMap2199.color = "orange"
        
        let newColorMap2200 = ColorMap()
        newColorMap2200.LetterComboParent = "ou"
        newColorMap2200.ipaParent = "ɪ"
        newColorMap2200.color = "orange"
        
        newLetterCombo644.colorMapList.append(objectsIn: [newColorMap2199,newColorMap2200])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo644])
        //===================================
        let newLetterCombo645 = LetterCombo()
        newLetterCombo645.letterCombo = "io"
        newLetterCombo645.ipaParent = "ɪ"
        
        let newColorMap2201 = ColorMap()
        newColorMap2201.LetterComboParent = "io"
        newColorMap2201.ipaParent = "ɪ"
        newColorMap2201.color = "orange"
        
        let newColorMap2202 = ColorMap()
        newColorMap2202.LetterComboParent = "io"
        newColorMap2202.ipaParent = "ɪ"
        newColorMap2202.color = "orange"
        
        newLetterCombo645.colorMapList.append(objectsIn: [newColorMap2201,newColorMap2202])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo645])
        //===================================
        let newLetterCombo646 = LetterCombo()
        newLetterCombo646.letterCombo = "ie"
        newLetterCombo646.ipaParent = "ɪ"
        
        let newColorMap2203 = ColorMap()
        newColorMap2203.LetterComboParent = "ie"
        newColorMap2203.ipaParent = "ɪ"
        newColorMap2203.color = "orange"
        
        let newColorMap2204 = ColorMap()
        newColorMap2204.LetterComboParent = "ie"
        newColorMap2204.ipaParent = "ɪ"
        newColorMap2204.color = "orange"
        
        newLetterCombo646.colorMapList.append(objectsIn: [newColorMap2203,newColorMap2204])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo646])
        //===================================
        let newLetterCombo647 = LetterCombo()
        newLetterCombo647.letterCombo = "ih"
        newLetterCombo647.ipaParent = "ɪ"
        
        let newColorMap2205 = ColorMap()
        newColorMap2205.LetterComboParent = "ih"
        newColorMap2205.ipaParent = "ɪ"
        newColorMap2205.color = "orange"
        
        let newColorMap2206 = ColorMap()
        newColorMap2206.LetterComboParent = "ih"
        newColorMap2206.ipaParent = "ɪ"
        newColorMap2206.color = "lightGrey"
        
        newLetterCombo647.colorMapList.append(objectsIn: [newColorMap2205,newColorMap2206])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo647])
        //===================================
        let newLetterCombo730 = LetterCombo()
        newLetterCombo730.letterCombo = "oi"
        newLetterCombo730.ipaParent = "ɪ"
        
        let newColorMap2408 = ColorMap()
        newColorMap2408.LetterComboParent = "oi"
        newColorMap2408.ipaParent = "ɪ"
        newColorMap2408.color = "orange"
        
        let newColorMap2409 = ColorMap()
        newColorMap2409.LetterComboParent = "oi"
        newColorMap2409.ipaParent = "ɪ"
        newColorMap2409.color = "orange"
        
        newLetterCombo730.colorMapList.append(objectsIn: [newColorMap2408,newColorMap2409])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo730])
        //===================================
        let newLetterCombo731 = LetterCombo()
        newLetterCombo731.letterCombo = "eo"
        newLetterCombo731.ipaParent = "ɪ"
        
        let newColorMap2410 = ColorMap()
        newColorMap2410.LetterComboParent = "eo"
        newColorMap2410.ipaParent = "ɪ"
        newColorMap2410.color = "orange"
        
        let newColorMap2411 = ColorMap()
        newColorMap2411.LetterComboParent = "eo"
        newColorMap2411.ipaParent = "ɪ"
        newColorMap2411.color = "orange"
        
        newLetterCombo731.colorMapList.append(objectsIn: [newColorMap2410,newColorMap2411])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo731])
        //===================================
        let newLetterCombo473 = LetterCombo()
        newLetterCombo473.letterCombo = "i"
        newLetterCombo473.ipaParent = "ɪ"
        
        let newColorMap1029 = ColorMap()
        newColorMap1029.LetterComboParent = "i"
        newColorMap1029.ipaParent = "ɪ"
        newColorMap1029.color = "orange"
        
        newLetterCombo473.colorMapList.append(objectsIn: [newColorMap1029])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo473])
        //===================================
        let newLetterCombo474 = LetterCombo()
        newLetterCombo474.letterCombo = "y"
        newLetterCombo474.ipaParent = "ɪ"
        
        let newColorMap1030 = ColorMap()
        newColorMap1030.LetterComboParent = "y"
        newColorMap1030.ipaParent = "ɪ"
        newColorMap1030.color = "orange"
        
        newLetterCombo474.colorMapList.append(objectsIn: [newColorMap1030])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo474])
        //===================================
        let newLetterCombo475 = LetterCombo()
        newLetterCombo475.letterCombo = "a"
        newLetterCombo475.ipaParent = "ɪ"
        
        let newColorMap1031 = ColorMap()
        newColorMap1031.LetterComboParent = "a"
        newColorMap1031.ipaParent = "ɪ"
        newColorMap1031.color = "orange"
        
        newLetterCombo475.colorMapList.append(objectsIn: [newColorMap1031])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo475])
        //===================================
        let newLetterCombo476 = LetterCombo()
        newLetterCombo476.letterCombo = "e"
        newLetterCombo476.ipaParent = "ɪ"
        
        let newColorMap1032 = ColorMap()
        newColorMap1032.LetterComboParent = "e"
        newColorMap1032.ipaParent = "ɪ"
        newColorMap1032.color = "orange"
        
        newLetterCombo476.colorMapList.append(objectsIn: [newColorMap1032])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo476])
        //===================================
        let newLetterCombo477 = LetterCombo()
        newLetterCombo477.letterCombo = "o"
        newLetterCombo477.ipaParent = "ɪ"
        
        let newColorMap1033 = ColorMap()
        newColorMap1033.LetterComboParent = "o"
        newColorMap1033.ipaParent = "ɪ"
        newColorMap1033.color = "orange"
        
        newLetterCombo477.colorMapList.append(objectsIn: [newColorMap1033])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo477])
        //===================================
        let newLetterCombo478 = LetterCombo()
        newLetterCombo478.letterCombo = "u"
        newLetterCombo478.ipaParent = "ɪ"
        
        let newColorMap1034 = ColorMap()
        newColorMap1034.LetterComboParent = "u"
        newColorMap1034.ipaParent = "ɪ"
        newColorMap1034.color = "orange"
        
        newLetterCombo478.colorMapList.append(objectsIn: [newColorMap1034])
        newIPALetter59.letterCombos.append(objectsIn: [newLetterCombo478])
        
        // =========================================
        // MARK: - "ɔ"
        // =========================================
        let newIPALetter61 = IPALetter()
        newIPALetter61.ipaLetter = "ɔ"
        
        //===================================
        let newLetterCombo490 = LetterCombo()
        newLetterCombo490.letterCombo = "ough"
        newLetterCombo490.ipaParent = "ɔ"
        
        let newColorMap1061 = ColorMap()
        newColorMap1061.LetterComboParent = "ough"
        newColorMap1061.ipaParent = "ɔ"
        newColorMap1061.color = "green"
        
        let newColorMap1062 = ColorMap()
        newColorMap1062.LetterComboParent = "ough"
        newColorMap1062.ipaParent = "ɔ"
        newColorMap1062.color = "green"
        
        let newColorMap1063 = ColorMap()
        newColorMap1063.LetterComboParent = "ough"
        newColorMap1063.ipaParent = "ɔ"
        newColorMap1063.color = "lightGrey"
        
        let newColorMap1064 = ColorMap()
        newColorMap1064.LetterComboParent = "ough"
        newColorMap1064.ipaParent = "ɔ"
        newColorMap1064.color = "lightGrey"
        
        newLetterCombo490.colorMapList.append(objectsIn: [newColorMap1061,newColorMap1062,newColorMap1063,newColorMap1064])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo490])
        //===================================
        let newLetterCombo491 = LetterCombo()
        newLetterCombo491.letterCombo = "augh"
        newLetterCombo491.ipaParent = "ɔ"
        
        let newColorMap1065 = ColorMap()
        newColorMap1065.LetterComboParent = "augh"
        newColorMap1065.ipaParent = "ɔ"
        newColorMap1065.color = "green"
        
        let newColorMap1066 = ColorMap()
        newColorMap1066.LetterComboParent = "augh"
        newColorMap1066.ipaParent = "ɔ"
        newColorMap1066.color = "green"
        
        let newColorMap1067 = ColorMap()
        newColorMap1067.LetterComboParent = "augh"
        newColorMap1067.ipaParent = "ɔ"
        newColorMap1067.color = "lightGrey"
        
        let newColorMap1068 = ColorMap()
        newColorMap1068.LetterComboParent = "augh"
        newColorMap1068.ipaParent = "ɔ"
        newColorMap1068.color = "lightGrey"
        
        newLetterCombo491.colorMapList.append(objectsIn: [newColorMap1065,newColorMap1066,newColorMap1067,newColorMap1068])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo491])
        //===================================
        let newLetterCombo492 = LetterCombo()
        newLetterCombo492.letterCombo = "awe"
        newLetterCombo492.ipaParent = "ɔ"
        
        let newColorMap1069 = ColorMap()
        newColorMap1069.LetterComboParent = "awe"
        newColorMap1069.ipaParent = "ɔ"
        newColorMap1069.color = "green"
        
        let newColorMap1070 = ColorMap()
        newColorMap1070.LetterComboParent = "awe"
        newColorMap1070.ipaParent = "ɔ"
        newColorMap1070.color = "lightGrey"
        
        let newColorMap1071 = ColorMap()
        newColorMap1071.LetterComboParent = "awe"
        newColorMap1071.ipaParent = "ɔ"
        newColorMap1071.color = "lightGrey"
        
        newLetterCombo492.colorMapList.append(objectsIn: [newColorMap1069,newColorMap1070,newColorMap1071])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo492])
        //===================================
        let newLetterCombo648 = LetterCombo()
        newLetterCombo648.letterCombo = "ach"
        newLetterCombo648.ipaParent = "ɔ"
        
        let newColorMap2207 = ColorMap()
        newColorMap2207.LetterComboParent = "ach"
        newColorMap2207.ipaParent = "ɔ"
        newColorMap2207.color = "green"
        
        let newColorMap2208 = ColorMap()
        newColorMap2208.LetterComboParent = "ach"
        newColorMap2208.ipaParent = "ɔ"
        newColorMap2208.color = "lightGrey"
        
        let newColorMap2209 = ColorMap()
        newColorMap2209.LetterComboParent = "ach"
        newColorMap2209.ipaParent = "ɔ"
        newColorMap2209.color = "lightGrey"
        
        newLetterCombo648.colorMapList.append(objectsIn: [newColorMap2207,newColorMap2208,newColorMap2209])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo648])
        //===================================
        let newLetterCombo649 = LetterCombo()
        newLetterCombo649.letterCombo = "oh"
        newLetterCombo649.ipaParent = "ɔ"
        
        let newColorMap2210 = ColorMap()
        newColorMap2210.LetterComboParent = "oh"
        newColorMap2210.ipaParent = "ɔ"
        newColorMap2210.color = "green"
        
        let newColorMap2211 = ColorMap()
        newColorMap2211.LetterComboParent = "oh"
        newColorMap2211.ipaParent = "ɔ"
        newColorMap2211.color = "lightGrey"
        
        newLetterCombo649.colorMapList.append(objectsIn: [newColorMap2210,newColorMap2211])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo649])
        //===================================
        let newLetterCombo650 = LetterCombo()
        newLetterCombo650.letterCombo = "ho"
        newLetterCombo650.ipaParent = "ɔ"
        
        let newColorMap2212 = ColorMap()
        newColorMap2212.LetterComboParent = "ho"
        newColorMap2212.ipaParent = "ɔ"
        newColorMap2212.color = "lightGrey"
        
        let newColorMap2213 = ColorMap()
        newColorMap2213.LetterComboParent = "ho"
        newColorMap2213.ipaParent = "ɔ"
        newColorMap2213.color = "green"
        
        newLetterCombo650.colorMapList.append(objectsIn: [newColorMap2212,newColorMap2213])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo650])
        //===================================
        let newLetterCombo651 = LetterCombo()
        newLetterCombo651.letterCombo = "ah"
        newLetterCombo651.ipaParent = "ɔ"
        
        let newColorMap2214 = ColorMap()
        newColorMap2214.LetterComboParent = "ah"
        newColorMap2214.ipaParent = "ɔ"
        newColorMap2214.color = "green"
        
        let newColorMap2215 = ColorMap()
        newColorMap2215.LetterComboParent = "ah"
        newColorMap2215.ipaParent = "ɔ"
        newColorMap2215.color = "lightGrey"
        
        newLetterCombo651.colorMapList.append(objectsIn: [newColorMap2214,newColorMap2215])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo651])
        //===================================
        let newLetterCombo652 = LetterCombo()
        newLetterCombo652.letterCombo = "ow"
        newLetterCombo652.ipaParent = "ɔ"
        
        let newColorMap2216 = ColorMap()
        newColorMap2216.LetterComboParent = "ow"
        newColorMap2216.ipaParent = "ɔ"
        newColorMap2216.color = "green"
        
        let newColorMap2217 = ColorMap()
        newColorMap2217.LetterComboParent = "ow"
        newColorMap2217.ipaParent = "ɔ"
        newColorMap2217.color = "lightGrey"
        
        newLetterCombo652.colorMapList.append(objectsIn: [newColorMap2216,newColorMap2217])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo652])
        //===================================
        let newLetterCombo653 = LetterCombo()
        newLetterCombo653.letterCombo = "ua"
        newLetterCombo653.ipaParent = "ɔ"
        
        let newColorMap2218 = ColorMap()
        newColorMap2218.LetterComboParent = "ua"
        newColorMap2218.ipaParent = "ɔ"
        newColorMap2218.color = "green"
        
        let newColorMap2219 = ColorMap()
        newColorMap2219.LetterComboParent = "ua"
        newColorMap2219.ipaParent = "ɔ"
        newColorMap2219.color = "green"
        
        newLetterCombo653.colorMapList.append(objectsIn: [newColorMap2218,newColorMap2219])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo653])
        //===================================
        let newLetterCombo654 = LetterCombo()
        newLetterCombo654.letterCombo = "aa"
        newLetterCombo654.ipaParent = "ɔ"
        
        let newColorMap2220 = ColorMap()
        newColorMap2220.LetterComboParent = "aa"
        newColorMap2220.ipaParent = "ɔ"
        newColorMap2220.color = "green"
        
        let newColorMap2221 = ColorMap()
        newColorMap2221.LetterComboParent = "aa"
        newColorMap2221.ipaParent = "ɔ"
        newColorMap2221.color = "green"
        
        newLetterCombo654.colorMapList.append(objectsIn: [newColorMap2220,newColorMap2221])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo654])
        //===================================
        let newLetterCombo655 = LetterCombo()
        newLetterCombo655.letterCombo = "is"
        newLetterCombo655.ipaParent = "ɔ"
        
        let newColorMap2222 = ColorMap()
        newColorMap2222.LetterComboParent = "is"
        newColorMap2222.ipaParent = "ɔ"
        newColorMap2222.color = "green"
        
        let newColorMap2223 = ColorMap()
        newColorMap2223.LetterComboParent = "is"
        newColorMap2223.ipaParent = "ɔ"
        newColorMap2223.color = "lightGrey"
        
        newLetterCombo655.colorMapList.append(objectsIn: [newColorMap2222,newColorMap2223])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo655])
        //===================================
        let newLetterCombo656 = LetterCombo()
        newLetterCombo656.letterCombo = "'a"
        newLetterCombo656.ipaParent = "ɔ"
        
        let newColorMap2224 = ColorMap()
        newColorMap2224.LetterComboParent = "'a"
        newColorMap2224.ipaParent = "ɔ"
        newColorMap2224.color = "lightGrey"
        
        let newColorMap2225 = ColorMap()
        newColorMap2225.LetterComboParent = "'a"
        newColorMap2225.ipaParent = "ɔ"
        newColorMap2225.color = "green"
        
        newLetterCombo656.colorMapList.append(objectsIn: [newColorMap2224,newColorMap2225])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo656])
        //===================================
        let newLetterCombo493 = LetterCombo()
        newLetterCombo493.letterCombo = "aw"
        newLetterCombo493.ipaParent = "ɔ"
        
        let newColorMap1072 = ColorMap()
        newColorMap1072.LetterComboParent = "aw"
        newColorMap1072.ipaParent = "ɔ"
        newColorMap1072.color = "green"
        
        let newColorMap1073 = ColorMap()
        newColorMap1073.LetterComboParent = "aw"
        newColorMap1073.ipaParent = "ɔ"
        newColorMap1073.color = "lightGrey"
        
        newLetterCombo493.colorMapList.append(objectsIn: [newColorMap1072,newColorMap1073])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo493])
        //===================================
        let newLetterCombo494 = LetterCombo()
        newLetterCombo494.letterCombo = "au"
        newLetterCombo494.ipaParent = "ɔ"
        
        let newColorMap1074 = ColorMap()
        newColorMap1074.LetterComboParent = "au"
        newColorMap1074.ipaParent = "ɔ"
        newColorMap1074.color = "green"
        
        let newColorMap1075 = ColorMap()
        newColorMap1075.LetterComboParent = "au"
        newColorMap1075.ipaParent = "ɔ"
        newColorMap1075.color = "green"
        
        newLetterCombo494.colorMapList.append(objectsIn: [newColorMap1074,newColorMap1075])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo494])
        //===================================
        let newLetterCombo495 = LetterCombo()
        newLetterCombo495.letterCombo = "oa"
        newLetterCombo495.ipaParent = "ɔ"
        
        let newColorMap1076 = ColorMap()
        newColorMap1076.LetterComboParent = "oa"
        newColorMap1076.ipaParent = "ɔ"
        newColorMap1076.color = "green"
        
        let newColorMap1077 = ColorMap()
        newColorMap1077.LetterComboParent = "oa"
        newColorMap1077.ipaParent = "ɔ"
        newColorMap1077.color = "green"
        
        newLetterCombo495.colorMapList.append(objectsIn: [newColorMap1076,newColorMap1077])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo495])
        //===================================
        let newLetterCombo737 = LetterCombo()
        newLetterCombo737.letterCombo = "ou"
        newLetterCombo737.ipaParent = "ɔ"
        
        let newColorMap2421 = ColorMap()
        newColorMap2421.LetterComboParent = "ou"
        newColorMap2421.ipaParent = "ɔ"
        newColorMap2421.color = "green"
        
        let newColorMap2422 = ColorMap()
        newColorMap2422.LetterComboParent = "ou"
        newColorMap2422.ipaParent = "ɔ"
        newColorMap2422.color = "green"
        
        newLetterCombo737.colorMapList.append(objectsIn: [newColorMap2421,newColorMap2422])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo737])
        //===================================
        let newLetterCombo496 = LetterCombo()
        newLetterCombo496.letterCombo = "o"
        newLetterCombo496.ipaParent = "ɔ"
        
        let newColorMap1078 = ColorMap()
        newColorMap1078.LetterComboParent = "o"
        newColorMap1078.ipaParent = "ɔ"
        newColorMap1078.color = "green"
        
        newLetterCombo496.colorMapList.append(objectsIn: [newColorMap1078])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo496])
        //===================================
        let newLetterCombo497 = LetterCombo()
        newLetterCombo497.letterCombo = "a"
        newLetterCombo497.ipaParent = "ɔ"
        
        let newColorMap1079 = ColorMap()
        newColorMap1079.LetterComboParent = "a"
        newColorMap1079.ipaParent = "ɔ"
        newColorMap1079.color = "green"
        
        newLetterCombo497.colorMapList.append(objectsIn: [newColorMap1079])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo497])
        //===================================
        let newLetterCombo657 = LetterCombo()
        newLetterCombo657.letterCombo = "i"
        newLetterCombo657.ipaParent = "ɔ"
        
        let newColorMap2226 = ColorMap()
        newColorMap2226.LetterComboParent = "i"
        newColorMap2226.ipaParent = "ɔ"
        newColorMap2226.color = "green"
        
        newLetterCombo657.colorMapList.append(objectsIn: [newColorMap2226])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo657])
        //===================================
        let newLetterCombo738 = LetterCombo()
        newLetterCombo738.letterCombo = "e"
        newLetterCombo738.ipaParent = "ɔ"
        
        let newColorMap2423 = ColorMap()
        newColorMap2423.LetterComboParent = "e"
        newColorMap2423.ipaParent = "ɔ"
        newColorMap2423.color = "green"
        
        newLetterCombo738.colorMapList.append(objectsIn: [newColorMap2423])
        newIPALetter61.letterCombos.append(objectsIn: [newLetterCombo738])
        
        
        // =========================================
        // MARK: - "u"
        // =========================================
        let newIPALetter62 = IPALetter()
        newIPALetter62.ipaLetter = "u"
        
        //===================================
        let newLetterCombo499 = LetterCombo()
        newLetterCombo499.letterCombo = "ough"
        newLetterCombo499.ipaParent = "u"
        
        let newColorMap1082 = ColorMap()
        newColorMap1082.LetterComboParent = "ough"
        newColorMap1082.ipaParent = "u"
        newColorMap1082.color = "lightGreen"
        
        let newColorMap1083 = ColorMap()
        newColorMap1083.LetterComboParent = "ough"
        newColorMap1083.ipaParent = "u"
        newColorMap1083.color = "lightGreen"
        
        let newColorMap1084 = ColorMap()
        newColorMap1084.LetterComboParent = "ough"
        newColorMap1084.ipaParent = "u"
        newColorMap1084.color = "lightGrey"
        
        let newColorMap1085 = ColorMap()
        newColorMap1085.LetterComboParent = "ough"
        newColorMap1085.ipaParent = "u"
        newColorMap1085.color = "lightGrey"
        
        newLetterCombo499.colorMapList.append(objectsIn: [newColorMap1082,newColorMap1083,newColorMap1084,newColorMap1085])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo499])
        //===================================
        let newLetterCombo500 = LetterCombo()
        newLetterCombo500.letterCombo = "oup"
        newLetterCombo500.ipaParent = "u"
        
        let newColorMap1086 = ColorMap()
        newColorMap1086.LetterComboParent = "oup"
        newColorMap1086.ipaParent = "u"
        newColorMap1086.color = "lightGreen"
        
        let newColorMap1087 = ColorMap()
        newColorMap1087.LetterComboParent = "oup"
        newColorMap1087.ipaParent = "u"
        newColorMap1087.color = "lightGreen"
        
        let newColorMap1088 = ColorMap()
        newColorMap1088.LetterComboParent = "oup"
        newColorMap1088.ipaParent = "u"
        newColorMap1088.color = "lightGrey"
        
        newLetterCombo500.colorMapList.append(objectsIn: [newColorMap1086,newColorMap1087,newColorMap1088])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo500])
        //===================================
        let newLetterCombo501 = LetterCombo()
        newLetterCombo501.letterCombo = "oo"
        newLetterCombo501.ipaParent = "u"
        
        let newColorMap1089 = ColorMap()
        newColorMap1089.LetterComboParent = "oo"
        newColorMap1089.ipaParent = "u"
        newColorMap1089.color = "lightGreen"
        
        let newColorMap1090 = ColorMap()
        newColorMap1090.LetterComboParent = "oo"
        newColorMap1090.ipaParent = "u"
        newColorMap1090.color = "lightGreen"
        
        newLetterCombo501.colorMapList.append(objectsIn: [newColorMap1089,newColorMap1090])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo501])
        //===================================
        let newLetterCombo502 = LetterCombo()
        newLetterCombo502.letterCombo = "eu"
        newLetterCombo502.ipaParent = "u"
        
        let newColorMap1091 = ColorMap()
        newColorMap1091.LetterComboParent = "eu"
        newColorMap1091.ipaParent = "u"
        newColorMap1091.color = "lightGreen"
        
        let newColorMap1092 = ColorMap()
        newColorMap1092.LetterComboParent = "eu"
        newColorMap1092.ipaParent = "u"
        newColorMap1092.color = "lightGreen"
        
        newLetterCombo502.colorMapList.append(objectsIn: [newColorMap1091,newColorMap1092])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo502])
        //===================================
        let newLetterCombo503 = LetterCombo()
        newLetterCombo503.letterCombo = "ue"
        newLetterCombo503.ipaParent = "u"
        
        let newColorMap1093 = ColorMap()
        newColorMap1093.LetterComboParent = "ue"
        newColorMap1093.ipaParent = "u"
        newColorMap1093.color = "lightGreen"
        
        let newColorMap1094 = ColorMap()
        newColorMap1094.LetterComboParent = "ue"
        newColorMap1094.ipaParent = "u"
        newColorMap1094.color = "lightGreen"
        
        newLetterCombo503.colorMapList.append(objectsIn: [newColorMap1093,newColorMap1094])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo503])
        //===================================
        let newLetterCombo504 = LetterCombo()
        newLetterCombo504.letterCombo = "ew"
        newLetterCombo504.ipaParent = "u"
        
        let newColorMap1095 = ColorMap()
        newColorMap1095.LetterComboParent = "ew"
        newColorMap1095.ipaParent = "u"
        newColorMap1095.color = "lightGreen"
        
        let newColorMap1096 = ColorMap()
        newColorMap1096.LetterComboParent = "ew"
        newColorMap1096.ipaParent = "u"
        newColorMap1096.color = "lightGrey"
        
        newLetterCombo504.colorMapList.append(objectsIn: [newColorMap1095,newColorMap1096])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo504])
        //===================================
        let newLetterCombo505 = LetterCombo()
        newLetterCombo505.letterCombo = "oe"
        newLetterCombo505.ipaParent = "u"
        
        let newColorMap1097 = ColorMap()
        newColorMap1097.LetterComboParent = "oe"
        newColorMap1097.ipaParent = "u"
        newColorMap1097.color = "lightGreen"
        
        let newColorMap1098 = ColorMap()
        newColorMap1098.LetterComboParent = "oe"
        newColorMap1098.ipaParent = "u"
        newColorMap1098.color = "lightGreen"
        
        newLetterCombo505.colorMapList.append(objectsIn: [newColorMap1097,newColorMap1098])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo505])
        //===================================
        let newLetterCombo506 = LetterCombo()
        newLetterCombo506.letterCombo = "ou"
        newLetterCombo506.ipaParent = "u"
        
        let newColorMap1099 = ColorMap()
        newColorMap1099.LetterComboParent = "ou"
        newColorMap1099.ipaParent = "u"
        newColorMap1099.color = "lightGreen"
        
        let newColorMap1100 = ColorMap()
        newColorMap1100.LetterComboParent = "ou"
        newColorMap1100.ipaParent = "u"
        newColorMap1100.color = "lightGreen"
        
        newLetterCombo506.colorMapList.append(objectsIn: [newColorMap1099,newColorMap1100])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo506])
        //===================================
        let newLetterCombo507 = LetterCombo()
        newLetterCombo507.letterCombo = "ui"
        newLetterCombo507.ipaParent = "u"
        
        let newColorMap1101 = ColorMap()
        newColorMap1101.LetterComboParent = "ui"
        newColorMap1101.ipaParent = "u"
        newColorMap1101.color = "lightGreen"
        
        let newColorMap1102 = ColorMap()
        newColorMap1102.LetterComboParent = "ui"
        newColorMap1102.ipaParent = "u"
        newColorMap1102.color = "lightGreen"
        
        newLetterCombo507.colorMapList.append(objectsIn: [newColorMap1101,newColorMap1102])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo507])
        //===================================
        let newLetterCombo508 = LetterCombo()
        newLetterCombo508.letterCombo = "uo"
        newLetterCombo508.ipaParent = "u"
        
        let newColorMap1103 = ColorMap()
        newColorMap1103.LetterComboParent = "uo"
        newColorMap1103.ipaParent = "u"
        newColorMap1103.color = "lightGreen"
        
        let newColorMap1104 = ColorMap()
        newColorMap1104.LetterComboParent = "uo"
        newColorMap1104.ipaParent = "u"
        newColorMap1104.color = "lightGreen"
        
        newLetterCombo508.colorMapList.append(objectsIn: [newColorMap1103,newColorMap1104])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo508])
        //===================================
        let newLetterCombo509 = LetterCombo()
        newLetterCombo509.letterCombo = "wo"
        newLetterCombo509.ipaParent = "u"
        
        let newColorMap1105 = ColorMap()
        newColorMap1105.LetterComboParent = "wo"
        newColorMap1105.ipaParent = "u"
        newColorMap1105.color = "lightGrey"
        
        let newColorMap1106 = ColorMap()
        newColorMap1106.LetterComboParent = "wo"
        newColorMap1106.ipaParent = "u"
        newColorMap1106.color = "lightGreen"
        
        newLetterCombo509.colorMapList.append(objectsIn: [newColorMap1105,newColorMap1106])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo509])
        //===================================
        let newLetterCombo510 = LetterCombo()
        newLetterCombo510.letterCombo = "u"
        newLetterCombo510.ipaParent = "u"
        
        let newColorMap1107 = ColorMap()
        newColorMap1107.LetterComboParent = "u"
        newColorMap1107.ipaParent = "u"
        newColorMap1107.color = "lightGreen"
        
        newLetterCombo510.colorMapList.append(objectsIn: [newColorMap1107])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo510])
        //===================================
        let newLetterCombo511 = LetterCombo()
        newLetterCombo511.letterCombo = "o"
        newLetterCombo511.ipaParent = "u"
        
        let newColorMap1108 = ColorMap()
        newColorMap1108.LetterComboParent = "o"
        newColorMap1108.ipaParent = "u"
        newColorMap1108.color = "lightGreen"
        
        newLetterCombo511.colorMapList.append(objectsIn: [newColorMap1108])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo511])
        //===================================
        let newLetterCombo658 = LetterCombo()
        newLetterCombo658.letterCombo = "e"
        newLetterCombo658.ipaParent = "u"
        
        let newColorMap2227 = ColorMap()
        newColorMap2227.LetterComboParent = "e"
        newColorMap2227.ipaParent = "u"
        newColorMap2227.color = "lightGreen"
        
        newLetterCombo658.colorMapList.append(objectsIn: [newColorMap2227])
        newIPALetter62.letterCombos.append(objectsIn: [newLetterCombo658])
        
        // =========================================
        // MARK: - "ʊ"
        // =========================================
        let newIPALetter63 = IPALetter()
        newIPALetter63.ipaLetter = "ʊ"
        
        //===================================
        let newLetterCombo512 = LetterCombo()
        newLetterCombo512.letterCombo = "ou"
        newLetterCombo512.ipaParent = "ʊ"
        
        let newColorMap1109 = ColorMap()
        newColorMap1109.LetterComboParent = "ou"
        newColorMap1109.ipaParent = "ʊ"
        newColorMap1109.color = "lightBlue"
        
        let newColorMap1110 = ColorMap()
        newColorMap1110.LetterComboParent = "ou"
        newColorMap1110.ipaParent = "ʊ"
        newColorMap1110.color = "lightBlue"
        
        newLetterCombo512.colorMapList.append(objectsIn: [newColorMap1109,newColorMap1110])
        newIPALetter63.letterCombos.append(objectsIn: [newLetterCombo512])
        //===================================
        let newLetterCombo514 = LetterCombo()
        newLetterCombo514.letterCombo = "oo"
        newLetterCombo514.ipaParent = "ʊ"
        
        let newColorMap1114 = ColorMap()
        newColorMap1114.LetterComboParent = "oo"
        newColorMap1114.ipaParent = "ʊ"
        newColorMap1114.color = "lightBlue"
        
        let newColorMap1115 = ColorMap()
        newColorMap1115.LetterComboParent = "oo"
        newColorMap1115.ipaParent = "ʊ"
        newColorMap1115.color = "lightBlue"
        
        newLetterCombo514.colorMapList.append(objectsIn: [newColorMap1114,newColorMap1115])
        newIPALetter63.letterCombos.append(objectsIn: [newLetterCombo514])
        //===================================
        let newLetterCombo515 = LetterCombo()
        newLetterCombo515.letterCombo = "u"
        newLetterCombo515.ipaParent = "ʊ"
        
        let newColorMap1116 = ColorMap()
        newColorMap1116.LetterComboParent = "u"
        newColorMap1116.ipaParent = "ʊ"
        newColorMap1116.color = "lightBlue"
        
        newLetterCombo515.colorMapList.append(objectsIn: [newColorMap1116])
        newIPALetter63.letterCombos.append(objectsIn: [newLetterCombo515])
        //===================================
        let newLetterCombo516 = LetterCombo()
        newLetterCombo516.letterCombo = "o"
        newLetterCombo516.ipaParent = "ʊ"
        
        let newColorMap1117 = ColorMap()
        newColorMap1117.LetterComboParent = "o"
        newColorMap1117.ipaParent = "ʊ"
        newColorMap1117.color = "lightBlue"
        
        newLetterCombo516.colorMapList.append(objectsIn: [newColorMap1117])
        newIPALetter63.letterCombos.append(objectsIn: [newLetterCombo516])
        
        // =========================================
        // MARK: - "oʊl"
        // =========================================
        let newIPALetter64 = IPALetter()
        newIPALetter64.ipaLetter = "oʊl"
        
        //===================================
        let newLetterCombo660 = LetterCombo()
        newLetterCombo660.letterCombo = "ou'll"
        newLetterCombo660.ipaParent = "oʊl"
        
        let newColorMap2233 = ColorMap()
        newColorMap2233.LetterComboParent = "ou'll"
        newColorMap2233.ipaParent = "oʊl"
        newColorMap2233.color = "lightGrey"
        
        let newColorMap2234 = ColorMap()
        newColorMap2234.LetterComboParent = "ou'll"
        newColorMap2234.ipaParent = "oʊl"
        newColorMap2234.color = "lightGrey"
        
        let newColorMap2235 = ColorMap()
        newColorMap2235.LetterComboParent = "ou'll"
        newColorMap2235.ipaParent = "oʊl"
        newColorMap2235.color = "lightGrey"
        
        let newColorMap2236 = ColorMap()
        newColorMap2236.LetterComboParent = "ou'll"
        newColorMap2236.ipaParent = "oʊl"
        newColorMap2236.color = "darkGrey"
        
        let newColorMap2237 = ColorMap()
        newColorMap2237.LetterComboParent = "ou'll"
        newColorMap2237.ipaParent = "oʊl"
        newColorMap2237.color = "darkGrey"
        
        newLetterCombo660.colorMapList.append(objectsIn: [newColorMap2233,newColorMap2234,newColorMap2235,newColorMap2236,newColorMap2237])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo660])
        //===================================
        let newLetterCombo661 = LetterCombo()
        newLetterCombo661.letterCombo = "ile"
        newLetterCombo661.ipaParent = "oʊl"
        
        let newColorMap2238 = ColorMap()
        newColorMap2238.LetterComboParent = "ile"
        newColorMap2238.ipaParent = "oʊl"
        newColorMap2238.color = "lightGrey"
        
        let newColorMap2239 = ColorMap()
        newColorMap2239.LetterComboParent = "ile"
        newColorMap2239.ipaParent = "oʊl"
        newColorMap2239.color = "darkGrey"
        
        let newColorMap2240 = ColorMap()
        newColorMap2240.LetterComboParent = "ile"
        newColorMap2240.ipaParent = "oʊl"
        newColorMap2240.color = "lightGrey"
        
        newLetterCombo661.colorMapList.append(objectsIn: [newColorMap2238,newColorMap2239,newColorMap2240])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo661])
        //===================================
        let newLetterCombo662 = LetterCombo()
        newLetterCombo662.letterCombo = "ull"
        newLetterCombo662.ipaParent = "oʊl"
        
        let newColorMap2241 = ColorMap()
        newColorMap2241.LetterComboParent = "ull"
        newColorMap2241.ipaParent = "oʊl"
        newColorMap2241.color = "lightGrey"
        
        let newColorMap2242 = ColorMap()
        newColorMap2242.LetterComboParent = "ull"
        newColorMap2242.ipaParent = "oʊl"
        newColorMap2242.color = "darkGrey"
        
        let newColorMap2243 = ColorMap()
        newColorMap2243.LetterComboParent = "ull"
        newColorMap2243.ipaParent = "oʊl"
        newColorMap2243.color = "darkGrey"
        
        newLetterCombo662.colorMapList.append(objectsIn: [newColorMap2241,newColorMap2242,newColorMap2243])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo662])
        //===================================
        let newLetterCombo663 = LetterCombo()
        newLetterCombo663.letterCombo = "all"
        newLetterCombo663.ipaParent = "oʊl"
        
        let newColorMap2244 = ColorMap()
        newColorMap2244.LetterComboParent = "all"
        newColorMap2244.ipaParent = "oʊl"
        newColorMap2244.color = "lightGrey"
        
        let newColorMap2245 = ColorMap()
        newColorMap2245.LetterComboParent = "all"
        newColorMap2245.ipaParent = "oʊl"
        newColorMap2245.color = "darkGrey"
        
        let newColorMap2246 = ColorMap()
        newColorMap2246.LetterComboParent = "all"
        newColorMap2246.ipaParent = "oʊl"
        newColorMap2246.color = "darkGrey"
        
        newLetterCombo663.colorMapList.append(objectsIn: [newColorMap2244,newColorMap2245,newColorMap2246])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo663])
        //===================================
        let newLetterCombo664 = LetterCombo()
        newLetterCombo664.letterCombo = "ule"
        newLetterCombo664.ipaParent = "oʊl"
        
        let newColorMap2247 = ColorMap()
        newColorMap2247.LetterComboParent = "ule"
        newColorMap2247.ipaParent = "oʊl"
        newColorMap2247.color = "lightGrey"
        
        let newColorMap2248 = ColorMap()
        newColorMap2248.LetterComboParent = "ule"
        newColorMap2248.ipaParent = "oʊl"
        newColorMap2248.color = "darkGrey"
        
        let newColorMap2249 = ColorMap()
        newColorMap2249.LetterComboParent = "ule"
        newColorMap2249.ipaParent = "oʊl"
        newColorMap2249.color = "lightGrey"
        
        newLetterCombo664.colorMapList.append(objectsIn: [newColorMap2247,newColorMap2248,newColorMap2249])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo664])
        //===================================
        let newLetterCombo665 = LetterCombo()
        newLetterCombo665.letterCombo = "ial"
        newLetterCombo665.ipaParent = "oʊl"
        
        let newColorMap2250 = ColorMap()
        newColorMap2250.LetterComboParent = "ial"
        newColorMap2250.ipaParent = "oʊl"
        newColorMap2250.color = "lightGrey"
        
        let newColorMap2251 = ColorMap()
        newColorMap2251.LetterComboParent = "ial"
        newColorMap2251.ipaParent = "oʊl"
        newColorMap2251.color = "lightGrey"
        
        let newColorMap2252 = ColorMap()
        newColorMap2252.LetterComboParent = "ial"
        newColorMap2252.ipaParent = "oʊl"
        newColorMap2252.color = "darkGrey"
        
        newLetterCombo665.colorMapList.append(objectsIn: [newColorMap2250,newColorMap2251,newColorMap2252])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo665])
        //===================================
        let newLetterCombo666 = LetterCombo()
        newLetterCombo666.letterCombo = "ual"
        newLetterCombo666.ipaParent = "oʊl"
        
        let newColorMap2253 = ColorMap()
        newColorMap2253.LetterComboParent = "ual"
        newColorMap2253.ipaParent = "oʊl"
        newColorMap2253.color = "lightGrey"
        
        let newColorMap2254 = ColorMap()
        newColorMap2254.LetterComboParent = "ual"
        newColorMap2254.ipaParent = "oʊl"
        newColorMap2254.color = "lightGrey"
        
        let newColorMap2255 = ColorMap()
        newColorMap2255.LetterComboParent = "ual"
        newColorMap2255.ipaParent = "oʊl"
        newColorMap2255.color = "darkGrey"
        
        newLetterCombo666.colorMapList.append(objectsIn: [newColorMap2253,newColorMap2254,newColorMap2255])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo666])
        //===================================
        let newLetterCombo517 = LetterCombo()
        newLetterCombo517.letterCombo = "ole"
        newLetterCombo517.ipaParent = "oʊl"
        
        let newColorMap1118 = ColorMap()
        newColorMap1118.LetterComboParent = "ole"
        newColorMap1118.ipaParent = "oʊl"
        newColorMap1118.color = "lightGrey"
        
        let newColorMap1119 = ColorMap()
        newColorMap1119.LetterComboParent = "ole"
        newColorMap1119.ipaParent = "oʊl"
        newColorMap1119.color = "darkGrey"
        
        let newColorMap1120 = ColorMap()
        newColorMap1120.LetterComboParent = "ole"
        newColorMap1120.ipaParent = "oʊl"
        newColorMap1120.color = "lightGrey"
        
        newLetterCombo517.colorMapList.append(objectsIn: [newColorMap1118,newColorMap1119,newColorMap1120])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo517])
        //===================================
        let newLetterCombo518 = LetterCombo()
        newLetterCombo518.letterCombo = "oal"
        newLetterCombo518.ipaParent = "oʊl"
        
        let newColorMap1121 = ColorMap()
        newColorMap1121.LetterComboParent = "oal"
        newColorMap1121.ipaParent = "oʊl"
        newColorMap1121.color = "lightGrey"
        
        let newColorMap1122 = ColorMap()
        newColorMap1122.LetterComboParent = "oal"
        newColorMap1122.ipaParent = "oʊl"
        newColorMap1122.color = "lightGrey"
        
        let newColorMap1123 = ColorMap()
        newColorMap1123.LetterComboParent = "oal"
        newColorMap1123.ipaParent = "oʊl"
        newColorMap1123.color = "darkGrey"
        
        newLetterCombo518.colorMapList.append(objectsIn: [newColorMap1121,newColorMap1122,newColorMap1123])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo518])
        //===================================
        let newLetterCombo519 = LetterCombo()
        newLetterCombo519.letterCombo = "oul"
        newLetterCombo519.ipaParent = "oʊl"
        
        let newColorMap1124 = ColorMap()
        newColorMap1124.LetterComboParent = "oul"
        newColorMap1124.ipaParent = "oʊl"
        newColorMap1124.color = "lightGrey"
        
        let newColorMap1125 = ColorMap()
        newColorMap1125.LetterComboParent = "oul"
        newColorMap1125.ipaParent = "oʊl"
        newColorMap1125.color = "lightGrey"
        
        let newColorMap1126 = ColorMap()
        newColorMap1126.LetterComboParent = "oul"
        newColorMap1126.ipaParent = "oʊl"
        newColorMap1126.color = "darkGrey"
        
        newLetterCombo519.colorMapList.append(objectsIn: [newColorMap1124,newColorMap1125,newColorMap1126])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo519])
        //===================================
        let newLetterCombo520 = LetterCombo()
        newLetterCombo520.letterCombo = "oll"
        newLetterCombo520.ipaParent = "oʊl"
        
        let newColorMap1127 = ColorMap()
        newColorMap1127.LetterComboParent = "oll"
        newColorMap1127.ipaParent = "oʊl"
        newColorMap1127.color = "lightGrey"
        
        let newColorMap1128 = ColorMap()
        newColorMap1128.LetterComboParent = "oll"
        newColorMap1128.ipaParent = "oʊl"
        newColorMap1128.color = "darkGrey"
        
        let newColorMap1129 = ColorMap()
        newColorMap1129.LetterComboParent = "oll"
        newColorMap1129.ipaParent = "oʊl"
        newColorMap1129.color = "darkGrey"
        
        newLetterCombo520.colorMapList.append(objectsIn: [newColorMap1127,newColorMap1128,newColorMap1129])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo520])
        //===================================
        let newLetterCombo521 = LetterCombo()
        newLetterCombo521.letterCombo = "owl"
        newLetterCombo521.ipaParent = "oʊl"
        
        let newColorMap1130 = ColorMap()
        newColorMap1130.LetterComboParent = "owl"
        newColorMap1130.ipaParent = "oʊl"
        newColorMap1130.color = "lightGrey"
        
        let newColorMap1131 = ColorMap()
        newColorMap1131.LetterComboParent = "owl"
        newColorMap1131.ipaParent = "oʊl"
        newColorMap1131.color = "lightGrey"
        
        let newColorMap1132 = ColorMap()
        newColorMap1132.LetterComboParent = "owl"
        newColorMap1132.ipaParent = "oʊl"
        newColorMap1132.color = "darkGrey"
        
        newLetterCombo521.colorMapList.append(objectsIn: [newColorMap1130,newColorMap1131,newColorMap1132])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo521])
        //===================================
        let newLetterCombo667 = LetterCombo()
        newLetterCombo667.letterCombo = "'ll"
        newLetterCombo667.ipaParent = "oʊl"
        
        let newColorMap2256 = ColorMap()
        newColorMap2256.LetterComboParent = "'ll"
        newColorMap2256.ipaParent = "oʊl"
        newColorMap2256.color = "lightGrey"
        
        let newColorMap2257 = ColorMap()
        newColorMap2257.LetterComboParent = "'ll"
        newColorMap2257.ipaParent = "oʊl"
        newColorMap2257.color = "darkGrey"
        
        let newColorMap2258 = ColorMap()
        newColorMap2258.LetterComboParent = "'ll"
        newColorMap2258.ipaParent = "oʊl"
        newColorMap2258.color = "darkGrey"
        
        newLetterCombo667.colorMapList.append(objectsIn: [newColorMap2256,newColorMap2257,newColorMap2258])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo667])
        //===================================
        let newLetterCombo668 = LetterCombo()
        newLetterCombo668.letterCombo = "le"
        newLetterCombo668.ipaParent = "oʊl"
        
        let newColorMap2259 = ColorMap()
        newColorMap2259.LetterComboParent = "le"
        newColorMap2259.ipaParent = "oʊl"
        newColorMap2259.color = "darkGrey"
        
        let newColorMap2260 = ColorMap()
        newColorMap2260.LetterComboParent = "le"
        newColorMap2260.ipaParent = "oʊl"
        newColorMap2260.color = "lightGrey"
        
        newLetterCombo668.colorMapList.append(objectsIn: [newColorMap2259,newColorMap2260])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo668])
        //===================================
        let newLetterCombo669 = LetterCombo()
        newLetterCombo669.letterCombo = "al"
        newLetterCombo669.ipaParent = "oʊl"
        
        let newColorMap2261 = ColorMap()
        newColorMap2261.LetterComboParent = "al"
        newColorMap2261.ipaParent = "oʊl"
        newColorMap2261.color = "lightGrey"
        
        let newColorMap2262 = ColorMap()
        newColorMap2262.LetterComboParent = "al"
        newColorMap2262.ipaParent = "oʊl"
        newColorMap2262.color = "darkGrey"
        
        newLetterCombo669.colorMapList.append(objectsIn: [newColorMap2261,newColorMap2262])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo669])
        //===================================
        let newLetterCombo670 = LetterCombo()
        newLetterCombo670.letterCombo = "el"
        newLetterCombo670.ipaParent = "oʊl"
        
        let newColorMap2263 = ColorMap()
        newColorMap2263.LetterComboParent = "el"
        newColorMap2263.ipaParent = "oʊl"
        newColorMap2263.color = "lightGrey"
        
        let newColorMap2264 = ColorMap()
        newColorMap2264.LetterComboParent = "el"
        newColorMap2264.ipaParent = "oʊl"
        newColorMap2264.color = "darkGrey"
        
        newLetterCombo670.colorMapList.append(objectsIn: [newColorMap2263,newColorMap2264])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo670])
        //===================================
        let newLetterCombo671 = LetterCombo()
        newLetterCombo671.letterCombo = "il"
        newLetterCombo671.ipaParent = "oʊl"
        
        let newColorMap2265 = ColorMap()
        newColorMap2265.LetterComboParent = "il"
        newColorMap2265.ipaParent = "oʊl"
        newColorMap2265.color = "lightGrey"
        
        let newColorMap2266 = ColorMap()
        newColorMap2266.LetterComboParent = "il"
        newColorMap2266.ipaParent = "oʊl"
        newColorMap2266.color = "darkGrey"
        
        newLetterCombo671.colorMapList.append(objectsIn: [newColorMap2265,newColorMap2266])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo671])
        //===================================
        let newLetterCombo672 = LetterCombo()
        newLetterCombo672.letterCombo = "ul"
        newLetterCombo672.ipaParent = "oʊl"
        
        let newColorMap2267 = ColorMap()
        newColorMap2267.LetterComboParent = "ul"
        newColorMap2267.ipaParent = "oʊl"
        newColorMap2267.color = "lightGrey"
        
        let newColorMap2268 = ColorMap()
        newColorMap2268.LetterComboParent = "ul"
        newColorMap2268.ipaParent = "oʊl"
        newColorMap2268.color = "darkGrey"
        
        newLetterCombo672.colorMapList.append(objectsIn: [newColorMap2267,newColorMap2268])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo672])
        //===================================
        let newLetterCombo522 = LetterCombo()
        newLetterCombo522.letterCombo = "ol"
        newLetterCombo522.ipaParent = "oʊl"
        
        let newColorMap1133 = ColorMap()
        newColorMap1133.LetterComboParent = "ol"
        newColorMap1133.ipaParent = "oʊl"
        newColorMap1133.color = "lightGrey"
        
        let newColorMap1134 = ColorMap()
        newColorMap1134.LetterComboParent = "ol"
        newColorMap1134.ipaParent = "oʊl"
        newColorMap1134.color = "darkGrey"
        
        newLetterCombo522.colorMapList.append(objectsIn: [newColorMap1133,newColorMap1134])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo522])
        //===================================
        let newLetterCombo673 = LetterCombo()
        newLetterCombo673.letterCombo = "yl"
        newLetterCombo673.ipaParent = "oʊl"
        
        let newColorMap2269 = ColorMap()
        newColorMap2269.LetterComboParent = "yl"
        newColorMap2269.ipaParent = "oʊl"
        newColorMap2269.color = "lightGrey"
        
        let newColorMap2270 = ColorMap()
        newColorMap2270.LetterComboParent = "yl"
        newColorMap2270.ipaParent = "oʊl"
        newColorMap2270.color = "darkGrey"
        
        newLetterCombo673.colorMapList.append(objectsIn: [newColorMap2269,newColorMap2270])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo673])
        //===================================
        let newLetterCombo674 = LetterCombo()
        newLetterCombo674.letterCombo = "ll"
        newLetterCombo674.ipaParent = "oʊl"
        
        let newColorMap2271 = ColorMap()
        newColorMap2271.LetterComboParent = "ll"
        newColorMap2271.ipaParent = "oʊl"
        newColorMap2271.color = "darkGrey"
        
        let newColorMap2272 = ColorMap()
        newColorMap2272.LetterComboParent = "ll"
        newColorMap2272.ipaParent = "oʊl"
        newColorMap2272.color = "darkGrey"
        
        newLetterCombo674.colorMapList.append(objectsIn: [newColorMap2271,newColorMap2272])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo674])
        //===================================
        let newLetterCombo675 = LetterCombo()
        newLetterCombo675.letterCombo = "l"
        newLetterCombo675.ipaParent = "oʊl"
        
        let newColorMap2273 = ColorMap()
        newColorMap2273.LetterComboParent = "l"
        newColorMap2273.ipaParent = "oʊl"
        newColorMap2273.color = "darkGrey"
        
        newLetterCombo675.colorMapList.append(objectsIn: [newColorMap2273])
        newIPALetter64.letterCombos.append(objectsIn: [newLetterCombo675])
        
        // =========================================
        // MARK: - "ʊl"
        // =========================================
        let newIPALetter67 = IPALetter()
        newIPALetter67.ipaLetter = "ʊl"
        
        //===================================
        let newLetterCombo677 = LetterCombo()
        newLetterCombo677.letterCombo = "ou'll"
        newLetterCombo677.ipaParent = "ʊl"
        
        let newColorMap2279 = ColorMap()
        newColorMap2279.LetterComboParent = "ou'll"
        newColorMap2279.ipaParent = "ʊl"
        newColorMap2279.color = "lightGrey"
        
        let newColorMap2280 = ColorMap()
        newColorMap2280.LetterComboParent = "ou'll"
        newColorMap2280.ipaParent = "ʊl"
        newColorMap2280.color = "lightGrey"
        
        let newColorMap2281 = ColorMap()
        newColorMap2281.LetterComboParent = "ou'll"
        newColorMap2281.ipaParent = "ʊl"
        newColorMap2281.color = "lightGrey"
        
        let newColorMap2282 = ColorMap()
        newColorMap2282.LetterComboParent = "ou'll"
        newColorMap2282.ipaParent = "ʊl"
        newColorMap2282.color = "darkGrey"
        
        let newColorMap2283 = ColorMap()
        newColorMap2283.LetterComboParent = "ou'll"
        newColorMap2283.ipaParent = "ʊl"
        newColorMap2283.color = "darkGrey"
        
        newLetterCombo677.colorMapList.append(objectsIn: [newColorMap2279,newColorMap2280,newColorMap2281,newColorMap2282,newColorMap2283])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo677])
        //===================================
        let newLetterCombo678 = LetterCombo()
        newLetterCombo678.letterCombo = "ile"
        newLetterCombo678.ipaParent = "ʊl"
        
        let newColorMap2284 = ColorMap()
        newColorMap2284.LetterComboParent = "ile"
        newColorMap2284.ipaParent = "ʊl"
        newColorMap2284.color = "lightGrey"
        
        let newColorMap2285 = ColorMap()
        newColorMap2285.LetterComboParent = "ile"
        newColorMap2285.ipaParent = "ʊl"
        newColorMap2285.color = "darkGrey"
        
        let newColorMap2286 = ColorMap()
        newColorMap2286.LetterComboParent = "ile"
        newColorMap2286.ipaParent = "ʊl"
        newColorMap2286.color = "lightGrey"
        
        newLetterCombo678.colorMapList.append(objectsIn: [newColorMap2284,newColorMap2285,newColorMap2286])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo678])
        //===================================
        let newLetterCombo679 = LetterCombo()
        newLetterCombo679.letterCombo = "ull"
        newLetterCombo679.ipaParent = "ʊl"
        
        let newColorMap2287 = ColorMap()
        newColorMap2287.LetterComboParent = "ull"
        newColorMap2287.ipaParent = "ʊl"
        newColorMap2287.color = "lightGrey"
        
        let newColorMap2288 = ColorMap()
        newColorMap2288.LetterComboParent = "ull"
        newColorMap2288.ipaParent = "ʊl"
        newColorMap2288.color = "darkGrey"
        
        let newColorMap2289 = ColorMap()
        newColorMap2289.LetterComboParent = "ull"
        newColorMap2289.ipaParent = "ʊl"
        newColorMap2289.color = "darkGrey"
        
        newLetterCombo679.colorMapList.append(objectsIn: [newColorMap2287,newColorMap2288,newColorMap2289])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo679])
        //===================================
        let newLetterCombo680 = LetterCombo()
        newLetterCombo680.letterCombo = "all"
        newLetterCombo680.ipaParent = "ʊl"
        
        let newColorMap2290 = ColorMap()
        newColorMap2290.LetterComboParent = "all"
        newColorMap2290.ipaParent = "ʊl"
        newColorMap2290.color = "lightGrey"
        
        let newColorMap2291 = ColorMap()
        newColorMap2291.LetterComboParent = "all"
        newColorMap2291.ipaParent = "ʊl"
        newColorMap2291.color = "darkGrey"
        
        let newColorMap2292 = ColorMap()
        newColorMap2292.LetterComboParent = "all"
        newColorMap2292.ipaParent = "ʊl"
        newColorMap2292.color = "darkGrey"
        
        newLetterCombo680.colorMapList.append(objectsIn: [newColorMap2290,newColorMap2291,newColorMap2292])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo680])
        //===================================
        let newLetterCombo681 = LetterCombo()
        newLetterCombo681.letterCombo = "ule"
        newLetterCombo681.ipaParent = "ʊl"
        
        let newColorMap2293 = ColorMap()
        newColorMap2293.LetterComboParent = "ule"
        newColorMap2293.ipaParent = "ʊl"
        newColorMap2293.color = "lightGrey"
        
        let newColorMap2294 = ColorMap()
        newColorMap2294.LetterComboParent = "ule"
        newColorMap2294.ipaParent = "ʊl"
        newColorMap2294.color = "darkGrey"
        
        let newColorMap2295 = ColorMap()
        newColorMap2295.LetterComboParent = "ule"
        newColorMap2295.ipaParent = "ʊl"
        newColorMap2295.color = "lightGrey"
        
        newLetterCombo681.colorMapList.append(objectsIn: [newColorMap2293,newColorMap2294,newColorMap2295])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo681])
        //===================================
        let newLetterCombo682 = LetterCombo()
        newLetterCombo682.letterCombo = "ial"
        newLetterCombo682.ipaParent = "ʊl"
        
        let newColorMap2296 = ColorMap()
        newColorMap2296.LetterComboParent = "ial"
        newColorMap2296.ipaParent = "ʊl"
        newColorMap2296.color = "lightGrey"
        
        let newColorMap2297 = ColorMap()
        newColorMap2297.LetterComboParent = "ial"
        newColorMap2297.ipaParent = "ʊl"
        newColorMap2297.color = "lightGrey"
        
        let newColorMap2298 = ColorMap()
        newColorMap2298.LetterComboParent = "ial"
        newColorMap2298.ipaParent = "ʊl"
        newColorMap2298.color = "darkGrey"
        
        newLetterCombo682.colorMapList.append(objectsIn: [newColorMap2296,newColorMap2297,newColorMap2298])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo682])
        //===================================
        let newLetterCombo683 = LetterCombo()
        newLetterCombo683.letterCombo = "ual"
        newLetterCombo683.ipaParent = "ʊl"
        
        let newColorMap2299 = ColorMap()
        newColorMap2299.LetterComboParent = "ual"
        newColorMap2299.ipaParent = "ʊl"
        newColorMap2299.color = "lightGrey"
        
        let newColorMap2300 = ColorMap()
        newColorMap2300.LetterComboParent = "ual"
        newColorMap2300.ipaParent = "ʊl"
        newColorMap2300.color = "lightGrey"
        
        let newColorMap2301 = ColorMap()
        newColorMap2301.LetterComboParent = "ual"
        newColorMap2301.ipaParent = "ʊl"
        newColorMap2301.color = "darkGrey"
        
        newLetterCombo683.colorMapList.append(objectsIn: [newColorMap2299,newColorMap2300,newColorMap2301])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo683])
        //===================================
        let newLetterCombo684 = LetterCombo()
        newLetterCombo684.letterCombo = "ole"
        newLetterCombo684.ipaParent = "ʊl"
        
        let newColorMap2302 = ColorMap()
        newColorMap2302.LetterComboParent = "ole"
        newColorMap2302.ipaParent = "ʊl"
        newColorMap2302.color = "lightGrey"
        
        let newColorMap2303 = ColorMap()
        newColorMap2303.LetterComboParent = "ole"
        newColorMap2303.ipaParent = "ʊl"
        newColorMap2303.color = "darkGrey"
        
        let newColorMap2304 = ColorMap()
        newColorMap2304.LetterComboParent = "ole"
        newColorMap2304.ipaParent = "ʊl"
        newColorMap2304.color = "lightGrey"
        
        newLetterCombo684.colorMapList.append(objectsIn: [newColorMap2302,newColorMap2303,newColorMap2304])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo684])
        //===================================
        let newLetterCombo685 = LetterCombo()
        newLetterCombo685.letterCombo = "oal"
        newLetterCombo685.ipaParent = "ʊl"
        
        let newColorMap2305 = ColorMap()
        newColorMap2305.LetterComboParent = "oal"
        newColorMap2305.ipaParent = "ʊl"
        newColorMap2305.color = "lightGrey"
        
        let newColorMap2306 = ColorMap()
        newColorMap2306.LetterComboParent = "oal"
        newColorMap2306.ipaParent = "ʊl"
        newColorMap2306.color = "lightGrey"
        
        let newColorMap2307 = ColorMap()
        newColorMap2307.LetterComboParent = "oal"
        newColorMap2307.ipaParent = "ʊl"
        newColorMap2307.color = "darkGrey"
        
        newLetterCombo685.colorMapList.append(objectsIn: [newColorMap2305,newColorMap2306,newColorMap2307])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo685])
        //===================================
        let newLetterCombo686 = LetterCombo()
        newLetterCombo686.letterCombo = "oul"
        newLetterCombo686.ipaParent = "ʊl"
        
        let newColorMap2308 = ColorMap()
        newColorMap2308.LetterComboParent = "oul"
        newColorMap2308.ipaParent = "ʊl"
        newColorMap2308.color = "lightGrey"
        
        let newColorMap2309 = ColorMap()
        newColorMap2309.LetterComboParent = "oul"
        newColorMap2309.ipaParent = "ʊl"
        newColorMap2309.color = "lightGrey"
        
        let newColorMap2310 = ColorMap()
        newColorMap2310.LetterComboParent = "oul"
        newColorMap2310.ipaParent = "ʊl"
        newColorMap2310.color = "darkGrey"
        
        newLetterCombo686.colorMapList.append(objectsIn: [newColorMap2308,newColorMap2309,newColorMap2310])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo686])
        //===================================
        let newLetterCombo687 = LetterCombo()
        newLetterCombo687.letterCombo = "oll"
        newLetterCombo687.ipaParent = "ʊl"
        
        let newColorMap2311 = ColorMap()
        newColorMap2311.LetterComboParent = "oll"
        newColorMap2311.ipaParent = "ʊl"
        newColorMap2311.color = "lightGrey"
        
        let newColorMap2312 = ColorMap()
        newColorMap2312.LetterComboParent = "oll"
        newColorMap2312.ipaParent = "ʊl"
        newColorMap2312.color = "darkGrey"
        
        let newColorMap2313 = ColorMap()
        newColorMap2313.LetterComboParent = "oll"
        newColorMap2313.ipaParent = "ʊl"
        newColorMap2313.color = "darkGrey"
        
        newLetterCombo687.colorMapList.append(objectsIn: [newColorMap2311,newColorMap2312,newColorMap2313])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo687])
        //===================================
        let newLetterCombo688 = LetterCombo()
        newLetterCombo688.letterCombo = "owl"
        newLetterCombo688.ipaParent = "ʊl"
        
        let newColorMap2314 = ColorMap()
        newColorMap2314.LetterComboParent = "owl"
        newColorMap2314.ipaParent = "ʊl"
        newColorMap2314.color = "lightGrey"
        
        let newColorMap2315 = ColorMap()
        newColorMap2315.LetterComboParent = "owl"
        newColorMap2315.ipaParent = "ʊl"
        newColorMap2315.color = "lightGrey"
        
        let newColorMap2316 = ColorMap()
        newColorMap2316.LetterComboParent = "owl"
        newColorMap2316.ipaParent = "ʊl"
        newColorMap2316.color = "darkGrey"
        
        newLetterCombo688.colorMapList.append(objectsIn: [newColorMap2314,newColorMap2315,newColorMap2316])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo688])
        //===================================
        let newLetterCombo689 = LetterCombo()
        newLetterCombo689.letterCombo = "'ll"
        newLetterCombo689.ipaParent = "ʊl"
        
        let newColorMap2317 = ColorMap()
        newColorMap2317.LetterComboParent = "'ll"
        newColorMap2317.ipaParent = "ʊl"
        newColorMap2317.color = "lightGrey"
        
        let newColorMap2318 = ColorMap()
        newColorMap2318.LetterComboParent = "'ll"
        newColorMap2318.ipaParent = "ʊl"
        newColorMap2318.color = "darkGrey"
        
        let newColorMap2319 = ColorMap()
        newColorMap2319.LetterComboParent = "'ll"
        newColorMap2319.ipaParent = "ʊl"
        newColorMap2319.color = "darkGrey"
        
        newLetterCombo689.colorMapList.append(objectsIn: [newColorMap2317,newColorMap2318,newColorMap2319])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo689])
        //===================================
        let newLetterCombo690 = LetterCombo()
        newLetterCombo690.letterCombo = "le"
        newLetterCombo690.ipaParent = "ʊl"
        
        let newColorMap2320 = ColorMap()
        newColorMap2320.LetterComboParent = "le"
        newColorMap2320.ipaParent = "ʊl"
        newColorMap2320.color = "darkGrey"
        
        let newColorMap2321 = ColorMap()
        newColorMap2321.LetterComboParent = "le"
        newColorMap2321.ipaParent = "ʊl"
        newColorMap2321.color = "lightGrey"
        
        newLetterCombo690.colorMapList.append(objectsIn: [newColorMap2320,newColorMap2321])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo690])
        //===================================
        let newLetterCombo691 = LetterCombo()
        newLetterCombo691.letterCombo = "al"
        newLetterCombo691.ipaParent = "ʊl"
        
        let newColorMap2322 = ColorMap()
        newColorMap2322.LetterComboParent = "al"
        newColorMap2322.ipaParent = "ʊl"
        newColorMap2322.color = "lightGrey"
        
        let newColorMap2323 = ColorMap()
        newColorMap2323.LetterComboParent = "al"
        newColorMap2323.ipaParent = "ʊl"
        newColorMap2323.color = "darkGrey"
        
        newLetterCombo691.colorMapList.append(objectsIn: [newColorMap2322,newColorMap2323])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo691])
        //===================================
        let newLetterCombo692 = LetterCombo()
        newLetterCombo692.letterCombo = "el"
        newLetterCombo692.ipaParent = "ʊl"
        
        let newColorMap2324 = ColorMap()
        newColorMap2324.LetterComboParent = "el"
        newColorMap2324.ipaParent = "ʊl"
        newColorMap2324.color = "lightGrey"
        
        let newColorMap2325 = ColorMap()
        newColorMap2325.LetterComboParent = "el"
        newColorMap2325.ipaParent = "ʊl"
        newColorMap2325.color = "darkGrey"
        
        newLetterCombo692.colorMapList.append(objectsIn: [newColorMap2324,newColorMap2325])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo692])
        //===================================
        let newLetterCombo693 = LetterCombo()
        newLetterCombo693.letterCombo = "il"
        newLetterCombo693.ipaParent = "ʊl"
        
        let newColorMap2326 = ColorMap()
        newColorMap2326.LetterComboParent = "il"
        newColorMap2326.ipaParent = "ʊl"
        newColorMap2326.color = "lightGrey"
        
        let newColorMap2327 = ColorMap()
        newColorMap2327.LetterComboParent = "il"
        newColorMap2327.ipaParent = "ʊl"
        newColorMap2327.color = "darkGrey"
        
        newLetterCombo693.colorMapList.append(objectsIn: [newColorMap2326,newColorMap2327])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo693])
        //===================================
        let newLetterCombo694 = LetterCombo()
        newLetterCombo694.letterCombo = "ul"
        newLetterCombo694.ipaParent = "ʊl"
        
        let newColorMap2328 = ColorMap()
        newColorMap2328.LetterComboParent = "ul"
        newColorMap2328.ipaParent = "ʊl"
        newColorMap2328.color = "lightGrey"
        
        let newColorMap2329 = ColorMap()
        newColorMap2329.LetterComboParent = "ul"
        newColorMap2329.ipaParent = "ʊl"
        newColorMap2329.color = "darkGrey"
        
        newLetterCombo694.colorMapList.append(objectsIn: [newColorMap2328,newColorMap2329])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo694])
        //===================================
        let newLetterCombo695 = LetterCombo()
        newLetterCombo695.letterCombo = "ol"
        newLetterCombo695.ipaParent = "ʊl"
        
        let newColorMap2330 = ColorMap()
        newColorMap2330.LetterComboParent = "ol"
        newColorMap2330.ipaParent = "ʊl"
        newColorMap2330.color = "lightGrey"
        
        let newColorMap2331 = ColorMap()
        newColorMap2331.LetterComboParent = "ol"
        newColorMap2331.ipaParent = "ʊl"
        newColorMap2331.color = "darkGrey"
        
        newLetterCombo695.colorMapList.append(objectsIn: [newColorMap2330,newColorMap2331])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo695])
        //===================================
        let newLetterCombo696 = LetterCombo()
        newLetterCombo696.letterCombo = "yl"
        newLetterCombo696.ipaParent = "ʊl"
        
        let newColorMap2332 = ColorMap()
        newColorMap2332.LetterComboParent = "yl"
        newColorMap2332.ipaParent = "ʊl"
        newColorMap2332.color = "lightGrey"
        
        let newColorMap2333 = ColorMap()
        newColorMap2333.LetterComboParent = "yl"
        newColorMap2333.ipaParent = "ʊl"
        newColorMap2333.color = "darkGrey"
        
        newLetterCombo696.colorMapList.append(objectsIn: [newColorMap2332,newColorMap2333])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo696])
        //===================================
        let newLetterCombo697 = LetterCombo()
        newLetterCombo697.letterCombo = "ll"
        newLetterCombo697.ipaParent = "ʊl"
        
        let newColorMap2334 = ColorMap()
        newColorMap2334.LetterComboParent = "ll"
        newColorMap2334.ipaParent = "ʊl"
        newColorMap2334.color = "darkGrey"
        
        let newColorMap2335 = ColorMap()
        newColorMap2335.LetterComboParent = "ll"
        newColorMap2335.ipaParent = "ʊl"
        newColorMap2335.color = "darkGrey"
        
        newLetterCombo697.colorMapList.append(objectsIn: [newColorMap2334,newColorMap2335])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo697])
        //===================================
        let newLetterCombo698 = LetterCombo()
        newLetterCombo698.letterCombo = "l"
        newLetterCombo698.ipaParent = "ʊl"
        
        let newColorMap2336 = ColorMap()
        newColorMap2336.LetterComboParent = "l"
        newColorMap2336.ipaParent = "ʊl"
        newColorMap2336.color = "darkGrey"
        
        newLetterCombo698.colorMapList.append(objectsIn: [newColorMap2336])
        newIPALetter67.letterCombos.append(objectsIn: [newLetterCombo698])
        
        // =========================================
        // MARK: - "ʔ"
        // =========================================
        let newIPALetter68 = IPALetter()
        newIPALetter68.ipaLetter = "ʔ"
        
        //===================================
        let newLetterCombo540 = LetterCombo()
        newLetterCombo540.letterCombo = "tte"
        newLetterCombo540.ipaParent = "ʔ"
        
        let newColorMap1175 = ColorMap()
        newColorMap1175.LetterComboParent = "tte"
        newColorMap1175.ipaParent = "ʔ"
        newColorMap1175.color = "maroon"
        
        let newColorMap1176 = ColorMap()
        newColorMap1176.LetterComboParent = "tte"
        newColorMap1176.ipaParent = "ʔ"
        newColorMap1176.color = "maroon"
        
        let newColorMap1177 = ColorMap()
        newColorMap1177.LetterComboParent = "tte"
        newColorMap1177.ipaParent = "ʔ"
        newColorMap1177.color = "maroon"
        
        newLetterCombo540.colorMapList.append(objectsIn: [newColorMap1175,newColorMap1176,newColorMap1177])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo540])
        //===================================
        let newLetterCombo541 = LetterCombo()
        newLetterCombo541.letterCombo = "cht"
        newLetterCombo541.ipaParent = "ʔ"
        
        let newColorMap1178 = ColorMap()
        newColorMap1178.LetterComboParent = "cht"
        newColorMap1178.ipaParent = "ʔ"
        newColorMap1178.color = "maroon"
        
        let newColorMap1179 = ColorMap()
        newColorMap1179.LetterComboParent = "cht"
        newColorMap1179.ipaParent = "ʔ"
        newColorMap1179.color = "maroon"
        
        let newColorMap1180 = ColorMap()
        newColorMap1180.LetterComboParent = "cht"
        newColorMap1180.ipaParent = "ʔ"
        newColorMap1180.color = "maroon"
        
        newLetterCombo541.colorMapList.append(objectsIn: [newColorMap1178,newColorMap1179,newColorMap1180])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo541])
        //===================================
        let newLetterCombo551 = LetterCombo()
        newLetterCombo551.letterCombo = "que"
        newLetterCombo551.ipaParent = "ʔ"
        
        let newColorMap1196 = ColorMap()
        newColorMap1196.LetterComboParent = "que"
        newColorMap1196.ipaParent = "ʔ"
        newColorMap1196.color = "maroon"
        
        let newColorMap1197 = ColorMap()
        newColorMap1197.LetterComboParent = "que"
        newColorMap1197.ipaParent = "ʔ"
        newColorMap1197.color = "maroon"
        
        let newColorMap1198 = ColorMap()
        newColorMap1198.LetterComboParent = "que"
        newColorMap1198.ipaParent = "ʔ"
        newColorMap1198.color = "maroon"
        
        newLetterCombo551.colorMapList.append(objectsIn: [newColorMap1196,newColorMap1197,newColorMap1198])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo551])
        //===================================
        let newLetterCombo552 = LetterCombo()
        newLetterCombo552.letterCombo = "cch"
        newLetterCombo552.ipaParent = "ʔ"
        
        let newColorMap1199 = ColorMap()
        newColorMap1199.LetterComboParent = "cch"
        newColorMap1199.ipaParent = "ʔ"
        newColorMap1199.color = "maroon"
        
        let newColorMap2000 = ColorMap()
        newColorMap2000.LetterComboParent = "cch"
        newColorMap2000.ipaParent = "ʔ"
        newColorMap2000.color = "maroon"
        
        let newColorMap2001 = ColorMap()
        newColorMap2001.LetterComboParent = "cch"
        newColorMap2001.ipaParent = "ʔ"
        newColorMap2001.color = "maroon"
        
        newLetterCombo552.colorMapList.append(objectsIn: [newColorMap1199,newColorMap2000,newColorMap2001])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo552])
        //===================================
        let newLetterCombo542 = LetterCombo()
        newLetterCombo542.letterCombo = "tt"
        newLetterCombo542.ipaParent = "ʔ"
        
        let newColorMap1181 = ColorMap()
        newColorMap1181.LetterComboParent = "tt"
        newColorMap1181.ipaParent = "ʔ"
        newColorMap1181.color = "maroon"
        
        let newColorMap1182 = ColorMap()
        newColorMap1182.LetterComboParent = "tt"
        newColorMap1182.ipaParent = "ʔ"
        newColorMap1182.color = "maroon"
        
        newLetterCombo542.colorMapList.append(objectsIn: [newColorMap1181,newColorMap1182])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo542])
        //===================================
        let newLetterCombo543 = LetterCombo()
        newLetterCombo543.letterCombo = "bt"
        newLetterCombo543.ipaParent = "ʔ"
        
        let newColorMap1183 = ColorMap()
        newColorMap1183.LetterComboParent = "bt"
        newColorMap1183.ipaParent = "ʔ"
        newColorMap1183.color = "maroon"
        
        let newColorMap1184 = ColorMap()
        newColorMap1184.LetterComboParent = "bt"
        newColorMap1184.ipaParent = "ʔ"
        newColorMap1184.color = "maroon"
        
        newLetterCombo543.colorMapList.append(objectsIn: [newColorMap1183,newColorMap1184])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo543])
        //===================================
        let newLetterCombo544 = LetterCombo()
        newLetterCombo544.letterCombo = "ed"
        newLetterCombo544.ipaParent = "ʔ"
        
        let newColorMap1185 = ColorMap()
        newColorMap1185.LetterComboParent = "ed"
        newColorMap1185.ipaParent = "ʔ"
        newColorMap1185.color = "maroon"
        
        let newColorMap1186 = ColorMap()
        newColorMap1186.LetterComboParent = "ed"
        newColorMap1186.ipaParent = "ʔ"
        newColorMap1186.color = "maroon"
        
        newLetterCombo544.colorMapList.append(objectsIn: [newColorMap1185,newColorMap1186])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo544])
        //===================================
        let newLetterCombo545 = LetterCombo()
        newLetterCombo545.letterCombo = "te"
        newLetterCombo545.ipaParent = "ʔ"
        
        let newColorMap1187 = ColorMap()
        newColorMap1187.LetterComboParent = "te"
        newColorMap1187.ipaParent = "ʔ"
        newColorMap1187.color = "maroon"
        
        let newColorMap1188 = ColorMap()
        newColorMap1188.LetterComboParent = "te"
        newColorMap1188.ipaParent = "ʔ"
        newColorMap1188.color = "maroon"
        
        newLetterCombo545.colorMapList.append(objectsIn: [newColorMap1187,newColorMap1188])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo545])
        //===================================
        let newLetterCombo546 = LetterCombo()
        newLetterCombo546.letterCombo = "pt"
        newLetterCombo546.ipaParent = "ʔ"
        
        let newColorMap1189 = ColorMap()
        newColorMap1189.LetterComboParent = "pt"
        newColorMap1189.ipaParent = "ʔ"
        newColorMap1189.color = "maroon"
        
        let newColorMap1190 = ColorMap()
        newColorMap1190.LetterComboParent = "pt"
        newColorMap1190.ipaParent = "ʔ"
        newColorMap1190.color = "maroon"
        
        newLetterCombo546.colorMapList.append(objectsIn: [newColorMap1189,newColorMap1190])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo546])
        //===================================
        let newLetterCombo547 = LetterCombo()
        newLetterCombo547.letterCombo = "th"
        newLetterCombo547.ipaParent = "ʔ"
        
        let newColorMap1191 = ColorMap()
        newColorMap1191.LetterComboParent = "th"
        newColorMap1191.ipaParent = "ʔ"
        newColorMap1191.color = "maroon"
        
        let newColorMap1192 = ColorMap()
        newColorMap1192.LetterComboParent = "th"
        newColorMap1192.ipaParent = "ʔ"
        newColorMap1192.color = "maroon"
        
        newLetterCombo547.colorMapList.append(objectsIn: [newColorMap1191,newColorMap1192])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo547])
        //===================================
        let newLetterCombo699 = LetterCombo()
        newLetterCombo699.letterCombo = "ct"
        newLetterCombo699.ipaParent = "ʔ"
        
        let newColorMap2337 = ColorMap()
        newColorMap2337.LetterComboParent = "ct"
        newColorMap2337.ipaParent = "ʔ"
        newColorMap2337.color = "maroon"
        
        let newColorMap2338 = ColorMap()
        newColorMap2338.LetterComboParent = "ct"
        newColorMap2338.ipaParent = "ʔ"
        newColorMap2338.color = "maroon"
        
        newLetterCombo699.colorMapList.append(objectsIn: [newColorMap2337,newColorMap2338])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo699])
        //===================================
        let newLetterCombo700 = LetterCombo()
        newLetterCombo700.letterCombo = "'t"
        newLetterCombo700.ipaParent = "ʔ"
        
        let newColorMap2339 = ColorMap()
        newColorMap2339.LetterComboParent = "'t"
        newColorMap2339.ipaParent = "ʔ"
        newColorMap2339.color = "lightGrey"
        
        let newColorMap2340 = ColorMap()
        newColorMap2340.LetterComboParent = "'t"
        newColorMap2340.ipaParent = "ʔ"
        newColorMap2340.color = "maroon"
        
        newLetterCombo700.colorMapList.append(objectsIn: [newColorMap2339,newColorMap2340])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo700])
        //===================================
        let newLetterCombo553 = LetterCombo()
        newLetterCombo553.letterCombo = "ke"
        newLetterCombo553.ipaParent = "ʔ"
        
        let newColorMap2002 = ColorMap()
        newColorMap2002.LetterComboParent = "ke"
        newColorMap2002.ipaParent = "ʔ"
        newColorMap2002.color = "maroon"
        
        let newColorMap2003 = ColorMap()
        newColorMap2003.LetterComboParent = "ke"
        newColorMap2003.ipaParent = "ʔ"
        newColorMap2003.color = "maroon"
        
        newLetterCombo553.colorMapList.append(objectsIn: [newColorMap2002,newColorMap2003])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo553])
        //===================================
        let newLetterCombo554 = LetterCombo()
        newLetterCombo554.letterCombo = "ck"
        newLetterCombo554.ipaParent = "ʔ"
        
        let newColorMap2004 = ColorMap()
        newColorMap2004.LetterComboParent = "ck"
        newColorMap2004.ipaParent = "ʔ"
        newColorMap2004.color = "maroon"
        
        let newColorMap2005 = ColorMap()
        newColorMap2005.LetterComboParent = "ck"
        newColorMap2005.ipaParent = "ʔ"
        newColorMap2005.color = "maroon"
        
        newLetterCombo554.colorMapList.append(objectsIn: [newColorMap2004,newColorMap2005])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo554])
        //===================================
        let newLetterCombo555 = LetterCombo()
        newLetterCombo555.letterCombo = "cc"
        newLetterCombo555.ipaParent = "ʔ"
        
        let newColorMap2006 = ColorMap()
        newColorMap2006.LetterComboParent = "cc"
        newColorMap2006.ipaParent = "ʔ"
        newColorMap2006.color = "maroon"
        
        let newColorMap2007 = ColorMap()
        newColorMap2007.LetterComboParent = "cc"
        newColorMap2007.ipaParent = "ʔ"
        newColorMap2007.color = "maroon"
        
        newLetterCombo555.colorMapList.append(objectsIn: [newColorMap2006,newColorMap2007])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo555])
        //===================================
        let newLetterCombo556 = LetterCombo()
        newLetterCombo556.letterCombo = "ch"
        newLetterCombo556.ipaParent = "ʔ"
        
        let newColorMap2008 = ColorMap()
        newColorMap2008.LetterComboParent = "ch"
        newColorMap2008.ipaParent = "ʔ"
        newColorMap2008.color = "maroon"
        
        let newColorMap2009 = ColorMap()
        newColorMap2009.LetterComboParent = "ch"
        newColorMap2009.ipaParent = "ʔ"
        newColorMap2009.color = "maroon"
        
        newLetterCombo556.colorMapList.append(objectsIn: [newColorMap2008,newColorMap2009])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo556])
        //===================================
        let newLetterCombo557 = LetterCombo()
        newLetterCombo557.letterCombo = "kh"
        newLetterCombo557.ipaParent = "ʔ"
        
        let newColorMap2010 = ColorMap()
        newColorMap2010.LetterComboParent = "kh"
        newColorMap2010.ipaParent = "ʔ"
        newColorMap2010.color = "maroon"
        
        let newColorMap2011 = ColorMap()
        newColorMap2011.LetterComboParent = "kh"
        newColorMap2011.ipaParent = "ʔ"
        newColorMap2011.color = "maroon"
        
        newLetterCombo557.colorMapList.append(objectsIn: [newColorMap2010,newColorMap2011])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo557])
        //===================================
        let newLetterCombo558 = LetterCombo()
        newLetterCombo558.letterCombo = "lk"
        newLetterCombo558.ipaParent = "ʔ"
        
        let newColorMap2012 = ColorMap()
        newColorMap2012.LetterComboParent = "lk"
        newColorMap2012.ipaParent = "ʔ"
        newColorMap2012.color = "maroon"
        
        let newColorMap2013 = ColorMap()
        newColorMap2013.LetterComboParent = "lk"
        newColorMap2013.ipaParent = "ʔ"
        newColorMap2013.color = "maroon"
        
        newLetterCombo558.colorMapList.append(objectsIn: [newColorMap2012,newColorMap2013])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo558])
        //===================================
        let newLetterCombo701 = LetterCombo()
        newLetterCombo701.letterCombo = "ct"
        newLetterCombo701.ipaParent = "ʔ"
        
        let newColorMap2341 = ColorMap()
        newColorMap2341.LetterComboParent = "ct"
        newColorMap2341.ipaParent = "ʔ"
        newColorMap2341.color = "maroon"
        
        let newColorMap2342 = ColorMap()
        newColorMap2342.LetterComboParent = "ct"
        newColorMap2342.ipaParent = "ʔ"
        newColorMap2342.color = "maroon"
        
        newLetterCombo701.colorMapList.append(objectsIn: [newColorMap2341,newColorMap2342])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo701])
        //===================================
        let newLetterCombo562 = LetterCombo()
        newLetterCombo562.letterCombo = "pp"
        newLetterCombo562.ipaParent = "ʔ"
        
        let newColorMap2017 = ColorMap()
        newColorMap2017.LetterComboParent = "pp"
        newColorMap2017.ipaParent = "ʔ"
        newColorMap2017.color = "maroon"
        
        let newColorMap2018 = ColorMap()
        newColorMap2018.LetterComboParent = "pp"
        newColorMap2018.ipaParent = "ʔ"
        newColorMap2018.color = "maroon"
        
        newLetterCombo562.colorMapList.append(objectsIn: [newColorMap2017,newColorMap2018])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo562])
        //===================================
        let newLetterCombo563 = LetterCombo()
        newLetterCombo563.letterCombo = "pe"
        newLetterCombo563.ipaParent = "ʔ"
        
        let newColorMap2019 = ColorMap()
        newColorMap2019.LetterComboParent = "pe"
        newColorMap2019.ipaParent = "ʔ"
        newColorMap2019.color = "maroon"
        
        let newColorMap2020 = ColorMap()
        newColorMap2020.LetterComboParent = "pe"
        newColorMap2020.ipaParent = "ʔ"
        newColorMap2020.color = "maroon"
        
        newLetterCombo563.colorMapList.append(objectsIn: [newColorMap2019,newColorMap2020])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo563])
        //===================================
        let newLetterCombo564 = LetterCombo()
        newLetterCombo564.letterCombo = "ph"
        newLetterCombo564.ipaParent = "ʔ"
        
        let newColorMap2021 = ColorMap()
        newColorMap2021.LetterComboParent = "ph"
        newColorMap2021.ipaParent = "ʔ"
        newColorMap2021.color = "maroon"
        
        let newColorMap2022 = ColorMap()
        newColorMap2022.LetterComboParent = "ph"
        newColorMap2022.ipaParent = "ʔ"
        newColorMap2022.color = "maroon"
        
        newLetterCombo564.colorMapList.append(objectsIn: [newColorMap2021,newColorMap2022])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo564])
        //===================================
        let newLetterCombo702 = LetterCombo()
        newLetterCombo702.letterCombo = "pt"
        newLetterCombo702.ipaParent = "ʔ"
        
        let newColorMap2343 = ColorMap()
        newColorMap2343.LetterComboParent = "pt"
        newColorMap2343.ipaParent = "ʔ"
        newColorMap2343.color = "maroon"
        
        let newColorMap2344 = ColorMap()
        newColorMap2344.LetterComboParent = "pt"
        newColorMap2344.ipaParent = "ʔ"
        newColorMap2344.color = "maroon"
        
        newLetterCombo702.colorMapList.append(objectsIn: [newColorMap2343,newColorMap2344])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo702])
        //===================================
        let newLetterCombo548 = LetterCombo()
        newLetterCombo548.letterCombo = "t"
        newLetterCombo548.ipaParent = "ʔ"
        
        let newColorMap1193 = ColorMap()
        newColorMap1193.LetterComboParent = "t"
        newColorMap1193.ipaParent = "ʔ"
        newColorMap1193.color = "maroon"
        
        newLetterCombo548.colorMapList.append(objectsIn: [newColorMap1193])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo548])
        //===================================
        let newLetterCombo549 = LetterCombo()
        newLetterCombo549.letterCombo = "d"
        newLetterCombo549.ipaParent = "ʔ"
        
        let newColorMap1194 = ColorMap()
        newColorMap1194.LetterComboParent = "d"
        newColorMap1194.ipaParent = "ʔ"
        newColorMap1194.color = "maroon"
        
        newLetterCombo549.colorMapList.append(objectsIn: [newColorMap1194])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo549])
        //===================================
        let newLetterCombo550 = LetterCombo()
        newLetterCombo550.letterCombo = "z"
        newLetterCombo550.ipaParent = "ʔ"
        
        let newColorMap1195 = ColorMap()
        newColorMap1195.LetterComboParent = "z"
        newColorMap1195.ipaParent = "ʔ"
        newColorMap1195.color = "maroon"
        
        newLetterCombo550.colorMapList.append(objectsIn: [newColorMap1195])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo550])
        //===================================
        let newLetterCombo559 = LetterCombo()
        newLetterCombo559.letterCombo = "c"
        newLetterCombo559.ipaParent = "ʔ"
        
        let newColorMap2014 = ColorMap()
        newColorMap2014.LetterComboParent = "c"
        newColorMap2014.ipaParent = "ʔ"
        newColorMap2014.color = "maroon"
        
        newLetterCombo559.colorMapList.append(objectsIn: [newColorMap2014])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo559])
        //===================================
        let newLetterCombo560 = LetterCombo()
        newLetterCombo560.letterCombo = "q"
        newLetterCombo560.ipaParent = "ʔ"
        
        let newColorMap2015 = ColorMap()
        newColorMap2015.LetterComboParent = "q"
        newColorMap2015.ipaParent = "ʔ"
        newColorMap2015.color = "maroon"
        
        newLetterCombo560.colorMapList.append(objectsIn: [newColorMap2015])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo560])
        //===================================
        let newLetterCombo561 = LetterCombo()
        newLetterCombo561.letterCombo = "k"
        newLetterCombo561.ipaParent = "ʔ"
        
        let newColorMap2016 = ColorMap()
        newColorMap2016.LetterComboParent = "k"
        newColorMap2016.ipaParent = "ʔ"
        newColorMap2016.color = "maroon"
        
        newLetterCombo561.colorMapList.append(objectsIn: [newColorMap2016])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo561])
        //===================================
        let newLetterCombo565 = LetterCombo()
        newLetterCombo565.letterCombo = "p"
        newLetterCombo565.ipaParent = "ʔ"
        
        let newColorMap2023 = ColorMap()
        newColorMap2023.LetterComboParent = "p"
        newColorMap2023.ipaParent = "ʔ"
        newColorMap2023.color = "maroon"
        
        newLetterCombo565.colorMapList.append(objectsIn: [newColorMap2023])
        newIPALetter68.letterCombos.append(objectsIn: [newLetterCombo565])
        //===================================
        
        let IPALetterList = [
            newIPALetter0, newIPALetter1, newIPALetter2, newIPALetter3, newIPALetter4, newIPALetter5, newIPALetter6, newIPALetter7, newIPALetter8,
            newIPALetter9, newIPALetter10, newIPALetter11, newIPALetter12, newIPALetter13, newIPALetter14, newIPALetter15, newIPALetter16, newIPALetter17,
            newIPALetter18, newIPALetter19, newIPALetter20, newIPALetter21,  newIPALetter22, newIPALetter23, newIPALetter24, newIPALetter25, newIPALetter26, newIPALetter27,
            newIPALetter28, newIPALetter30, newIPALetter32, newIPALetter33, newIPALetter34, newIPALetter35, newIPALetter36, newIPALetter38, newIPALetter39,
            newIPALetter41, newIPALetter42, newIPALetter43, newIPALetter44, newIPALetter45, newIPALetter46, newIPALetter47, newIPALetter48, newIPALetter49,
            newIPALetter50, newIPALetter51, newIPALetter52, newIPALetter53, newIPALetter54, newIPALetter56, newIPALetter58, newIPALetter59, newIPALetter61,
            newIPALetter62, newIPALetter63, newIPALetter64, newIPALetter67, newIPALetter68
        ]
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
                realm.add(IPALetterList)
            }
        } catch {
            print("Error initialising new real, \(error)")
        }
    }
    
    static func addWildcardsToRealm() {
        var wildCardList = [WildCardModel]()
        
        let wildCard1 = WildCardModel()
        wildCard1.ipaCombo = "z"
        wildCard1.letterCombo = "x"
        wildCard1.numberValue = "1"
        
        let wildCard2 = WildCardModel()
        wildCard2.ipaCombo = "jə"
        wildCard2.letterCombo = "y'"
        wildCard2.numberValue = "2"
        
        let wildCard3 = WildCardModel()
        wildCard3.ipaCombo = "jə"
        wildCard3.letterCombo = "u"
        wildCard3.numberValue = "3"
        
        let wildCard4 = WildCardModel()
        wildCard4.ipaCombo = "ju"
        wildCard4.letterCombo = "ew"
        wildCard4.numberValue = "4"
        
        let wildCard5 = WildCardModel()
        wildCard5.ipaCombo = "ju"
        wildCard5.letterCombo = "ut"
        wildCard5.numberValue = "5"
        
        let wildCard6 = WildCardModel()
        wildCard6.ipaCombo = "ju"
        wildCard6.letterCombo = "u"
        wildCard6.numberValue = "5"
        
        let wildCard7 = WildCardModel()
        wildCard7.ipaCombo = "kʃ"
        wildCard7.letterCombo = "x"
        wildCard7.numberValue = "6"
        
        let wildCard8 = WildCardModel()
        wildCard8.ipaCombo = "weɪ"
        wildCard8.letterCombo = "a"
        wildCard8.numberValue = "7"
        
        let wildCard9 = WildCardModel()
        wildCard9.ipaCombo = "wə"
        wildCard9.letterCombo = "o"
        wildCard9.numberValue = "8"
        
        let wildCard10 = WildCardModel()
        wildCard10.ipaCombo = "wɪ"
        wildCard10.letterCombo = "a"
        wildCard10.numberValue = "9"
        
        let wildCard11 = WildCardModel()
        wildCard11.ipaCombo = "f"
        wildCard11.letterCombo = "pph"
        wildCard11.numberValue = "10"
        
        let wildCard12 = WildCardModel()
        wildCard12.ipaCombo = "f"
        wildCard12.letterCombo = "gh"
        wildCard12.numberValue = "10"
        
        let wildCard13 = WildCardModel()
        wildCard13.ipaCombo = "f"
        wildCard13.letterCombo = "ph"
        wildCard13.numberValue = "10"
        
        let wildCard14 = WildCardModel()
        wildCard14.ipaCombo = "h"
        wildCard14.letterCombo = "j"
        wildCard14.numberValue = "11"
        
        let wildCard15 = WildCardModel()
        wildCard15.ipaCombo = "k"
        wildCard15.letterCombo = "que"
        wildCard15.numberValue = "12"
        
        
        let wildCard16 = WildCardModel()
        wildCard16.ipaCombo = "k"
        wildCard16.letterCombo = "q"
        wildCard16.numberValue = "12"
        
        let wildCard17 = WildCardModel()
        wildCard17.ipaCombo = "w"
        wildCard17.letterCombo = "u"
        wildCard17.numberValue = "13"
        
        let wildCard18 = WildCardModel()
        wildCard18.ipaCombo = "w"
        wildCard18.letterCombo = "o"
        wildCard18.numberValue = "13"
        
        let wildCard19 = WildCardModel()
        wildCard19.ipaCombo = "w"
        wildCard19.letterCombo = "j"
        wildCard19.numberValue = "13"
        
        let wildCard20 = WildCardModel()
        wildCard20.ipaCombo = "t"
        wildCard20.letterCombo = "z"
        wildCard20.numberValue = "14"
        
        let wildCard21 = WildCardModel()
        wildCard21.ipaCombo = "v"
        wildCard21.letterCombo = "ph"
        wildCard21.numberValue = "15"
        
        let wildCard22 = WildCardModel()
        wildCard22.ipaCombo = "ər"
        wildCard22.letterCombo = "olo"
        wildCard22.numberValue = "16"
        
        let wildCard23 = WildCardModel()
        wildCard23.ipaCombo = "ɡ"
        wildCard23.letterCombo = "ck"
        wildCard23.numberValue = "17"
        
        wildCardList.append(contentsOf: [
            wildCard1,wildCard2,wildCard3,wildCard4,wildCard5,wildCard6,wildCard7,wildCard8,wildCard9,wildCard10,
            wildCard11,wildCard12,wildCard13,wildCard14,wildCard15,wildCard16,wildCard17,wildCard18,wildCard19,
            wildCard20,wildCard21,wildCard22,wildCard23
        ])
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(wildCardList)
            }
        } catch {
            print("Error initialising new real, \(error)")
        }
        
    }
}


