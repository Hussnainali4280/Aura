//
//  FlashcardsPopUpView.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/26/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class FlashcardsPopUpView: UIView {

    let blackView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0, alpha: 0.7)
        return v
    }()
    
    let container: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.roundCorners(cornerRadius: 10)
        return v
    }()
    
    let mainTitle: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Flashcards", comment: "flashcards for studying")
        l.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textColor = K.DesignColors.primary
        return l
    }()
    
    let subTitle: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Studying Made Easy", comment: "")
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textColor = K.DesignColors.lightVariant
        return l
    }()
    
    let featuresHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Features", comment: "features that for example a course contains (ex. 10 hours of videos)")
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.textAlignment = .left
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        return l
    }()
    
    let feature1: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("• Save flashcards with the touch\n   of a button!", comment: "")
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let feature2: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("• Create as many decks as you want!", comment: "decks of flashcards to study")
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let feature3: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("• Save as many flashcards as you\n   want to your decks!", comment: "")
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let feature4: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("• Study and test yourself to see\n   your improvement!", comment: "")
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let feature5: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("• Keep track of your study and testing\n   scores so you know what to focus on!", comment: "")
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let signUpLabel: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Create a free account to make your own personalized English HD Flashcard Decks", comment: "")
        
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textAlignment = .center
        l.textColor = K.DesignColors.primary
        l.numberOfLines = 0
        return l
    }()
    
    let doneButton: AnimatedButton = {
        
        let b = AnimatedButton()
        b.setTitle(NSLocalizedString("DONE", comment: ""), for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        b.tintColor = .white
        b.backgroundColor = K.DesignColors.primary
        return b
        
    }()
    
    let buttonBackground = UIView()
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        
        self.addSubview(blackView)
        self.addSubview(container)
        
        container.addSubview(mainTitle)
        container.addSubview(subTitle)
        container.addSubview(featuresHeader)
        container.addSubview(feature1)
        container.addSubview(feature2)
        container.addSubview(feature3)
        container.addSubview(feature4)
        container.addSubview(feature5)
        container.addSubview(signUpLabel)
        container.addSubview(buttonBackground)
        doneButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        
        blackView.anchor(top: self.topAnchor,
                         bottom: self.bottomAnchor,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil)
        
        if UIScreen.main.bounds.height > 736 {
            setConstraintsForLargerPhone()
        } else if UIScreen.main.bounds.height > 568 {
            setConstraintsForSmallerPhone()
        } else {
            setConstraintsForSmallestPhone()
        }
    }
    
    func setConstraintsForLargerPhone() {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
        
        mainTitle.anchor(top: container.topAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: -20))
        
        subTitle.anchor(top: mainTitle.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: -20))

        featuresHeader.anchor(top: subTitle.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 50, left: 30, bottom: 0, right: -30))
        
        feature1.anchor(top: featuresHeader.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 15, left: 40, bottom: 0, right: -20))
        
        feature2.anchor(top: feature1.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 15, left: 40, bottom: 0, right: -20))
        
        feature3.anchor(top: feature2.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 15, left: 40, bottom: 0, right: -20))
        
        feature4.anchor(top: feature3.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 15, left: 40, bottom: 0, right: -20))
        
        feature5.anchor(top: feature4.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 15, left: 40, bottom: 0, right: -20))
        
        signUpLabel.anchor(top: feature5.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 50, left: 10, bottom: 0, right: -10))
        
        buttonBackground.translatesAutoresizingMaskIntoConstraints = false
        buttonBackground.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        buttonBackground.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonBackground.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6).isActive = true
        buttonBackground.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -40).isActive = true
        buttonBackground.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 10)
        
        buttonBackground.addSubview(doneButton)
        doneButton.anchor(top: buttonBackground.topAnchor,
                          bottom: buttonBackground.bottomAnchor,
                          leading: buttonBackground.leadingAnchor,
                          trailing: buttonBackground.trailingAnchor,
                          height: nil,
                          width: nil)
        
        doneButton.roundCorners(cornerRadius: 10)
    }
    
    func setConstraintsForSmallerPhone() {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
        
        mainTitle.anchor(top: container.topAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        subTitle.anchor(top: mainTitle.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: -20))

        featuresHeader.anchor(top: subTitle.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: -30))
        
        feature1.anchor(top: featuresHeader.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        feature2.anchor(top: feature1.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        feature3.anchor(top: feature2.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        feature4.anchor(top: feature3.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        feature5.anchor(top: feature4.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        signUpLabel.anchor(top: feature5.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 30, left: 10, bottom: 0, right: -10))
        
        buttonBackground.translatesAutoresizingMaskIntoConstraints = false
        buttonBackground.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        buttonBackground.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonBackground.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6).isActive = true
        buttonBackground.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20).isActive = true
        buttonBackground.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 10)
        
        buttonBackground.addSubview(doneButton)
        doneButton.anchor(top: buttonBackground.topAnchor,
                          bottom: buttonBackground.bottomAnchor,
                          leading: buttonBackground.leadingAnchor,
                          trailing: buttonBackground.trailingAnchor,
                          height: nil,
                          width: nil)
        
        doneButton.roundCorners(cornerRadius: 10)
    }
    
    func setConstraintsForSmallestPhone() {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true

        mainTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        mainTitle.anchor(top: container.topAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        subTitle.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        subTitle.anchor(top: mainTitle.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: -20))

        featuresHeader.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        featuresHeader.anchor(top: subTitle.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
        feature1.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        feature1.anchor(top: featuresHeader.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        feature2.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        feature2.anchor(top: feature1.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        feature3.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        feature3.anchor(top: feature2.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        feature4.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        feature4.anchor(top: feature3.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        feature5.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        feature5.text = NSLocalizedString("• Keep track of your study\n   and testing scores so you\n   know what to focus on!", comment: "")
        feature5.anchor(top: feature4.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 40, bottom: 0, right: -20))
        
        signUpLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        signUpLabel.anchor(top: feature5.bottomAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: -10))
        
        buttonBackground.translatesAutoresizingMaskIntoConstraints = false
        buttonBackground.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        buttonBackground.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonBackground.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6).isActive = true
        buttonBackground.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20).isActive = true
        buttonBackground.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 10)
        
        buttonBackground.addSubview(doneButton)
        doneButton.anchor(top: buttonBackground.topAnchor,
                          bottom: buttonBackground.bottomAnchor,
                          leading: buttonBackground.leadingAnchor,
                          trailing: buttonBackground.trailingAnchor,
                          height: nil,
                          width: nil)
        
        doneButton.roundCorners(cornerRadius: 10)
    }
    
    @objc func dismiss() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
            self.alpha = 0
        } completion: { (_) in
            self.removeFromSuperview()
        }
    }

}
