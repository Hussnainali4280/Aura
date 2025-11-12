//
//  Page8_1.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/26/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page8_1: UIView {
    
    // MARK: - Subviews
    var mainHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Search Result Example", comment: "")
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
    
    var playView: UIView = {
        
        let b = UIView()
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "play.fill").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        button.roundCorners(cornerRadius: 15)
        
        b.translatesAutoresizingMaskIntoConstraints = false
        b.widthAnchor.constraint(equalToConstant: 30).isActive = true
        b.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        b.addSubview(button)
        button.anchor(top: b.topAnchor,
                      bottom: b.bottomAnchor,
                      leading: b.leadingAnchor,
                      trailing: b.trailingAnchor,
                      height: nil,
                      width: nil)
        
        b.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 18)
        
        return b
        
    }()
    
    var playText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Play: ", comment: "Refering to the play button that you press to start the audio"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Check your pronunciation by listening to the audio of a native speaker.", comment: ""))
        
        text1.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text2.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .bold), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        
        text1.append(text2)
        
        l.attributedText = text1
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var loopView: UIView = {
        
        let b = UIView()
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "repeat"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "repeat").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        button.roundCorners(cornerRadius: 15)
        
        b.translatesAutoresizingMaskIntoConstraints = false
        b.widthAnchor.constraint(equalToConstant: 30).isActive = true
        b.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        b.addSubview(button)
        button.anchor(top: b.topAnchor,
                      bottom: b.bottomAnchor,
                      leading: b.leadingAnchor,
                      trailing: b.trailingAnchor,
                      height: nil,
                      width: nil)
        
        b.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 18)
        
        return b
        
    }()
    
    var loopText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Repeat: ", comment: "repeat the audio over and over"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Play the audio once or hear it 5 times in a row to better listen and practice.", comment: ""))
        
        text1.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text2.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .bold), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        
        text1.append(text2)
        
        l.attributedText = text1
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var addFlashcardView: UIView = {
        
        let b = UIView()
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "plus"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "plus").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        button.roundCorners(cornerRadius: 15)
        
        b.translatesAutoresizingMaskIntoConstraints = false
        b.widthAnchor.constraint(equalToConstant: 30).isActive = true
        b.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        b.addSubview(button)
        button.anchor(top: b.topAnchor,
                      bottom: b.bottomAnchor,
                      leading: b.leadingAnchor,
                      trailing: b.trailingAnchor,
                      height: nil,
                      width: nil)
        
        b.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 18)
        
        return b
        
    }()
    
    var flashcardsText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Flashcards: ", comment: "flashcards for studying"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("With the click of a button, you can easily save this result as a flashcard to study later.", comment: ""))
        
        text1.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: text1.length))
        text2.addAttribute(.foregroundColor, value: UIColor.gray, range: .init(location: 0, length: text2.length))
        
        text1.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .bold), range: .init(location: 0, length: text1.length))
        text2.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: .init(location: 0, length: text2.length))
        
        text1.append(text2)
        
        l.attributedText = text1
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
    
    var reportErrorView: UIView = {
        
        let b = UIView()
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "pencil"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "pencil").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        button.roundCorners(cornerRadius: 15)
        
        b.translatesAutoresizingMaskIntoConstraints = false
        b.widthAnchor.constraint(equalToConstant: 30).isActive = true
        b.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        b.addSubview(button)
        button.anchor(top: b.topAnchor,
                      bottom: b.bottomAnchor,
                      leading: b.leadingAnchor,
                      trailing: b.trailingAnchor,
                      height: nil,
                      width: nil)
        
        b.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 18)
        
        return b
        
    }()
    
    var editText: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        
        let text1 = NSMutableAttributedString(string: NSLocalizedString("Edit: ", comment: "Edit the result of the colored word"))
        let text2 = NSMutableAttributedString(string: NSLocalizedString("Request an edit if you think there is an issue with the result.", comment: ""))
        
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
        self.addSubview(playView)
        self.addSubview(playText)
        self.addSubview(loopView)
        self.addSubview(loopText)
        self.addSubview(addFlashcardView)
        self.addSubview(flashcardsText)
        self.addSubview(reportErrorView)
        self.addSubview(editText)
        
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
        
        playView.anchor(top: resultCard.bottomAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: nil,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0))
        
        playText.anchor(top: playView.topAnchor,
                        bottom: nil,
                        leading: playView.trailingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        loopView.translatesAutoresizingMaskIntoConstraints = false
        loopView.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        loopView.topAnchor.constraint(equalTo: playView.bottomAnchor, constant: 30).isActive = true
        
        loopText.anchor(top: loopView.topAnchor,
                        bottom: nil,
                        leading: loopView.trailingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        addFlashcardView.translatesAutoresizingMaskIntoConstraints = false
        addFlashcardView.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        addFlashcardView.topAnchor.constraint(equalTo: loopView.bottomAnchor, constant: 30).isActive = true
        
        flashcardsText.anchor(top: addFlashcardView.topAnchor,
                              bottom: nil,
                              leading: addFlashcardView.trailingAnchor,
                              trailing: self.trailingAnchor,
                              height: nil,
                              width: nil,
                              padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        reportErrorView.translatesAutoresizingMaskIntoConstraints = false
        reportErrorView.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        reportErrorView.topAnchor.constraint(equalTo: addFlashcardView.bottomAnchor, constant: 44).isActive = true
        
        editText.anchor(top: reportErrorView.topAnchor,
                        bottom: nil,
                        leading: reportErrorView.trailingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
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
        
        playView.anchor(top: resultCard.bottomAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: nil,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0))
        
        playText.anchor(top: playView.topAnchor,
                        bottom: nil,
                        leading: playView.trailingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        loopView.translatesAutoresizingMaskIntoConstraints = false
        loopView.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        loopView.topAnchor.constraint(equalTo: playView.bottomAnchor, constant: 30).isActive = true
        
        loopText.anchor(top: loopView.topAnchor,
                        bottom: nil,
                        leading: loopView.trailingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        addFlashcardView.translatesAutoresizingMaskIntoConstraints = false
        addFlashcardView.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        addFlashcardView.topAnchor.constraint(equalTo: loopView.bottomAnchor, constant: 30).isActive = true
        
        flashcardsText.anchor(top: addFlashcardView.topAnchor,
                              bottom: nil,
                              leading: addFlashcardView.trailingAnchor,
                              trailing: self.trailingAnchor,
                              height: nil,
                              width: nil,
                              padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        reportErrorView.translatesAutoresizingMaskIntoConstraints = false
        reportErrorView.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        reportErrorView.topAnchor.constraint(equalTo: addFlashcardView.bottomAnchor, constant: 44).isActive = true
        
        editText.anchor(top: reportErrorView.topAnchor,
                        bottom: nil,
                        leading: reportErrorView.trailingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
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
        resultBackground.topAnchor.constraint(equalTo: mainHeader.bottomAnchor, constant: -55).isActive = true
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
        
        resultBackground.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        let playButton = playView.subviews[0] as! UIButton
        playButton.imageEdgeInsets = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        
        playView.anchor(top: resultCard.bottomAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: nil,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: -50, left: 30, bottom: 0, right: 0))
        
        playText.anchor(top: playView.topAnchor,
                        bottom: nil,
                        leading: playView.trailingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        let loopButton = loopView.subviews[0] as! UIButton
        loopButton.imageEdgeInsets = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        
        loopView.translatesAutoresizingMaskIntoConstraints = false
        loopView.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        loopView.topAnchor.constraint(equalTo: playView.bottomAnchor, constant: 30).isActive = true
        
        loopText.anchor(top: loopView.topAnchor,
                        bottom: nil,
                        leading: loopView.trailingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        let addFlashcardButton = addFlashcardView.subviews[0] as! UIButton
        addFlashcardButton.imageEdgeInsets = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        
        addFlashcardView.translatesAutoresizingMaskIntoConstraints = false
        addFlashcardView.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        addFlashcardView.topAnchor.constraint(equalTo: loopView.bottomAnchor, constant: 30).isActive = true
        
        flashcardsText.anchor(top: addFlashcardView.topAnchor,
                              bottom: nil,
                              leading: addFlashcardView.trailingAnchor,
                              trailing: self.trailingAnchor,
                              height: nil,
                              width: nil,
                              padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
        
        let reportErrorButton = reportErrorView.subviews[0] as! UIButton
        reportErrorButton.imageEdgeInsets = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        
        reportErrorView.translatesAutoresizingMaskIntoConstraints = false
        reportErrorView.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        reportErrorView.topAnchor.constraint(equalTo: addFlashcardView.bottomAnchor, constant: 44).isActive = true
        
        editText.anchor(top: reportErrorView.topAnchor,
                        bottom: nil,
                        leading: reportErrorView.trailingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -30))
    }
    
}

