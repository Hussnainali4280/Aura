//
//  SearchStatusView.swift
//  Aura
//
//  Created by Max Dolensky on 8/27/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit


// NOTE: MIGHT NEED TO DELETE UNABLE TO TRANSLATE: azure always sends back a tranlsation. If it can't translate, output will be input
// AKA: As of now only "noExistingWordModels" "missingSomeWordModels" and "colorError" will only be called

class SearchStatusView: UIView {
    
    // Error Messages
    let success = NSLocalizedString("Success!", comment: "Success, whatever action you just performed worked successfully")
    
    let nilTranslation = [(NSLocalizedString("Unable to translate", comment: "Cannot translate the text that you searched"), [NSLocalizedString("Check network connection.", comment: "Check your internet connection")])]
    
    let emptyTranslationNoExistingWordModels = [(NSLocalizedString("No translation found", comment: "Cannot find a translation for the word you searched"), [NSLocalizedString("Check input/output language parameters.", comment: "If you select translate from english to japanese and then you search in japanses this will lead to an issue"), NSLocalizedString("Check spelling.", comment: "You may have misspelled the word you are searching, check your spelling")]),
    (NSLocalizedString("Unable to color any words", comment: ""), [NSLocalizedString("Check spelling.", comment: "You may have misspelled the word you are searching, check your spelling"), NSLocalizedString("Some words may not exist in the database yet.", comment: "The words you searched may not exist in our database and that is why it is not colored")])]
    
    
    let emptyTranslationMissingSomeWordModels = [(NSLocalizedString("No translation found", comment: "Cannot find a translation for the word you searched"), [NSLocalizedString("Check input/output language parameters.", comment: "If you select translate from english to japanese and then you search in japanses this will lead to an issue"), NSLocalizedString("Check spelling.", comment: "You may have misspelled the word you are searching, check your spelling")]),
    (NSLocalizedString("Unable to color some words", comment: ""), [NSLocalizedString("Check spelling.", comment: "You may have misspelled the word you are searching, check your spelling"), NSLocalizedString("Some words may not exist in the database yet.", comment: "The words you searched may not exist in our database and that is why it is not colored")])]
    
    let emptyTranslationWithAllWordModels = [(NSLocalizedString("No translation found", comment: "Cannot find a translation for the word you searched"), [NSLocalizedString("Check input/output language parameters.", comment: "If you select translate from english to japanese and then you search in japanses this will lead to an issue")])]
    
    let noExistingWordModels = [(NSLocalizedString("Unable to color any words", comment: ""), [NSLocalizedString("Check input/output language parameters.", comment: "If you select translate from english to japanese and then you search in japanses this will lead to an issue"), NSLocalizedString("Check spelling.", comment: "You may have misspelled the word you are searching, check your spelling"), NSLocalizedString("Check network connection.", comment: "Check your internet connection"), NSLocalizedString("Some words may not exist in the database yet.", comment: "The words you searched may not exist in our database and that is why it is not colored"), NSLocalizedString("Incorrect translation. We're working to improve this", comment: "")])]
    
    let missingSomeWordModels = [(NSLocalizedString("Unable to color some words", comment: ""), [NSLocalizedString("Check input/output language parameters.", comment: "If you select translate from english to japanese and then you search in japanses this will lead to an issue"), NSLocalizedString("Check spelling.", comment: "You may have misspelled the word you are searching, check your spelling"), NSLocalizedString("Check network connection.", comment: "Check your internet connection"), NSLocalizedString("Some words may not exist in the database yet.", comment: "The words you searched may not exist in our database and that is why it is not colored"), NSLocalizedString("Incorrect translation. We're working to improve this", comment: "")])]
    
    let colorError = [(NSLocalizedString("Warning: we detected a word that may be colored incorrectly", comment: ""), [NSLocalizedString("We will try and fix this as soon as possible!", comment: "")])]
    
    // Subviews
    let errLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = K.DesignColors.error
        label.backgroundColor = .clear
        return label
        
    }()
    
    let container: UIView = {
        
        let v = UIView()
        v.backgroundColor = .white
        v.roundCorners(cornerRadius: 10)
        return v
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        container.addSubview(errLabel)
        
        errLabel.translatesAutoresizingMaskIntoConstraints = false
        errLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        errLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        errLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        errLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        errLabel.topAnchor.constraint(greaterThanOrEqualTo: container.topAnchor, constant: 20).isActive = true
        errLabel.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -20).isActive = true
        
        self.addSubview(container)
        container.anchor(top: self.topAnchor,
                         bottom: self.bottomAnchor,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil)
    }
    
    func setLabelText(status: SearchStatus) {
        
        switch status {
            
        case .success:
            
            errLabel.text = success
            
        case .nilTranslation:
            
            errLabel.attributedText = formatAttributedString(errMessage: nilTranslation)
            
        case .emptyTranslationNoExistingWordModels:
            
            errLabel.attributedText = formatAttributedString(errMessage: emptyTranslationNoExistingWordModels)
            
        case .emptyTranslationMissingSomeWordModels:
            
            errLabel.attributedText = formatAttributedString(errMessage: emptyTranslationMissingSomeWordModels)
            
        case .emptyTranslationWithAllWordModels:
            
            errLabel.attributedText = formatAttributedString(errMessage: emptyTranslationWithAllWordModels)
            
        case .noExistingWordModels:
            
            errLabel.attributedText = formatAttributedString(errMessage: noExistingWordModels)
            
        case .missingSomeWordModels:
            
            errLabel.attributedText = formatAttributedString(errMessage: missingSomeWordModels)
        }
    }
    
    func setLabelTextAsColorErr() {
        
        errLabel.attributedText = formatAttributedString(errMessage: colorError)
        
    }
    
    func formatAttributedString(errMessage: [(String, [String])]) -> NSMutableAttributedString {
        
        let finalText = NSMutableAttributedString(string: "")

        var count = 1
        for err in errMessage {
            
            let attText1 = NSMutableAttributedString(string: err.0)
            attText1.addAttributes([.font : UIFont.systemFont(ofSize: 17, weight: .regular),
                                   .foregroundColor :  K.DesignColors.error],
                                  range: NSRange(location: 0, length: attText1.length))
         
            finalText.append(attText1)
            finalText.append(NSMutableAttributedString(string: "\n"))
            
            var count1 = 1
            for description in err.1 {
                
                let attText2 = NSMutableAttributedString(string: "- \(description)")
                attText2.addAttributes([.font : UIFont.systemFont(ofSize: 14, weight: .light),
                                        .foregroundColor :  UIColor.gray],
                                       range: NSRange(location: 0, length: attText2.length))
               
                finalText.append(attText2)
                
                if count1 != err.1.count {
                    finalText.append(NSMutableAttributedString(string: "\n"))
                    count1 += 1
                }
                
            }
            
            if count != errMessage.count {
                
                finalText.append(NSMutableAttributedString(string: "\n"))
                count += 1
            }
        }
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineSpacing = 2
        finalText.addAttribute(.paragraphStyle, value: paraStyle, range: NSRange(location: 0, length: finalText.length))
        
        return finalText
        
    }
}
