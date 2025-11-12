//
//  wildCardModel.swift
//  simply-english
//
//  Created by Max Dolensky on 3/5/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation
import RealmSwift

class WildCardModel: Object {
    @objc dynamic var ipaCombo = ""
    @objc dynamic var letterCombo = ""
    @objc dynamic var numberValue = ""
}
