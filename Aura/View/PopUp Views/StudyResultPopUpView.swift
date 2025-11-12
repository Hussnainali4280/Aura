//
//  StudyResultPopUpView.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/30/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class StudyResultPopUpView: UIView {
    
    var delegate: TestResultPopUpDelegate?
    var fontSize: CGFloat = {
        return UIScreen.main.bounds.width > 320 ? CGFloat(17) : CGFloat(13)
    }()
    
    // MARK: - SubViews
    var titleLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        l.text = NSLocalizedString("Summary", comment: "Summary of the results from the test you took")
        l.textColor = K.DesignColors.primary
        return l
    }()
    
    lazy var numCardsReviewedLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.numberOfLines = 1
        l.text = NSLocalizedString("Number of cards reviewed: ", comment: "")
        l.textColor = K.DesignColors.purpleGrey
        l.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        return l
    }()
    
    lazy var numberOfCardsCorrectLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.numberOfLines = 1
        l.text = NSLocalizedString("Number of right answers: ", comment: "")
        l.textColor = K.DesignColors.purpleGrey
        l.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        return l
    }()
    
    lazy var numberOfCardsWrongLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.numberOfLines = 1
        l.text = NSLocalizedString("Number of wrong answers: ", comment: "")
        l.textColor = K.DesignColors.purpleGrey
        l.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        return l
    }()
    
    lazy var scoreLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.numberOfLines = 1
        l.text = NSLocalizedString("Score: ", comment: "Test percentage score")
        l.textColor = K.DesignColors.purpleGrey
        l.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        return l
    }()
    
    var continueButton: AnimatedButton = {
        let b = AnimatedButton(frame: .zero)
        b.isFlat = true
        b.backgroundColor = K.DesignColors.primary
        b.tintColor = .white
        b.setTitle(NSLocalizedString("Continue", comment: "Continue studying the flashcards"), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        b.addTarget(self, action: #selector(restart(_:)), for: .touchUpInside)
        return b
    }()
    
    var doneButton: AnimatedButton = {
        let b = AnimatedButton(frame: .zero)
        b.isFlat = true
        b.backgroundColor = K.DesignColors.primary
        b.tintColor = .white
        b.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
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
        
        self.addSubview(titleLabel)
        self.addSubview(numCardsReviewedLabel)
        self.addSubview(numberOfCardsCorrectLabel)
        self.addSubview(numberOfCardsWrongLabel)
        self.addSubview(scoreLabel)
        self.addSubview(continueButton)
        self.addSubview(doneButton)
        
        titleLabel.anchor(top: self.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        
        numCardsReviewedLabel.anchor(top: titleLabel.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 50, left: 30, bottom: 0, right: -30))
        
        numberOfCardsCorrectLabel.anchor(top: numCardsReviewedLabel.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 8, left: 30, bottom: 0, right: -30))
        
        numberOfCardsWrongLabel.anchor(top: numberOfCardsCorrectLabel.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 8, left: 30, bottom: 0, right: -30))
        
        scoreLabel.anchor(top: numberOfCardsWrongLabel.bottomAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 8, left: 30, bottom: 0, right: -30))
        
        continueButton.anchor(top: scoreLabel.bottomAnchor,
                             bottom: nil,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: 40,
                             width: nil,
                             padding: UIEdgeInsets(top: 50, left: 30, bottom: 0, right: -30))
        
        doneButton.anchor(top: continueButton.bottomAnchor,
                          bottom: self.bottomAnchor,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: 40,
                             width: nil,
                             padding: UIEdgeInsets(top: 20, left: 30, bottom: -30, right: -30))
        
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
    }
    
    
    
    func setupLabelsFromScore(numReviewed: Int, numCorrect: Int) {
        
        numCardsReviewedLabel.text?.append("\(numReviewed)")
        numberOfCardsCorrectLabel.text?.append("\(numCorrect)")
        numberOfCardsWrongLabel.text?.append("\(numReviewed - numCorrect)")
        
        let score = Double(numCorrect) / Double(numReviewed) * 100.0
        let percentText = String(format: "%.1f", score) + "%"
        scoreLabel.text?.append(percentText)
        
        
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
