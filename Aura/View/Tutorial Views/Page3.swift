//
//  Page3.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/22/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page3: UIView {
    
    var sounds = ["BOT", "BUT", "BET", "BIT", "BAIT", "BAT", "BEAT"]

    // MARK: - Subviews
    var questionHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("What sound does \'a\' make?", comment: "What sound does the letter 'a' make")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return l
    }()
    
    var questionText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Hint: ", comment: "Here is a hint to help you answer this question"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Tap each \'a\' to hear a possible sound\nthat it can make in American English", comment: "Tap the letters of all the a's on the screen to hear their different sounds"))
        
        text1.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text2.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .bold), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        
        
        text1.append(text2)
        
        l.attributedText = text1
        
        return l
    }()
    
    var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
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
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        if UIScreen.main.bounds.width > 320 {
            populateStackViewForRegularPhones()
        } else {
            populateStackViewForSmallerPhone()
        }
        
        self.addSubview(questionHeader)
        self.addSubview(questionText)
        
        questionHeader.anchor(top: self.topAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 150, left: 30, bottom: 0, right: -30))
        
        questionText.anchor(top: questionHeader.bottomAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
    }
    
    func populateStackViewForRegularPhones() {
        for i in 0...6 {
            let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.heightAnchor.constraint(equalToConstant: 40).isActive = true
            background.widthAnchor.constraint(equalToConstant: 40).isActive = true
            background.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 20)
            
            let b = AnimatedButton()
            b.setTitle("a", for: .normal)
            b.setTitleColor(.black, for: .normal)
            b.backgroundColor = .white
            b.tag = i
            b.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
            background.addSubview(b)
            b.anchor(top: background.topAnchor,
                     bottom: background.bottomAnchor,
                     leading: background.leadingAnchor,
                     trailing: background.trailingAnchor,
                     height: nil,
                     width: nil)
            b.roundCorners(cornerRadius: 20)
            
            stackView.addArrangedSubview(background)
        }
    }
    
    func populateStackViewForSmallerPhone() {
        for i in 0...6 {
            let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.heightAnchor.constraint(equalToConstant: 30).isActive = true
            background.widthAnchor.constraint(equalToConstant: 30).isActive = true
            background.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 15)
            
            let b = AnimatedButton()
            b.setTitle("a", for: .normal)
            b.setTitleColor(.black, for: .normal)
            b.backgroundColor = .white
            b.tag = i
            b.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
            background.addSubview(b)
            b.anchor(top: background.topAnchor,
                     bottom: background.bottomAnchor,
                     leading: background.leadingAnchor,
                     trailing: background.trailingAnchor,
                     height: nil,
                     width: nil)
            b.roundCorners(cornerRadius: 15)
            
            stackView.addArrangedSubview(background)
        }
    }
            
    @objc func playSound(_ sender: UIButton) {
        
        Utilities.shared.playSound(sounds[sender.tag])
        
        UIView.animate(withDuration: 0.5) {
            sender.superview?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.superview?.layer.shadowOpacity = 0.3
        } completion: { (_) in
            UIView.animate(withDuration: 0.3) {
                sender.superview?.transform = .identity
            }
        }

        
    }

}
