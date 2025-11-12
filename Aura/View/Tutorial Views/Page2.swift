//
//  Page2.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/22/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page2: UIView {
    
    var whyHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Why Aura?", comment: "Why use the Aura App")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return l
    }()
    
    var whyText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Aura is the only app that uses\n", comment: "Aura is the only app that uses American English HD, the best system to teach proper American English pronunciation"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("American English HD", comment: "Aura is the only app that uses American English HD, the best system to teach proper American English pronunciation"))
        let text3 = NSMutableAttributedString(string: NSLocalizedString(",\nthe best system to teach\nproper American English\npronunciation.", comment: "Aura is the only app that uses American English HD, the best system to teach proper American English pronunciation"))
        
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: text2.length))
        text3.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text3.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 17, weight: .regular), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 17, weight: .bold), range: .init(location: 0, length: text2.length))
        text3.addAttribute(.font, value: UIFont.systemFont(ofSize: 17, weight: .regular), range: .init(location: 0, length: text3.length))
        
        text1.append(text2)
        text1.append(text3)
        
        l.attributedText = text1
        
        return l
    }()
    
    var ehdHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("What is American English HD?", comment: "")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return l
    }()
    
    var ehdText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Let us show you with\nan example...", comment: ""))
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 17, weight: .regular), range: .init(location: 0, length: text1.length))
        l.attributedText = text1
        return l
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
        
        self.addSubview(whyHeader)
        self.addSubview(whyText)
        self.addSubview(ehdHeader)
        self.addSubview(ehdText)
        
        whyHeader.anchor(top: self.topAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 100, left: 30, bottom: 0, right: -30))
        
        whyText.anchor(top: whyHeader.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
        ehdHeader.anchor(top: whyText.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
        
        ehdText.anchor(top: ehdHeader.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 30, bottom: -30, right: -30))
        
    }

}
