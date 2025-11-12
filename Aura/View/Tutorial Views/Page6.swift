//
//  Page6.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/23/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page6: UIView {
    
    var whatHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("What is English HD?", comment: "")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return l
    }()
    
    var whatText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("English HD is a coloring system that uses\ncolors to represent individual sounds.", comment: ""))
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        l.attributedText = text1
        
        return l
    }()
    
    var whyHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Why is it important?", comment: "")
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
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("As seen in the previous example, letters and\nletter combinations in English can make many\ndifferent sounds. This coloring system was\ncreated to help you visually see the different\nsounds in addition to hearing them.", comment: ""))
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        l.attributedText = text1
        
        return l
    }()
    
    var resultHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Results", comment: "The results you get from doing something")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return l
    }()
    
    var resultText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Master the colors. Master the sounds. Master\nthe words. You will be sounding like a native\nspeaker in no time.", comment: ""))
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        l.attributedText = text1
        
        return l
    }()
    
    var almostHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Almost there!", comment: "Almost done going through the app tutorial")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return l
    }()
    
    var almostText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Let's see how you can search any word in\nEnglish HD using Aura!", comment: ""))
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
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
        
        self.addSubview(whatHeader)
        self.addSubview(whatText)
        self.addSubview(whyHeader)
        self.addSubview(whyText)
        self.addSubview(resultHeader)
        self.addSubview(resultText)
        self.addSubview(almostHeader)
        self.addSubview(almostText)
        
        if UIScreen.main.bounds.height > 568 {
            setupConstraintsForRegularPhones()
        } else {
            setupConstraintsForSmallPhones()
        }
        
    }
    
    func setupConstraintsForRegularPhones() {
        if UIScreen.main.bounds.height > 736 {
            whatHeader.anchor(top: self.topAnchor,
                              bottom: nil,
                              leading: self.leadingAnchor,
                              trailing: self.trailingAnchor,
                              height: nil,
                              width: nil,
                              padding: UIEdgeInsets(top: 80, left: 30, bottom: 0, right: -30))
        } else {
            whatHeader.anchor(top: self.topAnchor,
                              bottom: nil,
                              leading: self.leadingAnchor,
                              trailing: self.trailingAnchor,
                              height: nil,
                              width: nil,
                              padding: UIEdgeInsets(top: 50, left: 30, bottom: 0, right: -30))
        }
        
        
        whatText.anchor(top: whatHeader.bottomAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
        whyHeader.anchor(top: whatText.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
        
        whyText.anchor(top: whyHeader.bottomAnchor,
                       bottom: nil,
                       leading: self.leadingAnchor,
                       trailing: self.trailingAnchor,
                       height: nil,
                       width: nil,
                       padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
        resultHeader.anchor(top: whyText.bottomAnchor,
                            bottom: nil,
                            leading: self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            height: nil,
                            width: nil,
                            padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
        
        resultText.anchor(top: resultHeader.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
        almostHeader.anchor(top: resultText.bottomAnchor,
                            bottom: nil,
                            leading: self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            height: nil,
                            width: nil,
                            padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
        
        almostText.anchor(top: almostHeader.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
    }
    
    func setupConstraintsForSmallPhones() {
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("English HD is a coloring system that uses colors to represent individual sounds.", comment: ""))
        text1.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text1.length))
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text1.length))
        whatText.attributedText = text1
        
        let text2 = NSMutableAttributedString(string: NSLocalizedString("As seen in the previous example, letters and letter combinations in English can make many different sounds. This coloring system was created to help you visually see the different sounds in addition to hearing them.", comment: ""))
        text2.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text2.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        whyText.attributedText = text2
        
        let text3 = NSMutableAttributedString(string: NSLocalizedString("Master the colors. Master the sounds. Master the words. You will be sounding like a native speaker in no time.", comment: ""))
        text3.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text3.length))
        text3.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text3.length))
        resultText.attributedText = text3
        
        let text4 = NSMutableAttributedString(string: NSLocalizedString("Let's see how you can search any word in English HD using Aura!", comment: ""))
        text4.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text4.length))
        text4.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text4.length))
        almostText.attributedText = text4
        
        whatHeader.anchor(top: self.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 50, left: 20, bottom: 0, right: -20))
        
        whatText.anchor(top: whatHeader.bottomAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 6, left: 20, bottom: 0, right: -20))
        
        whyHeader.anchor(top: whatText.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: -20))
        
        whyText.anchor(top: whyHeader.bottomAnchor,
                       bottom: nil,
                       leading: self.leadingAnchor,
                       trailing: self.trailingAnchor,
                       height: nil,
                       width: nil,
                       padding: UIEdgeInsets(top: 6, left: 20, bottom: 0, right: -20))
        
        resultHeader.anchor(top: whyText.bottomAnchor,
                            bottom: nil,
                            leading: self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            height: nil,
                            width: nil,
                            padding: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: -20))
        
        resultText.anchor(top: resultHeader.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 6, left: 20, bottom: 0, right: -20))
        
        almostHeader.anchor(top: resultText.bottomAnchor,
                            bottom: nil,
                            leading: self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            height: nil,
                            width: nil,
                            padding: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: -20))
        
        almostText.anchor(top: almostHeader.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 6, left: 20, bottom: 0, right: -20))
    }
    
    
}
