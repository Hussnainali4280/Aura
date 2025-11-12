//
//  Page12.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/23/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page12: UIView {

    // MARK: - Subviews
    let titleLabel: UILabel = {
        let l = UILabel()
        
        let attText = NSMutableAttributedString(string: NSLocalizedString("Congratulations!\nYou now know the basics of this app", comment: "You learned everything you need to for using the app"))
        
        attText.addAttribute(.font, value: UIFont.systemFont(ofSize: 28, weight: .bold), range: .init(location: 0, length: attText.length))
        
        l.attributedText = attText
        l.textAlignment = .center
        l.numberOfLines = 0
        
        return l
    }()
    
    let label1: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Start your journey to English HD Mastery!", comment: "")
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.numberOfLines = 0
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
        
        let v = UIView()
        v.addSubview(titleLabel)
        v.addSubview(label1)
        
        titleLabel.anchor(top: v.topAnchor,
                          bottom: nil,
                          leading: v.leadingAnchor,
                          trailing: v.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10))
        
        label1.anchor(top: titleLabel.bottomAnchor,
                      bottom: v.bottomAnchor,
                      leading: v.leadingAnchor,
                      trailing: v.trailingAnchor,
                      height: nil,
                      width: nil,
                      padding: UIEdgeInsets(top: 20, left: 10, bottom: -10, right: -10))
                
        self.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        v.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        v.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor).isActive = true
    }

}
