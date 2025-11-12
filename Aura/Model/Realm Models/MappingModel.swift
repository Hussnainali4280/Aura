//
//  MappingModel.swift
//  simply-english
//
//  Created by Max Dolensky on 2/13/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation
import RealmSwift

class IPALetter: Object {
    @objc dynamic var ipaLetter = ""
    let letterCombos = List<LetterCombo>()
    
    override static func primaryKey() -> String? {
      return "ipaLetter"
    }
}

class LetterCombo: Object {
    @objc dynamic var letterCombo = ""
    @objc dynamic var ipaParent = ""
    let colorMapList = List<ColorMap>()
}

class ColorMap: Object {
    @objc dynamic var ipaParent = ""
    @objc dynamic var LetterComboParent = ""
    @objc dynamic var color = ""
}



