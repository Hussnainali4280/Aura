//
//  SeminarPopUp.swift
//  Aura
//
//  Created by Maxwell Dolensky on 1/10/22.
//  Copyright © 2022 Max Dolensky. All rights reserved.
//

import UIKit

protocol SeminarPopUpDelegate {
    func dismiss()
}

class SeminarPopUpView: UIView {
    let fontSize: CGFloat = UIScreen.main.bounds.height > 667 ? 17 : 15
    var delegate: SeminarPopUpDelegate?
    
    let title: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Meet Ky Senpai!", comment: "")
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 2
        return l
    }()
    
    lazy var info1: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Sign Up for Ky Senpai's weekly seminar now!", comment: "")
        l.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
        
    let SignUpButton: AnimatedButton = {
        let b = AnimatedButton()
        b.isFlat = true
        b.setTitle(NSLocalizedString("Sign Up", comment: ""), for: .normal)
        b.backgroundColor = K.DesignColors.primary
        b.tintColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        b.heightAnchor.constraint(equalToConstant: 40).isActive = true
        b.widthAnchor.constraint(equalToConstant: 160).isActive = true
        b.addTarget(self, action: #selector(dismissToWebsite(_:)), for: .touchUpInside)
        return b
    }()
    
    let closeButton: AnimatedButton = {
        let b = AnimatedButton()
        b.isFlat = true
        b.setTitle("X", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.heightAnchor.constraint(equalToConstant: 15).isActive = true
        b.widthAnchor.constraint(equalToConstant: 15).isActive = true
        b.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
        return b
    }()
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        
        if UIScreen.main.bounds.height > 667 {
            setupForLargerScreen()
        } else {
            setupForSmallerScreen()
        }
            
    }
    
    func setupForLargerScreen() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.9).isActive = true
        self.backgroundColor = .white
        self.roundCorners(cornerRadius: 10)
        
        self.addSubview(closeButton)
        self.addSubview(title)
        self.addSubview(info1)
        self.addSubview(SignUpButton)
        
        closeButton.anchor(top: self.topAnchor,
                           bottom: nil,
                           leading: nil,
                           trailing: self.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: -8))
        
        title.anchor(top: self.topAnchor,
                         bottom: nil, leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        info1.anchor(top: title.bottomAnchor,
                     bottom: nil,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
                
        SignUpButton.topAnchor.constraint(greaterThanOrEqualTo: info1.bottomAnchor, constant: 20).isActive = true
        SignUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        SignUpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    func setupForSmallerScreen() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.9).isActive = true
        self.backgroundColor = .white
        self.roundCorners(cornerRadius: 10)
        
        self.addSubview(closeButton)
        self.addSubview(title)
        self.addSubview(info1)
        self.addSubview(SignUpButton)
        
        closeButton.anchor(top: self.topAnchor,
                           bottom: nil,
                           leading: nil,
                           trailing: self.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: -8))
        
        title.anchor(top: self.topAnchor,
                         bottom: nil, leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        info1.anchor(top: title.bottomAnchor,
                     bottom: nil,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
                
        SignUpButton.topAnchor.constraint(greaterThanOrEqualTo: info1.bottomAnchor, constant: 20).isActive = true
        SignUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        SignUpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func dismiss(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            sender.transform = .identity
        } completion: { (_) in
            self.delegate?.dismiss()
        }
    }
    
    @objc func dismissToWebsite(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            sender.transform = .identity
        } completion: { (_) in
            self.delegate?.dismiss()
            if let url = URL(string: "https://www.elenarenglish.com/success") {
                UIApplication.shared.open(url)
            }
        }
    }
}
