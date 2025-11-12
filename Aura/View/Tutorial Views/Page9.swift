//
//  Page9.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/23/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page9: UIView {
    
    var mainHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("And you can translate too!", comment: "")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
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
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Select the language you want to translate\nto or from by clicking on the ", comment: "Select the language you want to translate\nto or from by clicking on the input text.   "))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("input text", comment: "Select the language you want to translate\nto or from by clicking on the input text.   "))
        let text3 = NSMutableAttributedString(string: NSLocalizedString(".   ", comment: "Select the language you want to translate\nto or from by clicking on the input text.   "))
        
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: K.DesignColors.primary, range: .init(location: 0, length: text2.length))
        text3.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text3.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        text3.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text3.length))
        
        text1.append(text2)
        text1.append(text3)
        
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
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Swap the order of translation by\nselecting the ", comment: "Swap the order of translation by selecting the arrows button."))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("arrows button", comment: "Swap the order of translation by selecting the arrows button."))
        let text3 = NSMutableAttributedString(string: NSLocalizedString(". ", comment: "Swap the order of translation by selecting the arrows button."))
        
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: K.Colors.pink, range: .init(location: 0, length: text2.length))
        text3.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text3.length))
        
        text1.append(text2)
        text1.append(text3)
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        
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
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Type in the text and click search, or\nuse the mic button to search with speech.", comment: ""))
        
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        
        l.attributedText = text1
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    let iv: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "translationParams")
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
        } else if UIScreen.main.bounds.height > 568 {
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
                          padding: UIEdgeInsets(top: 70, left: 30, bottom: 0, right: -30))
        
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
                  bottom: nil,
                  leading: self.leadingAnchor,
                  trailing: self.trailingAnchor,
                  height: 250,
                  width: nil,
                  padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: -20))
    }
    
    func setConstraintsForSmallerPhone() {
        mainHeader.anchor(top: self.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 50, left: 30, bottom: 0, right: -30))
        
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
                  bottom: nil,
                  leading: self.leadingAnchor,
                  trailing: self.trailingAnchor,
                  height: 250,
                  width: nil,
                  padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
    }
    
    func setConstraintsForSmallestPhone() {
        mainHeader.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        mainHeader.anchor(top: self.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
        
        step1Header.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        step1Header.anchor(top: mainHeader.bottomAnchor,
                           bottom: nil,
                           leading: self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 8, left: 40, bottom: 0, right: -40))
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Select the language you want to translate to or from by clicking on the ", comment: "Select the language you want to translate\nto or from by clicking on the input text.   "))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("input text", comment: "Select the language you want to translate\nto or from by clicking on the input text.   "))
        let text3 = NSMutableAttributedString(string: NSLocalizedString(".   ", comment: "Select the language you want to translate\nto or from by clicking on the input text.   "))
        
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: K.DesignColors.primary, range: .init(location: 0, length: text2.length))
        text3.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text3.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        text3.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text3.length))
        
        text1.append(text2)
        text1.append(text3)
        
        step1Text.attributedText = text1
        
        step1Text.anchor(top: step1Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 4, left: 40, bottom: 0, right: -40))
        
        step2Header.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        step2Header.anchor(top: step1Text.bottomAnchor,
                           bottom: nil,
                           leading: self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 8, left: 40, bottom: 0, right: -40))
        
        let text4 = NSMutableAttributedString(string: NSLocalizedString("Swap the order of translation by selecting the ", comment: "Swap the order of translation by selecting the arrows button."))
        let text5 = NSMutableAttributedString(string: NSLocalizedString("arrows button", comment: "Swap the order of translation by selecting the arrows button."))
        let text6 = NSMutableAttributedString(string: NSLocalizedString(". ", comment: "Swap the order of translation by selecting the arrows button."))
        
        text4.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text4.length))
        text5.addAttribute(.foregroundColor, value: K.Colors.pink, range: .init(location: 0, length: text5.length))
        text6.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text6.length))
        
        text4.append(text5)
        text4.append(text6)
        
        text4.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text4.length))
        
        step2Text.attributedText = text4
        
        step2Text.anchor(top: step2Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 4, left: 40, bottom: 0, right: -40))
        
        step3Header.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        step3Header.anchor(top: step2Text.bottomAnchor,
                           bottom: nil,
                           leading: self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 8, left: 40, bottom: 0, right: -40))
        
        let text7 = NSMutableAttributedString(string: NSLocalizedString("Type in the text and click search, or use the mic button to search with speech.", comment: ""))
        
        text7.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text7.length))
        
        text7.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text7.length))
        
        step3Text.attributedText = text7
        
        step3Text.anchor(top: step3Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 4, left: 40, bottom: 0, right: -40))
        
        iv.anchor(top: step3Text.bottomAnchor,
                  bottom: nil,
                  leading: self.leadingAnchor,
                  trailing: self.trailingAnchor,
                  height: 210,
                  width: nil,
                  padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
    }
    
}
