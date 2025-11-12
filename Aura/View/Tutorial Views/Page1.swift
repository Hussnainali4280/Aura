//
//  Page1.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/22/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page1: UIView {
    
    // MARK: - Subviews
    let titleLabel: UILabel = {
        let l = UILabel()
        
        // INDEX OUT OF RANGE
        let attText = NSMutableAttributedString(string: NSLocalizedString("Welcome to ", comment: "Welcome to Aura!"))
        let attText1 = NSMutableAttributedString(string: NSLocalizedString("Aura", comment: "Welcome to Aura!"))
        let attText2 = NSMutableAttributedString(string: NSLocalizedString("!", comment: "Welcome to Aura!"))
        
        attText1.addAttribute(.foregroundColor, value: K.Colors.purple, range: .init(location: 0, length: 2))
        attText1.addAttribute(.foregroundColor, value: K.Colors.darkGrey, range: .init(location: 2, length: 1))
        attText1.addAttribute(.foregroundColor, value: K.Colors.lightPink, range: .init(location: 3, length: 1))
        
        attText.append(attText1)
        attText.append(attText2)

        attText.addAttribute(.font, value: UIFont.systemFont(ofSize: 34, weight: .bold), range: .init(location: 0, length: attText.length))
        
        
        l.attributedText = attText
        l.textAlignment = .center
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        
        return l
    }()
    
    let label1: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Learn English HD.", comment: "")
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return l
        
    }()
    
    let label2: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Sound Native.", comment: "Sound like a fluent native english speaker")
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return l
        
    }()
    
    let label3: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Be Confident.", comment: "Be confident when speaking english")
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return l
        
    }()
    
    let label4: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Be Understood.", comment: "Be understood by native speakers when you speak english")
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
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
        
        self.addSubview(titleLabel)
        titleLabel.anchor(top: self.safeAreaLayoutGuide.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 100, left: 20, bottom: 0, right: -20))
        
        let v = UIView()
        v.addSubview(label1)
        v.addSubview(label2)
        v.addSubview(label3)
        v.addSubview(label4)
        
        label1.anchor(top: v.topAnchor,
                      bottom: nil,
                      leading: v.leadingAnchor,
                      trailing: v.trailingAnchor,
                      height: nil,
                      width: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: -10))
        
        label2.anchor(top: label1.bottomAnchor,
                      bottom: nil,
                      leading: v.leadingAnchor,
                      trailing: v.trailingAnchor,
                      height: nil,
                      width: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: -10))
        
        label3.anchor(top: label2.bottomAnchor,
                      bottom: nil,
                      leading: v.leadingAnchor,
                      trailing: v.trailingAnchor,
                      height: nil,
                      width: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: -10))
        
        label4.anchor(top: label3.bottomAnchor,
                      bottom: v.bottomAnchor,
                      leading: v.leadingAnchor,
                      trailing: v.trailingAnchor,
                      height: nil,
                      width: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10))
        
        self.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        v.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
