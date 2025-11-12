//
//  TestResultPopUpView.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/19/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

protocol TestResultPopUpDelegate {
    func done()
    func restart()
}

class TestResultPopUpView: UIView {
    
    var delegate: TestResultPopUpDelegate?
    
    // MARK: - SubViews
    var scoreLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 46, weight: .bold)
        l.text = "100%"
        l.textColor = K.DesignColors.primary
        return l
    }()
    
    var mainLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.numberOfLines = 1
        l.text = NSLocalizedString("Great Job!", comment: "")
        l.textColor = K.DesignColors.purpleGrey
        l.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return l
    }()
    
    var subLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.numberOfLines = 0
        l.text = NSLocalizedString("You got a perfect score!", comment: "")
        l.textColor = K.DesignColors.purpleGrey
        l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return l
    }()
    
    var restartButton: AnimatedButton = {
        let b = AnimatedButton(frame: .zero)
        b.isFlat = true
        b.backgroundColor = K.DesignColors.primary
        b.tintColor = .white
        b.setTitle(NSLocalizedString("Restart", comment: "take test again"), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        b.addTarget(self, action: #selector(restart(_:)), for: .touchUpInside)
        return b
    }()
    
    var doneButton: AnimatedButton = {
        let b = AnimatedButton(frame: .zero)
        b.isFlat = true
        b.backgroundColor = K.DesignColors.primary
        b.tintColor = .white
        b.setTitle(NSLocalizedString("Done", comment: "finished, don't want to continue doing this"), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        b.addTarget(self, action: #selector(done(_:)), for: .touchUpInside)
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
    
    // MARK: - Setup
    func setup() {
        self.backgroundColor = .white
        self.roundCorners(cornerRadius: 10)
        
        self.addSubview(scoreLabel)
        self.addSubview(mainLabel)
        self.addSubview(subLabel)
        self.addSubview(restartButton)
        self.addSubview(doneButton)
        
        scoreLabel.anchor(top: self.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        
        mainLabel.anchor(top: scoreLabel.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        
        subLabel.anchor(top: mainLabel.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
        
        restartButton.anchor(top: subLabel.bottomAnchor,
                             bottom: nil,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: 40,
                             width: nil,
                             padding: UIEdgeInsets(top: 50, left: 30, bottom: 0, right: -30))
        
        doneButton.anchor(top: restartButton.bottomAnchor,
                          bottom: self.bottomAnchor,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: 40,
                             width: nil,
                             padding: UIEdgeInsets(top: 20, left: 30, bottom: -30, right: -30))
        
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
    }
    
    func setupLabelsFromScore(_ score: Double) {
        
        let percentText = String(format: "%.1f", score) + "%"
        scoreLabel.text = percentText
        
        if score == 100 {
            mainLabel.text = NSLocalizedString("Great Job!", comment: "")
            subLabel.text = NSLocalizedString("You got a perfect score!", comment: "")
        } else if score > 80 {
            mainLabel.text = NSLocalizedString("Awesome!", comment: "great score, good job, nice job, awesome job")
            subLabel.text = NSLocalizedString("Almost there", comment: "almost there as in you are close to mastering the words you tested yourself on")
        } else if score > 70 {
            mainLabel.text = NSLocalizedString("Nice!", comment: "nice job, you are improving but still not awesome yet")
            subLabel.text = NSLocalizedString("Keep up the good work!", comment: "")
        } else {
            mainLabel.text = NSLocalizedString("You got this!", comment: "you didn't do so well but I want to encourage you to keep trying")
            subLabel.text = NSLocalizedString("Keep studying", comment: "")
        }
        
    }
    
    // MARK: - Selector Functions
    @objc func restart(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
        } completion: { (_) in
            self.delegate?.restart()
        }
    }
    
    @objc func done(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
        } completion: { (_) in
            self.delegate?.done()
        }
    }
    
}
