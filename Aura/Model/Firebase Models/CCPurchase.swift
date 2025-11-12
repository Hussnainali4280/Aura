//
//  CCPurchase.swift
//  Aura
//
//  Created by Maxwell Dolensky on 6/30/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import Foundation
import Firebase

struct CCPurchase: Codable {
    var creatorCode : String
    var day: Int
    var month: Int
    var year: Int
    var price: Double
    var courseName: String
    var userEmail: String
}

struct CCPurchases: Codable {
    var ccPurchases : [CCPurchase]
}
