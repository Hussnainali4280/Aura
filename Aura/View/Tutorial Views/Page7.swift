//
//  Page7.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/23/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page7: UIView {

    var mainHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Get the pronunciation of any word or sentence", comment: "")
        l.numberOfLines = 2
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var step1Header: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Step 1:", comment: "")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var step1Text: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Set the ", comment: "Set the input to English and leave the output as Am. English HD."))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Input ", comment: "Set the input to English and leave the output as Am. English HD."))
        let text3 = NSMutableAttributedString(string: NSLocalizedString("to ", comment: "Set the input to English and leave the output as Am. English HD."))
        let text4 = NSMutableAttributedString(string: NSLocalizedString("English ", comment: "Set the input to English and leave the output as Am. English HD."))
        let text5 = NSMutableAttributedString(string: NSLocalizedString("and leave\nthe ", comment: "Set the input to English and leave the output as Am. English HD."))
        let text6 = NSMutableAttributedString(string: NSLocalizedString("Output ", comment: "Set the input to English and leave the output as Am. English HD."))
        let text7 = NSMutableAttributedString(string: NSLocalizedString("as ", comment: "Set the input to English and leave the output as Am. English HD."))
        let text8 = NSMutableAttributedString(string: NSLocalizedString("Am. English HD.", comment: "Set the input to English and leave the output as Am. English HD."))
        
        
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: K.DesignColors.primary, range: .init(location: 0, length: text2.length))
        text3.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text3.length))
        text4.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text4.length))
        text5.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text5.length))
        text6.addAttribute(.foregroundColor, value: K.Colors.pink, range: .init(location: 0, length: text6.length))
        text7.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text7.length))
        text8.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text8.length))
        
        if UIScreen.main.bounds.height > 667 {
            text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
            text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
            text3.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text3.length))
            text4.addAttribute(.font, value: UIFont.italicSystemFont(ofSize: 15), range: .init(location: 0, length: text4.length))
            text5.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text5.length))
            text6.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text6.length))
            text7.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text7.length))
            text8.addAttribute(.font, value: UIFont.italicSystemFont(ofSize: 15), range: .init(location: 0, length: text8.length))
        } else {
            text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .regular), range: .init(location: 0, length: text1.length))
            text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .regular), range: .init(location: 0, length: text2.length))
            text3.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .regular), range: .init(location: 0, length: text3.length))
            text4.addAttribute(.font, value: UIFont.italicSystemFont(ofSize: 13), range: .init(location: 0, length: text4.length))
            text5.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .regular), range: .init(location: 0, length: text5.length))
            text6.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .regular), range: .init(location: 0, length: text6.length))
            text7.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .regular), range: .init(location: 0, length: text7.length))
            text8.addAttribute(.font, value: UIFont.italicSystemFont(ofSize: 13), range: .init(location: 0, length: text8.length))
        }

        
        text1.append(text2)
        text1.append(text3)
        text1.append(text4)
        text1.append(text5)
        text1.append(text6)
        text1.append(text7)
        text1.append(text8)
        
        l.attributedText = text1
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var step2Header: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Step 2:", comment: "")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var step2Text: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Enter the word into the ", comment: "Enter the word into the text box or tap the mic button to search with speech"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("text box ", comment: "Enter the word into the text box or tap the mic button to search with speech"))
        let text3 = NSMutableAttributedString(string: NSLocalizedString("or tap\nthe ", comment: "Enter the word into the text box or tap the mic button to search with speech"))
        let text4 = NSMutableAttributedString(string: NSLocalizedString("mic button ", comment: "Enter the word into the text box or tap the mic button to search with speech"))
        let text5 = NSMutableAttributedString(string: NSLocalizedString("to search with speech.", comment: "Enter the word into the text box or tap the mic button to search with speech"))
        
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: K.Colors.orange, range: .init(location: 0, length: text2.length))
        text3.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text3.length))
        text4.addAttribute(.foregroundColor, value: K.Colors.darkGreen, range: .init(location: 0, length: text4.length))
        text5.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text5.length))
        
        text1.append(text2)
        text1.append(text3)
        text1.append(text4)
        text1.append(text5)
        
        if UIScreen.main.bounds.height > 667 {
            text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        } else {
            text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .regular), range: .init(location: 0, length: text1.length))
        }
        
        
        l.attributedText = text1
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var step3Header: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Step 3:", comment: "")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var step3Text: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Click ", comment: "Click Search and watch your input transform into English HD transform into English HD."))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Search ", comment: "Click Search and watch your input transform into English HD transform into English HD."))
        let text3 = NSMutableAttributedString(string: NSLocalizedString("and watch your input\n", comment: "Click Search and watch your input transform into English HD."))
        let text4 = NSMutableAttributedString(string: NSLocalizedString("transform into English HD.", comment: "Click Search and watch your input transform into English HD."))
        
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: K.Colors.blue, range: .init(location: 0, length: text2.length))
        text3.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text3.length))
        text4.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text4.length))
        
        text1.append(text2)
        text1.append(text3)
        text1.append(text4)
        
        if UIScreen.main.bounds.height > 667 {
            text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        } else {
            text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .regular), range: .init(location: 0, length: text1.length))
        }
        
        l.attributedText = text1
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    let iv: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "searchPronunciation")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
        
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setup() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        
        self.addSubview(mainHeader)
        self.addSubview(step1Header)
        self.addSubview(step1Text)
        self.addSubview(step2Header)
        self.addSubview(step2Text)
        self.addSubview(step3Header)
        self.addSubview(step3Text)
        self.addSubview(iv)
        
        if UIScreen.main.bounds.height > 736 {
            setConstraintsForLargerPhone()
        } else if UIScreen.main.bounds.height > 667 {
            setConstraintsForSmallerPhone()
        } else {
            setConstraintsForSmallestPhone()
        }

    }
    
    func setConstraintsForLargerPhone() {
        mainHeader.anchor(top: self.topAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 60, left: 30, bottom: 0, right: -30))
        
        step1Header.anchor(top: mainHeader.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 15, left: 40, bottom: 0, right: -40))
        
        step1Text.anchor(top: step1Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -40))
        
        step2Header.anchor(top: step1Text.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 15, left: 40, bottom: 0, right: -40))
        
        step2Text.anchor(top: step2Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -40))
        
        step3Header.anchor(top: step2Text.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 15, left: 40, bottom: 0, right: -40))
        
        step3Text.anchor(top: step3Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -40))
        
        iv.anchor(top: step3Text.bottomAnchor,
                        bottom: self.bottomAnchor,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 10, bottom: -70, right: -10))
    }
    
    func setConstraintsForSmallerPhone() {
        mainHeader.anchor(top: self.topAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
        
        step1Header.anchor(top: mainHeader.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 12, left: 40, bottom: 0, right: -40))
        
        step1Text.anchor(top: step1Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 8, left: 40, bottom: 0, right: -40))
        
        step2Header.anchor(top: step1Text.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 12, left: 40, bottom: 0, right: -40))
        
        step2Text.anchor(top: step2Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 8, left: 40, bottom: 0, right: -40))
        
        step3Header.anchor(top: step2Text.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 12, left: 40, bottom: 0, right: -40))
        
        step3Text.anchor(top: step3Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 8, left: 40, bottom: 0, right: -40))
        
        iv.anchor(top: step3Text.bottomAnchor,
                        bottom: self.bottomAnchor,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 10, bottom: -40, right: -10))
    }
    
    func setConstraintsForSmallestPhone() {
        
        mainHeader.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        step1Header.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        step2Header.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        step3Header.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        mainHeader.anchor(top: self.topAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: -20))
        
        step1Header.anchor(top: mainHeader.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 8, left: 30, bottom: 0, right: -30))
        
        step1Text.anchor(top: step1Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 4, left: 30, bottom: 0, right: -30))
        
        step2Header.anchor(top: step1Text.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 8, left: 30, bottom: 0, right: -30))
        
        step2Text.anchor(top: step2Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 4, left: 30, bottom: 0, right: -30))
        
        step3Header.anchor(top: step2Text.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 8, left: 30, bottom: 0, right: -30))
        
        step3Text.anchor(top: step3Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 4, left: 30, bottom: 0, right: -30))
        
        iv.anchor(top: step3Text.bottomAnchor,
                        bottom: self.bottomAnchor,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 10, bottom: -40, right: -10))
    }

}
