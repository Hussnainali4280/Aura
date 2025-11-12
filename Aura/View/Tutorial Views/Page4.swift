//
//  Page4.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/22/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page4: UIView {
    
    var sounds = ["BOT", "BUT", "BET", "BIT", "BAIT", "BAT", "BEAT"]
    
    // MARK: - Subviews
    var questionHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Let's look at the word \'banana\'", comment: "Let's take for example the word banana")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return l
    }()
    
    var questionText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Question: ", comment: "Informing that there is a question below it"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Which sound from below does the\nunderlined \'a\' in \'banana\' make? Drag the \'a\'\nand drop it in the circle below to check your\nanswer. Tap the \'a\' below if you need to hear\nthe sound.", comment: ""))
        
        text1.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text2.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .bold), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        
        
        text1.append(text2)
        
        l.attributedText = text1
        
        return l
    }()
    
    var bananaLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        l.textAlignment = .center
        
        let text1 = NSMutableAttributedString(string: "banana")
        text1.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: .init(location: 3, length: 1))
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 40, weight: .bold), range: .init(location: 0, length: text1.length))
        l.attributedText = text1
        
        return l
    }()
        
    var answerLabel: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Answer:", comment: "")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return l
    }()
    
    var answerCircle: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.heightAnchor.constraint(equalToConstant: 40).isActive = true
        background.widthAnchor.constraint(equalToConstant: 40).isActive = true
        background.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 20)
        
        let b = AnimatedButton()
        b.setTitle("", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .white
        background.addSubview(b)
        b.anchor(top: background.topAnchor,
                 bottom: background.bottomAnchor,
                 leading: background.leadingAnchor,
                 trailing: background.trailingAnchor,
                 height: nil,
                 width: nil)
        b.roundCorners(cornerRadius: 20)
        
        return background
    }()
    
    var solutionLabel: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Try Again", comment: "You got the question wrong, try again")
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        l.textColor = K.DesignColors.error
        return l
    }()
    
    var buttons: [UIView] = {
        
        var arr = [UIView]()
        
        for i in 0...6 {
            let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.heightAnchor.constraint(equalToConstant: 40).isActive = true
            background.widthAnchor.constraint(equalToConstant: 40).isActive = true
            background.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 20)
            background.isUserInteractionEnabled = true
            background.tag = i
            
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
            
            arr.append(background)
        }
        return arr
        
    }()
    
    var buttonOrigin: CGPoint!
    
    let container = UIView()
    
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

        // Set View Size
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        
        // Add The 7 Sounds of 'a' Buttons
        if UIScreen.main.bounds.width > 375 && UIScreen.main.bounds.height > 736 {
            addButtonsForLargerPhones()
        } else if UIScreen.main.bounds.width > 320 {
            addButtonsForSmallerPhones()
        } else {
            addButtonsForSmallestPhones()
        }
        
        // Add The Text Labels
        self.addSubview(questionHeader)
        self.addSubview(bananaLabel)
        self.addSubview(questionText)
        self.addSubview(solutionLabel)
        
        if UIScreen.main.bounds.height > 736 {
            setConstraintsForLargerPhones()
        } else if UIScreen.main.bounds.height > 568 {
            setConstraintsForSmallerPhones()
        } else {
            setConstraintsForSmallestPhones()
        }
                
        solutionLabel.alpha = 0
        
    }
    
    func addButtonsForLargerPhones() {
        self.addSubview(buttons[0])
        buttons[0].centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        buttons[0].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        buttons[0].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[1])
        buttons[1].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[1].trailingAnchor.constraint(equalTo: buttons[0].leadingAnchor,constant: -15).isActive = true
        buttons[1].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[2])
        buttons[2].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[2].trailingAnchor.constraint(equalTo: buttons[1].leadingAnchor,constant: -15).isActive = true
        buttons[2].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[3])
        buttons[3].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[3].trailingAnchor.constraint(equalTo: buttons[2].leadingAnchor,constant: -15).isActive = true
        buttons[3].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[4])
        buttons[4].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[4].leadingAnchor.constraint(equalTo: buttons[0].trailingAnchor,constant: 15).isActive = true
        buttons[4].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[5])
        buttons[5].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[5].leadingAnchor.constraint(equalTo: buttons[4].trailingAnchor,constant: 15).isActive = true
        buttons[5].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[6])
        buttons[6].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[6].leadingAnchor.constraint(equalTo: buttons[5].trailingAnchor,constant: 15).isActive = true
        buttons[6].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
    }
    
    func addButtonsForSmallerPhones() {
        // Add The 7 Sounds of 'a' Buttons
        self.addSubview(buttons[0])
        buttons[0].centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        buttons[0].centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 50).isActive = true
        buttons[0].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[1])
        buttons[1].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[1].trailingAnchor.constraint(equalTo: buttons[0].leadingAnchor,constant: -10).isActive = true
        buttons[1].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[2])
        buttons[2].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[2].trailingAnchor.constraint(equalTo: buttons[1].leadingAnchor,constant: -10).isActive = true
        buttons[2].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[3])
        buttons[3].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[3].trailingAnchor.constraint(equalTo: buttons[2].leadingAnchor,constant: -10).isActive = true
        buttons[3].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[4])
        buttons[4].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[4].leadingAnchor.constraint(equalTo: buttons[0].trailingAnchor,constant: 10).isActive = true
        buttons[4].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[5])
        buttons[5].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[5].leadingAnchor.constraint(equalTo: buttons[4].trailingAnchor,constant: 10).isActive = true
        buttons[5].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[6])
        buttons[6].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[6].leadingAnchor.constraint(equalTo: buttons[5].trailingAnchor,constant: 10).isActive = true
        buttons[6].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
    }
    
    func addButtonsForSmallestPhones() {
        // Add The 7 Sounds of 'a' Buttons
        self.addSubview(buttons[0])
        buttons[0].centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        buttons[0].centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 60).isActive = true
        buttons[0].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[1])
        buttons[1].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[1].trailingAnchor.constraint(equalTo: buttons[0].leadingAnchor,constant: -4).isActive = true
        buttons[1].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[2])
        buttons[2].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[2].trailingAnchor.constraint(equalTo: buttons[1].leadingAnchor,constant: -4).isActive = true
        buttons[2].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[3])
        buttons[3].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[3].trailingAnchor.constraint(equalTo: buttons[2].leadingAnchor,constant: -4).isActive = true
        buttons[3].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[4])
        buttons[4].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[4].leadingAnchor.constraint(equalTo: buttons[0].trailingAnchor,constant: 4).isActive = true
        buttons[4].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[5])
        buttons[5].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[5].leadingAnchor.constraint(equalTo: buttons[4].trailingAnchor,constant: 4).isActive = true
        buttons[5].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
        
        self.addSubview(buttons[6])
        buttons[6].centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        buttons[6].leadingAnchor.constraint(equalTo: buttons[5].trailingAnchor,constant: 4).isActive = true
        buttons[6].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panItem(_:))))
    }
    
    func setConstraintsForLargerPhones() {
        questionText.translatesAutoresizingMaskIntoConstraints = false
        questionText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionText.bottomAnchor.constraint(equalTo: buttons[0].topAnchor, constant: -50).isActive = true
        
        bananaLabel.translatesAutoresizingMaskIntoConstraints = false
        bananaLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bananaLabel.bottomAnchor.constraint(equalTo: questionText.topAnchor, constant: -50).isActive = true
        
        questionHeader.translatesAutoresizingMaskIntoConstraints = false
        questionHeader.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionHeader.bottomAnchor.constraint(equalTo: bananaLabel.topAnchor, constant: -50).isActive = true
        
        container.addSubview(answerLabel)
        container.addSubview(answerCircle)
        
        answerLabel.anchor(top: container.topAnchor,
                           bottom: container.bottomAnchor,
                           leading: container.leadingAnchor,
                           trailing: answerCircle.leadingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20))
        
        answerCircle.centerYAnchor.constraint(equalTo: answerLabel.centerYAnchor).isActive = true
        answerCircle.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -20).isActive = true
        container.topAnchor.constraint(equalTo: buttons[0].bottomAnchor, constant: 100).isActive = true
        
        solutionLabel.anchor(top: container.bottomAnchor,
                             bottom: nil,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: 60,
                             width: nil,
                             padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
    }
    
    func setConstraintsForSmallerPhones() {
        questionText.translatesAutoresizingMaskIntoConstraints = false
        questionText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionText.bottomAnchor.constraint(equalTo: buttons[0].topAnchor, constant: -50).isActive = true
        
        bananaLabel.translatesAutoresizingMaskIntoConstraints = false
        bananaLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bananaLabel.bottomAnchor.constraint(equalTo: questionText.topAnchor, constant: -50).isActive = true
        
        questionHeader.translatesAutoresizingMaskIntoConstraints = false
        questionHeader.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionHeader.bottomAnchor.constraint(equalTo: bananaLabel.topAnchor, constant: -50).isActive = true
        
        container.addSubview(answerLabel)
        container.addSubview(answerCircle)
        
        answerLabel.anchor(top: container.topAnchor,
                           bottom: container.bottomAnchor,
                           leading: container.leadingAnchor,
                           trailing: answerCircle.leadingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20))
        
        answerCircle.centerYAnchor.constraint(equalTo: answerLabel.centerYAnchor).isActive = true
        answerCircle.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -20).isActive = true
        container.topAnchor.constraint(equalTo: buttons[0].bottomAnchor, constant: 60).isActive = true
        
        solutionLabel.anchor(top: container.bottomAnchor,
                             bottom: nil,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: 60,
                             width: nil,
                             padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
    }
    
    func setConstraintsForSmallestPhones() {
        
        questionText.translatesAutoresizingMaskIntoConstraints = false
        questionText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionText.bottomAnchor.constraint(equalTo: buttons[0].topAnchor, constant: -40).isActive = true
        
        bananaLabel.translatesAutoresizingMaskIntoConstraints = false
        bananaLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bananaLabel.bottomAnchor.constraint(equalTo: questionText.topAnchor, constant: -40).isActive = true
        
        questionHeader.translatesAutoresizingMaskIntoConstraints = false
        questionHeader.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionHeader.bottomAnchor.constraint(equalTo: bananaLabel.topAnchor, constant: -40).isActive = true
        
        container.addSubview(answerLabel)
        container.addSubview(answerCircle)
        
        answerLabel.anchor(top: container.topAnchor,
                           bottom: container.bottomAnchor,
                           leading: container.leadingAnchor,
                           trailing: answerCircle.leadingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20))
        
        answerCircle.centerYAnchor.constraint(equalTo: answerLabel.centerYAnchor).isActive = true
        answerCircle.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -20).isActive = true
        container.topAnchor.constraint(equalTo: buttons[0].bottomAnchor, constant: 50).isActive = true
        
        solutionLabel.anchor(top: container.bottomAnchor,
                             bottom: nil,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: 60,
                             width: nil,
                             padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        questionHeader.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Question: ", comment: "Informing that there is a question below it"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Which sound from below does the\nunderlined \'a\' in \'banana\' make? Drag the \'a\'\nand drop it in the circle below to check your\nanswer. Tap the \'a\' below if you need to hear\nthe sound.", comment: ""))
        
        text1.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text2.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .bold), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 13, weight: .regular), range: .init(location: 0, length: text2.length))
        
        
        text1.append(text2)
        
        questionText.attributedText = text1
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
    
    @objc func panItem(_ sender: UIPanGestureRecognizer) {
        
        let view = sender.view!
        self.bringSubviewToFront(view)
        let translation = sender.translation(in: self)
 
        switch sender.state {

        case .began:
            buttonOrigin = view.center
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            sender.setTranslation(.zero, in: self)
        case .changed:
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            sender.setTranslation(.zero, in: self)
        case .ended:
            if view.frame.intersects(container.convert(answerCircle.frame, to: self)) {
                if view.tag == 5 {
                    correct(view: view)
                    showSolutionLabel(isRight: true)
                } else {
                    reset(view)
                    showSolutionLabel(isRight: false)
                }
            } else {
                reset(view)
            }
        default:
            break
        }
    }
    
    func showSolutionLabel(isRight: Bool) {
        if isRight {
            solutionLabel.backgroundColor = UIColor(red: 0, green: 162/255, blue: 3/255, alpha: 0.3)
            solutionLabel.text = NSLocalizedString("Correct!", comment: "You got the answer to the question right")
            solutionLabel.textColor = UIColor(red: 0, green: 88/255, blue: 0, alpha: 1)
        } else {
            solutionLabel.backgroundColor = UIColor(red: 162/255, green: 0, blue: 0, alpha: 0.3)
            solutionLabel.text = NSLocalizedString("Try Again", comment: "You got the question wrong, try again")
            solutionLabel.textColor = K.DesignColors.error
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.solutionLabel.alpha = 1
            
        }, completion: nil)
        
    }
    
    func reset(_ v: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            v.center = self.buttonOrigin
            
        }, completion: nil)
    }
    
    func correct(view v: UIView) {
        
        for view in buttons {
            if let recognizers = view.gestureRecognizers {
                for recognizer in recognizers {
                    recognizer.isEnabled = false
                }
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            v.center = self.container.convert(self.answerCircle.center, to: self)
            self.answerCircle.layer.shadowColor = UIColor.clear.cgColor
            
        }, completion: nil)
        
    }
}

