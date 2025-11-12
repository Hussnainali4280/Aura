//
//  ResultCard.swift
//  Aura
//
//  Created by Max Dolensky on 8/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation
import AMPopTip

// MARK: - Result Card Delegate Methods
protocol ResultCardDelegate {
    
    func presentDeckSelectionView()
    func presentReportErrorAlert(alert: UIAlertController)
    func goToLogin()
}

class ResultCardView: UIView {
    
    // MARK: - DATA
    var results = [ColorResultModel]()
    var bottomLabelText = ""
    var soundItOutColors = [(color: UIColor, ID: String, range: NSRange)]()
    
    // MARK: - INFO
    let popTip: PopTip =  {
        
        let popTip = PopTip()
        popTip.shouldDismissOnTap = true
        popTip.bubbleColor = .white
        popTip.borderColor = .black
        popTip.borderWidth = 1.0
        return popTip
        
    }()
    
    var prevRange: NSRange?
    var isFlashcard = false
    var delegate: ResultCardDelegate?
    
    // MARK: - SUBVIEWS
    var topContainer: UIView  = {
        
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    var bottomContainer: UIView  = {
        
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    var topStackView: UIStackView = {
        
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.backgroundColor = .white
        view.spacing = 10
        return view
        
    }()
    
    var bottomStackView: UIStackView = {
        
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .equalSpacing
        view.backgroundColor = .white
        view.spacing = 30
        return view
        
    }()
    
    var topLabel: UILabel = {
        
        let label = UILabel()
        label.clipsToBounds = false
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.baselineAdjustment = .none
        label.backgroundColor = .white

        return label
        
    }()
    
    var topLabelContainer: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    var soundItOutCollectionView: UICollectionView = {
        
        let cv = DynamicCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        cv.clipsToBounds = false
        return cv
        
    }()
    
    var lineDividerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .black
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        return view
    }()
    
    var bottomLabel: UILabel = {
        
        let label = UILabel()
        label.backgroundColor = .white
        return label
        
    }()
    
    let buttonStackView: UIStackView = {
        
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .equalSpacing
        view.backgroundColor = .white
        view.spacing = 18
        return view
        
    }()
    
    var loopButton: UIButton = {
        
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "repeat"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "repeat").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        button.contentMode = .center
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        
        button.widthAnchor.constraint(equalToConstant: 42).isActive = true
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        button.roundCorners(cornerRadius: 21)
        
        button.addTarget(self, action: #selector(loopButtonPressed(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        return button
        
    }()
    
    var playButton: UIButton = {
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "play.fill").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentMode = .center
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        
        button.widthAnchor.constraint(equalToConstant: 42).isActive = true
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        button.roundCorners(cornerRadius: 21)
        
        button.addTarget(self, action: #selector(playButtonPressed(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        return button
        
    }()
    
    var reportErrorButton: UIButton = {
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "pencil"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "pencil").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentMode = .center
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        
        button.widthAnchor.constraint(equalToConstant: 42).isActive = true
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        button.roundCorners(cornerRadius: 21)
        
        button.addTarget(self, action: #selector(reportErrorButtonPressed(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        return button
        
    }()
    
    var addFlashcardButton: UIButton = {
        
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "plus"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "plus").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        button.contentMode = .center
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        
        button.widthAnchor.constraint(equalToConstant: 42).isActive = true
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        button.roundCorners(cornerRadius: 21)
        
        button.addTarget(self, action: #selector(addFlashcardButtonPressed(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        return button
        
    }()
    
    let addFlashcardBackgroundView: UIView = {
        
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 42).isActive = true
        view.heightAnchor.constraint(equalToConstant: 42).isActive = true
        view.roundCorners(cornerRadius: 21)
        return view
        
    }()
    
    let loopBackgroundView: UIView = {
        
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 42).isActive = true
        view.heightAnchor.constraint(equalToConstant: 42).isActive = true
        view.roundCorners(cornerRadius: 21)
        return view
        
    }()
    
    let playBackgroundView: UIView = {
        
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 42).isActive = true
        view.heightAnchor.constraint(equalToConstant: 42).isActive = true
        view.roundCorners(cornerRadius: 21)
        return view
        
    }()
    
    let reportErrorBackgroundView: UIView = {
        
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 42).isActive = true
        view.heightAnchor.constraint(equalToConstant: 42).isActive = true
        view.roundCorners(cornerRadius: 21)
        return view
        
    }()
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(frame: CGRect, results: [ColorResultModel], bottomLabelText: String, soundItOutColors: [(color: UIColor, ID: String, range: NSRange)], delegate: ResultCardDelegate? = nil, isFlashcard: Bool = false) {
        
        self.init(frame: frame)
        
        self.results = results
        self.bottomLabelText = bottomLabelText
        self.soundItOutColors = soundItOutColors
        self.isFlashcard = isFlashcard
        self.delegate = delegate
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: - Setup
    func setupView() {
        
        self.backgroundColor = .white
        self.roundCorners(cornerRadius: 10)
        self.clipsToBounds = false
        
        // Configure Top Label
        let topAttributedText = NSMutableAttributedString()
        
        for i in 0..<results.count {
            
            topAttributedText.append(results[i].attributedText)
            
            if i != results.count - 1 {
                topAttributedText.append(NSAttributedString(string: " "))
            }
        }
        
        topLabel.attributedText = topAttributedText
        topLabel.configureBasedOnInput()
        topLabel.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(letterTapped(_:))))
        
        topLabelContainer.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.centerXAnchor.constraint(equalTo: topLabelContainer.centerXAnchor).isActive = true
        topLabel.topAnchor.constraint(equalTo: topLabelContainer.topAnchor).isActive = true
        topLabel.bottomAnchor.constraint(equalTo: topLabelContainer.bottomAnchor).isActive = true
        topLabel.leadingAnchor.constraint(greaterThanOrEqualTo: topLabelContainer.leadingAnchor).isActive = true
        topLabel.trailingAnchor.constraint(lessThanOrEqualTo: topLabelContainer.trailingAnchor, constant: -1).isActive = true
        
        // Configure Bottom Label
        bottomLabel.attributedText = NSAttributedString(string: bottomLabelText)
        bottomLabel.configureBottomLabel()
        
        // Setup Sound and Loop buttons
        loopBackgroundView.addSubview(loopButton)
        playBackgroundView.addSubview(playButton)
        
        loopButton.anchor(top: loopBackgroundView.topAnchor,
                           bottom: loopBackgroundView.bottomAnchor,
                           leading: loopBackgroundView.leadingAnchor,
                           trailing: loopBackgroundView.trailingAnchor,
                           height: nil,
                           width: nil)
        
        playButton.anchor(top: playBackgroundView.topAnchor,
                          bottom: playBackgroundView.bottomAnchor,
                          leading: playBackgroundView.leadingAnchor,
                          trailing: playBackgroundView.trailingAnchor,
                          height: nil,
                          width: nil)

        buttonStackView.addArrangedSubview(playBackgroundView)
        buttonStackView.addArrangedSubview(loopBackgroundView)
        
        // Add Flashcard Button to its Background View
        if !isFlashcard {
            
            addFlashcardBackgroundView.addSubview(addFlashcardButton)
            reportErrorBackgroundView.addSubview(reportErrorButton)
            
            addFlashcardButton.anchor(top: addFlashcardBackgroundView.topAnchor,
                                      bottom: addFlashcardBackgroundView.bottomAnchor,
                                      leading: addFlashcardBackgroundView.leadingAnchor,
                                      trailing: addFlashcardBackgroundView.trailingAnchor,
                                      height: nil,
                                      width: nil)
            
            reportErrorButton.anchor(top: reportErrorBackgroundView.topAnchor,
                              bottom: reportErrorBackgroundView.bottomAnchor,
                              leading: reportErrorBackgroundView.leadingAnchor,
                              trailing: reportErrorBackgroundView.trailingAnchor,
                              height: nil,
                              width: nil)
            
            buttonStackView.addArrangedSubview(addFlashcardBackgroundView)
            buttonStackView.addArrangedSubview(reportErrorBackgroundView)
        }
        
        // Add Stack Views to their containers
        topContainer.addSubview(topStackView)
        bottomContainer.addSubview(bottomStackView)
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor).isActive = true
        topStackView.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
        topStackView.topAnchor.constraint(greaterThanOrEqualTo: topContainer.topAnchor).isActive = true
        topStackView.bottomAnchor.constraint(lessThanOrEqualTo: topContainer.bottomAnchor).isActive = true
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor).isActive = true
        bottomStackView.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor).isActive = true
        bottomStackView.topAnchor.constraint(greaterThanOrEqualTo: bottomContainer.topAnchor).isActive = true
        bottomStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomContainer.bottomAnchor).isActive = true
        
        // Add Views to Self
        self.addSubview(topContainer)
        self.addSubview(lineDividerView)
        self.addSubview(bottomContainer)
        
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        topContainer.heightAnchor.constraint(equalTo: bottomContainer.heightAnchor).isActive = true
        
        lineDividerView.translatesAutoresizingMaskIntoConstraints = false
        lineDividerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        lineDividerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lineDividerView.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 20).isActive = true
        lineDividerView.bottomAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: -20).isActive = true
        
        topContainer.anchor(top: self.topAnchor,
                            bottom: nil,
                            leading: self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            height: nil,
                            width: nil,
                            padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        topStackView.addArrangedSubview(topLabelContainer)
        topStackView.addArrangedSubview(soundItOutCollectionView)
        
        bottomContainer.anchor(top: nil,
                               bottom: self.bottomAnchor,
                               leading: self.leadingAnchor,
                               trailing: self.trailingAnchor,
                               height: nil,
                               width: nil,
                               padding: UIEdgeInsets(top: 0, left: 20, bottom: -20, right: -20))
        
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(buttonStackView)
        
        // Setup Collection View
        setupCollectionView()
        
        // Hide Unecessary Views in Result Controller
        updateResultSubviewVisibilities()
        
        // Update Loop Button Color
        updateLoopColor()
        
    }
    
    func setupCollectionView() {
        
        soundItOutCollectionView.delegate = self
        soundItOutCollectionView.dataSource = self
        soundItOutCollectionView.register(SoundItOutCell.self, forCellWithReuseIdentifier: SoundItOutCell.identifier)
        soundItOutCollectionView.isScrollEnabled = false
    }
    
    func updateResultSubviewVisibilities() {
        
        if results.count == 1 {
            
            soundItOutCollectionView.isHidden = false
            
        }
            
        else {
                        
            soundItOutCollectionView.isHidden = true
            
        }
        
    }
    
    func updateLoopColor() {
        
        var isRepeat = false
        
        // Repeat Value Set Already
        if let repeatVal = UserDefaults.standard.object(forKey: K.UserDefaultKeys.isRepeat) as? String {
            
            isRepeat = repeatVal == "YES" ? true : false
            
        }
        
        // Repeat Value Not Set
        else {
            
            UserDefaults.standard.set("NO", forKey: K.UserDefaultKeys.isRepeat)
            
        }
        
        // Dark Button
        if isRepeat {
            
            DispatchQueue.main.async {
                self.loopButton.backgroundColor = K.DesignColors.primary
                self.loopButton.tintColor = .white
            }
            
        }
        
        // Light Button
        else {
            
            DispatchQueue.main.async {
                self.loopButton.backgroundColor = .white
                self.loopButton.tintColor = K.DesignColors.primary
            }
            
        }
        
    }
    
    //MARK: - Selector Functions
    
    @objc func reportErrorButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: NSLocalizedString("Request an Edit", comment: "request that we review a words coloring or translation and change it if neccessary"), message: NSLocalizedString("Please select the type of edit you wish to request regarding this result", comment: ""), preferredStyle: .alert)
        
        let translationAction = UIAlertAction(title: NSLocalizedString("Translation Edit", comment: "request we edit the translation"), style: .destructive) { (action) in
            
            let translationErr = TranslationError(englishText: self.topLabel.text!, nativeText: self.bottomLabel.text!)
            FirebaseManager.shared.writeTranslationError(translation: translationErr)
            
        }
        
        let colorAction = UIAlertAction(title: NSLocalizedString("Coloring Edit", comment: "request we edit the coloring of a word"), style: .destructive) { (action) in
            
            FirebaseManager.shared.writeColorError(text: self.topLabel.text!)
            
        }
        
        let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { (action) in
            return
        }
        
        alert.addAction(translationAction)
        alert.addAction(colorAction)
        alert.addAction(cancel)
        
        self.delegate?.presentReportErrorAlert(alert: alert)
    }
    
    @objc func playButtonPressed(_ sender: UIButton) {
        
        var numLoops = 0
        
        // Repeat Value Set Already
        if let repeatVal = UserDefaults.standard.object(forKey: K.UserDefaultKeys.isRepeat) as? String {
            
            numLoops = repeatVal == "YES" ? 4 : 0
            
        }
        
        // Repeat Value Not Set
        else {
            
            UserDefaults.standard.set("NO", forKey: K.UserDefaultKeys.isRepeat)
            
        }
        
        if TextToSpeechManager.shared.avPlayer != nil {
            
            if #available(iOS 13.0, *) {
                playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            } else {
                playButton.setImage(#imageLiteral(resourceName: "play.fill").withRenderingMode(.alwaysTemplate), for: .normal)
            }
            TextToSpeechManager.shared.avPlayer?.pause()
            TextToSpeechManager.shared.avPlayer = nil
            
        }
        
        else {
            
            TextToSpeechManager.shared.playAudio(of: topLabel.text!,numberOfTimes: numLoops, sender: self)
            if #available(iOS 13.0, *) {
                playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            } else {
                playButton.setImage(#imageLiteral(resourceName: "pause.fill").withRenderingMode(.alwaysTemplate), for: .normal)
            }
            
        }
        
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.5
        }
        
    }
    
    @objc func loopButtonPressed(_ sender: UIButton) {
        
        var isRepeat = false
        
        // Repeat Value Set Already
        if let repeatVal = UserDefaults.standard.object(forKey: K.UserDefaultKeys.isRepeat) as? String {
            
            isRepeat = repeatVal == "YES" ? true : false
            
        }
        
        // Repeat Value Not Set
        else {
            
            UserDefaults.standard.set("NO", forKey: K.UserDefaultKeys.isRepeat)
            
        }
        
        // Toggle Button Off
        if isRepeat {
            
            UserDefaults.standard.set("NO", forKey: K.UserDefaultKeys.isRepeat)
            
            DispatchQueue.main.async {
                self.loopButton.backgroundColor = .white
                self.loopButton.tintColor = K.DesignColors.primary
            }
            
        }
        
        // Toggle Button On
        else {
            
            UserDefaults.standard.set("YES", forKey: K.UserDefaultKeys.isRepeat)
            
            DispatchQueue.main.async {
                self.loopButton.backgroundColor = K.DesignColors.primary
                self.loopButton.tintColor = .white
            }
        }
        
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.5
        }
    }
    
    @objc func letterTapped(_ gesture: UITapGestureRecognizer) {
        
        // Get Letter Index and Color
        guard let index = gesture.indexForTapAttributedTextInLabel(label: self.topLabel) else { return }
        guard let color = topLabel.attributedText?.attribute(.foregroundColor, at: index, effectiveRange: nil) as? UIColor else { return }
        
        // If it's a wildcard show pop tip
        if let linkNumber = topLabel.attributedText?.attribute(.linkNumber, at: index, effectiveRange: nil) as? String {
            
            if color == K.Colors.yellow {
                showPopTip(range: NSRange(location: index, length: 1), linkString: linkNumber)
            }
            
        }
        
        // Play Sound
        if let id = topLabel.attributedText?.attribute(.id, at: index, effectiveRange: nil) as? String {
            
            playSound(ipaLetter: id, color: color)
            
        }
        
    }
    
    @objc func soundItOutButtonPressed(_ sender: SoundButton) {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            sender.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            sender.superview?.layer.shadowOpacity = 0.5
            
        }) { (completion) in
            
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
            
        }
        
        switch sender.title(for: .normal) {
        case "i":
            Utilities.shared.playSound("BEAT")
        case "ɪ":
            Utilities.shared.playSound("BIT")
        case "ɑ","ɔ":
            Utilities.shared.playSound("BOT")
        case "u":
            Utilities.shared.playSound("BOOT")
        case "ʊ":
            Utilities.shared.playSound("BOOK")
        case "p":
            Utilities.shared.playSound("P")
        case "v":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "V")
                }
            } else { Utilities.shared.playSound("V") }
            
        case "aɪ":
            Utilities.shared.playSound("BITE")
        case "əl","oʊl","ʊl":
            Utilities.shared.playSound("DarkL")
        case "ɪr" where sender.backgroundColor == K.Colors.seaBlue:
            Utilities.shared.playSound("BEAT")
        case "ɪr" where sender.backgroundColor == K.Colors.darkGrey:
            Utilities.shared.playSound("DarkR")
        case "ks":
            Utilities.shared.playSound("KS")
        case "ɔɪ":
            Utilities.shared.playSound("BOYD")
        case "weɪ":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "WEI")
                }
            } else { Utilities.shared.playSound("WEI") }
            
        case "j":
            Utilities.shared.playSound("Y")
        case "n":
            Utilities.shared.playSound("N")
        case "t":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "T")
                }
            } else { Utilities.shared.playSound("T")}
            
        case "æŋ" where sender.backgroundColor == K.Colors.pink:
            Utilities.shared.playSound("BAIT")
        case "æŋ" where sender.backgroundColor == K.Colors.darkGrey:
            Utilities.shared.playSound("NSoft")
        case "eɪ":
            Utilities.shared.playSound("BAIT")
        case "ər","ʊr":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "DarkR")
                }
            } else { Utilities.shared.playSound("DarkR") }
            
        case "ɪŋ" where sender.backgroundColor == K.Colors.seaBlue:
            Utilities.shared.playSound("BEAT")
        case "ɪŋ" where sender.backgroundColor == K.Colors.darkGrey:
            Utilities.shared.playSound("NSoft")
        case "h":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "H")
                }
            } else { Utilities.shared.playSound("H") }
            
        case "m":
            Utilities.shared.playSound("M")
        case "ð":
            Utilities.shared.playSound("TH")
        case "b":
            Utilities.shared.playSound("B")
        case "dʒ":
            Utilities.shared.playSound("JOKE")
        case "ɡz":
            Utilities.shared.playSound("GZ")
        case "ju":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "YOU")
                }
            } else { Utilities.shared.playSound("YOU") }
            
        case "oʊ":
            Utilities.shared.playSound("BOAT")
        case "tʃ":
            Utilities.shared.playSound("CHOKE")
        case "f":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "F")
                }
            } else { Utilities.shared.playSound("F") }
            
        case "l":
            Utilities.shared.playSound("L")
        case "d":
            Utilities.shared.playSound("D")
        case "θ":
            Utilities.shared.playSound("THunvoiced")
        case "ɑr" where sender.backgroundColor == K.Colors.green:
            Utilities.shared.playSound("BOT")
        case "ɑr" where sender.backgroundColor == K.Colors.darkGrey:
            Utilities.shared.playSound("DarkR")
        case "ɛr" where sender.backgroundColor == K.Colors.darkGreen:
            Utilities.shared.playSound("BET")
        case "ɛr" where sender.backgroundColor == K.Colors.darkGrey:
            Utilities.shared.playSound("DarkR")
        case "kw":
            Utilities.shared.playSound("Q")
        case "ɔr" where sender.backgroundColor == K.Colors.purple:
            Utilities.shared.playSound("BOAT")
        case "ɔr" where sender.backgroundColor == K.Colors.darkGrey:
            Utilities.shared.playSound("DarkR")
        case "ʔ":
            break
        case "ɡ":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "G")
                }
            } else { Utilities.shared.playSound("G") }
            
        case "r":
            Utilities.shared.playSound("R")
        case "z":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "Z")
                }
            } else { Utilities.shared.playSound("Z") }
            
        case "aʊ":
            Utilities.shared.playSound("BOUT")
        case "ɛŋ" where sender.backgroundColor == K.Colors.pink:
            Utilities.shared.playSound("BAIT")
        case "ɛŋ" where sender.backgroundColor == K.Colors.darkGrey:
            Utilities.shared.playSound("NSoft")
        case "jə":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "YUH")
                }
            } else { Utilities.shared.playSound("YUH") }
            
        case "kʃ":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "KSH")
                }
            } else { Utilities.shared.playSound("KSH") }
            
        case "wə":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "WUH")
                }
            } else { Utilities.shared.playSound("WUH") }
            
        case "wɪ":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "WIH")
                }
            } else { Utilities.shared.playSound("WIH") }
            
        case "k":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "K")
                }
            } else { Utilities.shared.playSound("K") }
            
        case "ŋ":
            Utilities.shared.playSound("NSoft")
        case "s":
            Utilities.shared.playSound("S")
        case "ʃ":
            Utilities.shared.playSound("MISSION")
        case "w":
            if sender.backgroundColor == K.Colors.yellow {
                if let range = sender.wildRange,
                    let wildCardNumber = topLabel.attributedText?.attribute(.linkNumber, at: range.location, effectiveRange: nil) as? String
                {
                    showPopTip(range: range, linkString: wildCardNumber, audioString: "W")
                }
            } else { Utilities.shared.playSound("W") }
        case "ʒ":
            Utilities.shared.playSound("VISION")
        case "æ":
            Utilities.shared.playSound("BAT")
        case "ə":
            Utilities.shared.playSound("BUT")
        case "ɛ":
            Utilities.shared.playSound("BET")
        default:
            break
        }
    }
    
    func playSound(ipaLetter: String, color: UIColor) {
        
        if color == K.Colors.lightGrey {
            return
        }
        
        switch ipaLetter {
        case "i":
            Utilities.shared.playSound("BEAT")
        case "ɪ":
            Utilities.shared.playSound("BIT")
        case "ɑ","ɔ":
            Utilities.shared.playSound("BOT")
        case "u":
            Utilities.shared.playSound("BOOT")
        case "ʊ":
            Utilities.shared.playSound("BOOK")
        case "p":
            Utilities.shared.playSound("P")
        case "v":
            Utilities.shared.playSound("V")
        case "aɪ":
            Utilities.shared.playSound("BITE")
        case "əl","oʊl","ʊl":
            Utilities.shared.playSound("DarkL")
        case "ɪr" where color == K.Colors.seaBlue:
            Utilities.shared.playSound("BEAT")
        case "ɪr" where color == K.Colors.darkGrey:
            Utilities.shared.playSound("DarkR")
        case "ks":
            Utilities.shared.playSound("KS")
        case "ɔɪ":
            Utilities.shared.playSound("BOYD")
        case "weɪ":
            Utilities.shared.playSound("WEI")
        case "j":
            Utilities.shared.playSound("Y")
        case "n":
            Utilities.shared.playSound("N")
        case "t":
            Utilities.shared.playSound("T")
        case "æŋ" where color == K.Colors.pink:
            Utilities.shared.playSound("BAIT")
        case "æŋ" where color == K.Colors.darkGrey:
            Utilities.shared.playSound("NSoft")
        case "eɪ":
            Utilities.shared.playSound("BAIT")
        case "ər","ʊr":
            Utilities.shared.playSound("DarkR")
        case "ɪŋ" where color == K.Colors.seaBlue:
            Utilities.shared.playSound("BEAT")
        case "ɪŋ" where color == K.Colors.darkGrey:
            Utilities.shared.playSound("NSoft")
        case "h":
            Utilities.shared.playSound("H")
        case "m":
            Utilities.shared.playSound("M")
        case "ð":
            Utilities.shared.playSound("TH")
        case "b":
            Utilities.shared.playSound("B")
        case "dʒ":
            Utilities.shared.playSound("JOKE")
        case "ɡz":
            Utilities.shared.playSound("GZ")
        case "ju":
            Utilities.shared.playSound("YOU")
        case "oʊ":
            Utilities.shared.playSound("BOAT")
        case "tʃ":
            Utilities.shared.playSound("CHOKE")
        case "f":
            Utilities.shared.playSound("F")
        case "l":
            Utilities.shared.playSound("L")
        case "d":
            Utilities.shared.playSound("D")
        case "θ":
            Utilities.shared.playSound("THunvoiced")
        case "ɑr" where color == K.Colors.green:
            Utilities.shared.playSound("BOT")
        case "ɑr" where color == K.Colors.darkGrey:
            Utilities.shared.playSound("DarkR")
        case "ɛr" where color == K.Colors.darkGreen:
            Utilities.shared.playSound("BET")
        case "ɛr" where color == K.Colors.darkGrey:
            Utilities.shared.playSound("DarkR")
        case "kw":
            Utilities.shared.playSound("Q")
        case "ɔr" where color == K.Colors.purple:
            Utilities.shared.playSound("BOAT")
        case "ɔr" where color == K.Colors.darkGrey:
            Utilities.shared.playSound("DarkR")
        case "ʔ":
            break
        case "ɡ":
            Utilities.shared.playSound("G")
        case "r":
            Utilities.shared.playSound("R")
        case "z":
            Utilities.shared.playSound("Z")
        case "aʊ":
            Utilities.shared.playSound("BOUT")
        case "ɛŋ" where color == K.Colors.pink:
            Utilities.shared.playSound("BAIT")
        case "ɛŋ" where color == K.Colors.darkGrey:
            Utilities.shared.playSound("NSoft")
        case "jə":
            Utilities.shared.playSound("YUH")
        case "kʃ":
            Utilities.shared.playSound("KSH")
        case "wə":
            Utilities.shared.playSound("WUH")
        case "wɪ":
            Utilities.shared.playSound("WIH")
        case "k":
            Utilities.shared.playSound("K")
        case "ŋ":
            Utilities.shared.playSound("NSoft")
        case "s":
            Utilities.shared.playSound("S")
        case "ʃ":
            Utilities.shared.playSound("MISSION")
        case "w":
            Utilities.shared.playSound("W")
        case "ʒ":
            Utilities.shared.playSound("VISION")
        case "æ":
            Utilities.shared.playSound("BAT")
        case "ə":
            Utilities.shared.playSound("BUT")
        case "ɛ":
            Utilities.shared.playSound("BET")
        default:
            break
        }
    }
    
    @objc func addFlashcardButtonPressed(_ sender: UIButton) {
        
        AnalyticsManager.shared.logAddFlashcardPressed()
        
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.5
        }
        
        if Utilities.shared.isUserSignedIn {
            self.delegate?.presentDeckSelectionView()
        }
            
        else {
            self.delegate?.goToLogin()
        }
    }
    
    @objc func touchDown(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
            sender.superview?.layer.shadowOpacity = 0.7
        }
    }
    
    @objc func cancelEvent(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.5
        }
    }
    
}

//MARK: - Collection View Data Source Methods
extension ResultCardView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return soundItOutColors.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = soundItOutCollectionView.dequeueReusableCell(withReuseIdentifier: SoundItOutCell.identifier, for: indexPath) as! SoundItOutCell
        let colorInfo = soundItOutColors[indexPath.row]
        
        cell.soundButton.backgroundColor = colorInfo.color
        cell.soundButton.setTitle(colorInfo.ID, for: .normal)
        cell.soundButton.addTarget(self, action: #selector(soundItOutButtonPressed(_:)), for: .touchUpInside)
        cell.soundButton.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        cell.soundButton.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        cell.soundButton.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        cell.soundButton.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        if colorInfo.color == K.Colors.yellow {
            
            cell.soundButton.wildRange = colorInfo.range
            
        }
        
        return cell
        
    }
    
}

//MARK: - Collection View Delegate Flow Layout Methods
extension ResultCardView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 35, height: 35)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        // Centers the collection view when there is only a single row and wraps the collection view to next line at right number of cells
        let num = CGFloat(soundItOutCollectionView.numberOfItems(inSection: 0))
        let width = soundItOutCollectionView.frame.width
        
        if UIScreen.main.bounds.width <= 320 {
            
            if num <= 6 {
                let totalExtraSpace = width - (num*35.0 + (num - 1.0)*3.0)
                return UIEdgeInsets(top: 0, left: totalExtraSpace/2.0, bottom: 0, right: totalExtraSpace/2.0)
            }
            
        } else if UIScreen.main.bounds.width <= 375 {
            
            if num <= 7 {
                let totalExtraSpace = width - (num*35.0 + (num - 1.0)*3.0)
                return UIEdgeInsets(top: 0, left: totalExtraSpace/2.0, bottom: 0, right: totalExtraSpace/2.0)
            }
            
        } else {
            
            if num <= 8 {
                let totalExtraSpace = width - (num*35.0 + (num - 1.0)*3.0)
                return UIEdgeInsets(top: 0, left: totalExtraSpace/2.0, bottom: 0, right: totalExtraSpace/2.0)
            }
            
        }
        
        return UIEdgeInsets.zero
    }
}

//MARK: - AV Audio Player Delegate
extension ResultCardView: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        if #available(iOS 13.0, *) {
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            playButton.setImage(#imageLiteral(resourceName: "play.fill").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        TextToSpeechManager.shared.avPlayer = nil
        
    }
    
}

//MARK:- Utility Functions

extension ResultCardView {
    
    func showPopTip(range : NSRange, linkString: String, audioString: String? = nil) {
        
        guard let rectForRange = self.topLabel.boundingRect(forCharacterRange: range),
            let actualPronunciation = K.linkToWildCardDictionary[linkString]
            else { return }
        
        actualPronunciation.addAttribute(.font,
                                         value: UIFont(name: "Arial-BoldMT", size: 30)!,
                                         range: NSRange(location: 0, length: actualPronunciation.length))
        
        if range == prevRange && popTip.isVisible {
            
            popTip.hide()
            
            prevRange = nil
            
        }
            
        else {
            
            popTip.show(attributedText: actualPronunciation, direction: .up, maxWidth: 400, in: self.topLabel, from: rectForRange)
            
            if let audioString = audioString {
                Utilities.shared.playSound(audioString)
            }
            
            prevRange = range
            
        }
    }
}
