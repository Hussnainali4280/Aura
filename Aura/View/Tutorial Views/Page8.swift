//
//  Page8.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/23/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page8: UIView {
    
    // MARK: - Subviews
    var mainHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Search Result Example", comment: "Below is an example of what a search result will look like")
        l.numberOfLines = 1
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    let resultCard: ResultCardView = {
        
        let coloringResult = WordColoringManager.shared.colorWord(word: "happy", ipa: "hæpi")
        let result = ColorResultModel(attributedText: coloringResult.0, audioString: "", ipa: "hæpi", isColored: coloringResult.1)
        let soundItOutColors = createButtons(coloringResult.0)
        
        let resultCard = ResultCardView(frame: .zero,
                                        results: [result],
                                        bottomLabelText: "happy",
                                        soundItOutColors: soundItOutColors,
                                        delegate: nil,
                                        isFlashcard: false)
        
        resultCard.addFlashcardButton.isEnabled = false
        resultCard.reportErrorButton.isEnabled = false
        
        return resultCard
        
    }()
    
    let resultBackground = UIView()
    
    let soundBox: UIView = {
        
        let b = UIView()
        
        let v = UIView()
        v.backgroundColor = K.Colors.red
        v.roundCorners(cornerRadius: 4)
        
        b.addSubview(v)
        v.anchor(top: b.topAnchor,
                 bottom: b.bottomAnchor,
                 leading: b.leadingAnchor,
                 trailing: b.trailingAnchor,
                 height: nil,
                 width: nil)
        
        b.translatesAutoresizingMaskIntoConstraints = false
        b.widthAnchor.constraint(equalToConstant: 30).isActive = true
        b.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        b.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 4)
        
        return b
    }()
    
    var soundText1: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Sound it out: ", comment: "Sound out the word"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Need help sounding a word out? Tap these boxes to hear the sound of the color corresponding to the associated letters.", comment: ""))
        
        text1.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text2.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .bold), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        
        text1.append(text2)
        
        l.attributedText = text1
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var letterLabel: UILabel = {
        let l = UILabel()
        l.text = "H"
        l.numberOfLines = 1
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var soundText2: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Sound it out: ", comment: "Sound out the word"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("You may tap the letter as well to hear its corresponding sound.", comment: ""))
        
        text1.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text2.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .bold), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        
        text1.append(text2)
        
        l.attributedText = text1
        l.setContentCompressionResistancePriority(.required, for: .vertical)
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
        
        self.addSubview(mainHeader)
        self.addSubview(resultBackground)
        self.addSubview(soundBox)
        self.addSubview(soundText1)
        self.addSubview(letterLabel)
        self.addSubview(soundText2)
                
        if UIScreen.main.bounds.height > 736 {
            setConstraintsForLargerPhone()
        } else if UIScreen.main.bounds.height > 568 {
            setConstraintsForSmallerPhone()
        } else {
            setConstraintsForSmallestPhone()
        }
        
    }
    
    func setConstraintsForLargerPhone() {
        mainHeader.anchor(top: self.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 70, left: 30, bottom: 0, right: -30))
        
        resultBackground.translatesAutoresizingMaskIntoConstraints = false
        resultBackground.topAnchor.constraint(equalTo: mainHeader.bottomAnchor, constant: -10).isActive = true
        resultBackground.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        resultBackground.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        
        resultBackground.addSubview(resultCard)
        resultCard.anchor(top: resultBackground.topAnchor,
                          bottom: resultBackground.bottomAnchor,
                          leading: resultBackground.leadingAnchor,
                          trailing: resultBackground.trailingAnchor,
                          height: nil,
                          width: nil)
        
        resultBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 10)
        resultCard.addFlashcardBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 30)
        resultCard.loopBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        resultCard.playBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        resultCard.reportErrorBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        
        resultBackground.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        soundBox.anchor(top: resultCard.bottomAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: nil,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0))
        
        soundText1.anchor(top: soundBox.topAnchor,
                          bottom: nil,
                          leading: soundBox.trailingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.centerXAnchor.constraint(equalTo: soundBox.centerXAnchor).isActive = true
        letterLabel.topAnchor.constraint(equalTo: soundText1.bottomAnchor, constant: 30).isActive = true
        
        soundText2.anchor(top: letterLabel.topAnchor,
                          bottom: nil,
                          leading: letterLabel.trailingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: -30))
    }
    
    func setConstraintsForSmallerPhone() {
        mainHeader.anchor(top: self.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
        
        resultBackground.translatesAutoresizingMaskIntoConstraints = false
        resultBackground.topAnchor.constraint(equalTo: mainHeader.bottomAnchor, constant: -10).isActive = true
        resultBackground.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        resultBackground.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        
        resultBackground.addSubview(resultCard)
        resultCard.anchor(top: resultBackground.topAnchor,
                          bottom: resultBackground.bottomAnchor,
                          leading: resultBackground.leadingAnchor,
                          trailing: resultBackground.trailingAnchor,
                          height: nil,
                          width: nil)
        
        resultBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 10)
        resultCard.addFlashcardBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 30)
        resultCard.loopBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        resultCard.playBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        resultCard.reportErrorBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        
        resultBackground.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        soundBox.anchor(top: resultCard.bottomAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: nil,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0))
        
        soundText1.anchor(top: soundBox.topAnchor,
                          bottom: nil,
                          leading: soundBox.trailingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.centerXAnchor.constraint(equalTo: soundBox.centerXAnchor).isActive = true
        letterLabel.topAnchor.constraint(equalTo: soundText1.bottomAnchor, constant: 30).isActive = true
        
        soundText2.anchor(top: letterLabel.topAnchor,
                          bottom: nil,
                          leading: letterLabel.trailingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: -30))
    }
    
    func setConstraintsForSmallestPhone() {
        mainHeader.anchor(top: self.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
        
        resultBackground.translatesAutoresizingMaskIntoConstraints = false
        resultBackground.topAnchor.constraint(equalTo: mainHeader.bottomAnchor, constant: -35).isActive = true
        resultBackground.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        resultBackground.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        
        resultBackground.addSubview(resultCard)
        resultCard.anchor(top: resultBackground.topAnchor,
                          bottom: resultBackground.bottomAnchor,
                          leading: resultBackground.leadingAnchor,
                          trailing: resultBackground.trailingAnchor,
                          height: nil,
                          width: nil)
        
        resultBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 10)
        resultCard.addFlashcardBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 30)
        resultCard.loopBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        resultCard.playBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        resultCard.reportErrorBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        
        resultBackground.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        soundBox.anchor(top: resultCard.bottomAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: nil,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: -30, left: 30, bottom: 0, right: 0))
        
        soundText1.anchor(top: soundBox.topAnchor,
                          bottom: nil,
                          leading: soundBox.trailingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.centerXAnchor.constraint(equalTo: soundBox.centerXAnchor).isActive = true
        letterLabel.topAnchor.constraint(equalTo: soundText1.bottomAnchor, constant: 10).isActive = true
        
        soundText2.anchor(top: letterLabel.topAnchor,
                          bottom: nil,
                          leading: letterLabel.trailingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 4, left: 20, bottom: 0, right: -30))
    }
    
}
