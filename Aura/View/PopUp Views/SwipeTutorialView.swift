//
//  SwipeTutorialView.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/30/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

protocol SwipeTutorialDelegate {
   func dismiss()
}

class SwipeTutorialView: UIView {
    let fontSize: CGFloat = UIScreen.main.bounds.height > 667 ? 17 : 15
    var delegate: SwipeTutorialDelegate?
    
    let title: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Directions", comment: "Instructions how to do this activity")
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 1
        return l
    }()
    
    lazy var info1: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Flip the flashcard by pressing the center button or tapping on the card.", comment: "Flip as in turn over the flashcard from front to back or back to front")
        l.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        l.numberOfLines = 0
        return l
    }()
    
    lazy var info2: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Press the ❌ button or swipe left if you got it wrong.", comment: "")
        l.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        l.numberOfLines = 0
        return l
    }()
    
    lazy var info3: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Press the ✅ button or swipe right if you got it right.", comment: "")
        l.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        l.numberOfLines = 0
        return l
    }()
    
    let iv: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "swipeTutorial")
        iv.contentMode = .scaleAspectFit
        iv.setContentHuggingPriority(.defaultLow, for: .vertical)
        return iv
    }()
    
    let okButton: AnimatedButton = {
        let b = AnimatedButton()
        b.isFlat = true
        b.setTitle(NSLocalizedString("OK", comment: "ok, I acknowledge the action (for example successfully signing out) that just happened. When I press ok, the alert will go away and I can continue doing what I am doing in the app"), for: .normal)
        b.backgroundColor = K.DesignColors.primary
        b.tintColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        b.heightAnchor.constraint(equalToConstant: 40).isActive = true
        b.widthAnchor.constraint(equalToConstant: 120).isActive = true
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
        self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.8).isActive = true
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.9).isActive = true
        self.backgroundColor = .white
        self.roundCorners(cornerRadius: 10)
        
        self.addSubview(title)
        self.addSubview(info1)
        self.addSubview(info2)
        self.addSubview(info3)
        self.addSubview(iv)
        self.addSubview(okButton)
        
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
        
        info2.anchor(top: info1.bottomAnchor,
                     bottom: nil,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        info3.anchor(top: info2.bottomAnchor,
                     bottom: nil,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        iv.anchor(top: info3.bottomAnchor,
                     bottom: nil,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        okButton.topAnchor.constraint(equalTo: iv.bottomAnchor, constant: 40).isActive = true
        okButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    func setupForSmallerScreen() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.8).isActive = true
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.9).isActive = true
        self.backgroundColor = .white
        self.roundCorners(cornerRadius: 10)
        
        self.addSubview(title)
        self.addSubview(info1)
        self.addSubview(info2)
        self.addSubview(info3)
        self.addSubview(iv)
        self.addSubview(okButton)
        
        title.anchor(top: self.topAnchor,
                         bottom: nil, leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20))
        
        info1.anchor(top: title.bottomAnchor,
                     bottom: nil,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20))
        
        info2.anchor(top: info1.bottomAnchor,
                     bottom: nil,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20))
        
        info3.anchor(top: info2.bottomAnchor,
                     bottom: nil,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20))
        
        iv.anchor(top: info3.bottomAnchor,
                     bottom: nil,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20))
        
        okButton.topAnchor.constraint(equalTo: iv.bottomAnchor, constant: 20).isActive = true
        okButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func dismiss(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            sender.transform = .identity
        } completion: { (_) in
            self.delegate?.dismiss()
        }
    }
    
}
