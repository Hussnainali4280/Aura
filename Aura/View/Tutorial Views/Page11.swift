//
//  Page11.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/23/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page11: UIView {

    var mainHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("One more thing!", comment: "One more thing to tell you about")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var step1Header: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("English HD Key", comment: "Key as in the key to a map that explains what everything is")
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
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Get the full explanation of\nEnglish HD in the ", comment: "Get the full explanation of\nEnglish HD in the Key Tab."))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Key Tab", comment: "Get the full explanation of\nEnglish HD in the Key Tab."))
        let text3 = NSMutableAttributedString(string: NSLocalizedString(".  ", comment: "Get the full explanation of\nEnglish HD in the Key Tab."))
        
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
        l.text = NSLocalizedString("Lessons", comment: "Course video lessons")
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
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Master English HD by accessing\nthe video lessons in the ", comment: "Master English HD by accessing\nthe video lessons in the Lessons Tab."))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Lessons Tab", comment: "Master English HD by accessing\nthe video lessons in the Lessons Tab."))
        let text3 = NSMutableAttributedString(string: NSLocalizedString(".    ", comment: "Master English HD by accessing\nthe video lessons in the Lessons Tab."))
        
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
        
    let iv: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "tabBar")
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
        self.addSubview(iv)
        
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
                         padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: -30))
        
        step1Text.anchor(top: step1Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: -30))
        
        step2Header.anchor(top: step1Text.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: -30))
        
        step2Text.anchor(top: step2Header.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: -30))
                
        iv.anchor(top: step2Text.bottomAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: 140,
                        width: nil,
                        padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20))

    }

}
