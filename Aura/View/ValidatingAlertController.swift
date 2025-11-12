//
//  ValidatingAlertController.swift
//  Aura
//
//  Created by Maxwell Dolensky on 6/30/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import UIKit

class ValidatingAlertController: UIAlertController {
    
    func isValidCreatorCode(_ cc: String) -> Bool {
        let codes = Set(Utilities.shared.creatorCodes)
        if codes.contains(cc) {
            return true
        }
        return false
    }

    @objc func textDidChange() {
        if let code = textFields?[0].text {
            if code.count == 0 {
                self.actions[0].isEnabled = false
                self.message = NSLocalizedString("Supporting a creator? Enter their code here.", comment: "")
            } else if isValidCreatorCode(code) {
                self.actions[0].isEnabled = true
                self.message = NSLocalizedString("Creator Code found ✅", comment: "")
            } else {
                self.actions[0].isEnabled = false
                self.message = NSLocalizedString("Creator Code not found ❌", comment: "")
            }
        }
    }
}


