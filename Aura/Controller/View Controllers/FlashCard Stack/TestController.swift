//
//  TestControllerViewController.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/13/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class TestController: UIViewController {

    //MARK: - Data
    var myDeck: DeckModel!
    var myDeckIndex: Int!
    var divisor: CGFloat!
    var isFront = true
    var isReverse = true
    var myQueue = [FlashcardModel]()
    var numCorrect = 0
    var questionIndex = 1
    
    //MARK: - Subviews
    
    var centerTitle: UILabel = {
       
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 30))
        label.backgroundColor = .clear
        label.font = UIFont(name: K.Fonts.avenirBlack, size: 17)
        label.text = NSLocalizedString("Deck Name", comment: "")
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()

    
    let contentView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .clear
        return view
        
    }()
        
    let imageContainer: UIView = {
                
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0
        return view
        
    }()
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = K.Colors.green
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "checkmark")
        } else {
            imageView.image = #imageLiteral(resourceName: "check").withRenderingMode(.alwaysTemplate)
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.roundCorners(cornerRadius: 10)
        return imageView
        
    }()
    
    let flashcardBackground = UIView()
    
    let XView: UIView = {
        
        let constant: CGFloat = UIScreen.main.bounds.width > 320 ? 70 : 50
        
        let button = UIButton()
        button.backgroundColor = .white
        button.contentMode = .center
        button.roundCorners(cornerRadius: constant/2)
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "xmark"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "xmark").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.imageView?.backgroundColor = .white
        button.imageView?.tintColor = K.Colors.red
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        if UIScreen.main.bounds.width > 320 {
            button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        } else {
            button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
                
        button.addTarget(self, action: #selector(xButtonPressed(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        let background = UIView()
        background.addSubview(button)
        button.anchor(top: background.topAnchor,
                    bottom: background.bottomAnchor,
                    leading: background.leadingAnchor,
                    trailing: background.trailingAnchor,
                    height: nil,
                    width: nil)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        background.widthAnchor.constraint(equalToConstant: constant).isActive = true
        background.heightAnchor.constraint(equalToConstant: constant).isActive = true
        
        return background
        
    }()
    
    let checkmarkView: UIView = {
        
        let constant: CGFloat = UIScreen.main.bounds.width > 320 ? 70 : 50
        
        let button = UIButton()
        button.backgroundColor = .white
        button.contentMode = .center
        button.roundCorners(cornerRadius: constant/2)
                
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "check").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        button.imageView?.backgroundColor = .white
        button.imageView?.tintColor = K.Colors.green
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        if UIScreen.main.bounds.width > 320 {
            button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        } else {
            button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
                
        button.addTarget(self, action: #selector(checkButtonPressed(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        let background = UIView()
        background.addSubview(button)
        button.anchor(top: background.topAnchor,
                    bottom: background.bottomAnchor,
                    leading: background.leadingAnchor,
                    trailing: background.trailingAnchor,
                    height: nil,
                    width: nil)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        background.widthAnchor.constraint(equalToConstant: constant).isActive = true
        background.heightAnchor.constraint(equalToConstant: constant).isActive = true
        
        return background
        
    }()
        
    let flipView: UIView = {
                
        let constant: CGFloat = UIScreen.main.bounds.width > 320 ? 70 : 50
        
        let button = UIButton()
        button.backgroundColor = .white
        button.contentMode = .center
        button.roundCorners(cornerRadius: constant/2)
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "arrow.2.circlepath"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "flip").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        button.imageView?.backgroundColor = .white
        button.imageView?.tintColor = .black
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        if UIScreen.main.bounds.width > 320 {
            button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        } else {
            button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
        
        button.addTarget(self, action: #selector(flipButtonPressed(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        let background = UIView()
        background.addSubview(button)
        button.anchor(top: background.topAnchor,
                    bottom: background.bottomAnchor,
                    leading: background.leadingAnchor,
                    trailing: background.trailingAnchor,
                    height: nil,
                    width: nil)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        background.widthAnchor.constraint(equalToConstant: constant).isActive = true
        background.heightAnchor.constraint(equalToConstant: constant).isActive = true
        
        return background
        
    }()
    
    let buttonsStackView: UIStackView = {
        
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        return stack
        
    }()
    
    var currentCard: TestFlashcard!
    
    let container: UIView = {
        
        let v = UIView()
        v.backgroundColor = .clear
        return v
        
    }()
    
    let progressLabel: UILabel = {
        
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        l.textColor = K.DesignColors.primary
        return l
        
    }()
    
    let progressView: UIProgressView = {
        
        let pv = UIProgressView()
        pv.progressTintColor = K.DesignColors.primary
        return pv
        
    }()
    
    //MARK: - INIT
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        flashcardBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 4, height: 4), radius: 3, cornerRadius: 10)
        XView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 35)
        flipView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 35)
        checkmarkView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 35)
        
        currentCard.soundBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        
        currentCard.loopBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.view.layoutIfNeeded()
            self.currentCard.bottomLabel.adjustFontSizeToFit()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "hasSeenSwipePopUp") {
            return
        } else {
            let popUpManager = SwipeTutorialPopUpManager()
            popUpManager.showPopUpFadingIn()
            UserDefaults.standard.setValue(true, forKey: "hasSeenSwipePopUp")
        }
        
    }
    
    //MARK: - Setup
    func setup() {
        
        // Get Data
        divisor = (view.frame.width / 2) / 0.61
        myQueue = myDeck.cards.shuffled()
        progressLabel.text = "\(questionIndex) / \(myDeck.cards.count)"
        
        // Setup Navigation Bar
        centerTitle.text = myDeck.name
        self.navigationItem.titleView = centerTitle
        self.navigationController?.navigationBar.topItem?.title = " "
        
        // Make bar color purple, and buttons white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = K.DesignColors.primary
        
        // Configure self.view
        view.backgroundColor = K.DesignColors.background
        
        if UIScreen.main.bounds.width > 320 {
            setupForLargerPhones()
        } else {
            setupForSmallerPhones()
        }
        
    }
    
    func setupForLargerPhones() {
        
        // Add subviews to main view
        view.addSubview(container)
        view.addSubview(contentView)
        view.addSubview(flashcardBackground)
        view.addSubview(buttonsStackView)
        
        // Add Progress View
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        container.addSubview(progressView)
        container.addSubview(progressLabel)
        
        progressView.anchor(top: container.topAnchor,
                            bottom: container.bottomAnchor,
                            leading: container.leadingAnchor,
                            trailing: nil,
                            height: nil,
                            width: nil)
        
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor).isActive = true
        progressLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor,constant: 4).isActive = true
        progressLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        progressView.setProgress(Float(questionIndex) / Float(myDeck.cards.count), animated: false)
        
        // Add content view
        view.sendSubviewToBack(contentView)
        contentView.anchor(top: container.bottomAnchor,
                           bottom: buttonsStackView.topAnchor,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: -10))
        
        // Create first card
        createTestFlashcard()
        
        flashcardBackground.translatesAutoresizingMaskIntoConstraints = false
        flashcardBackground.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        flashcardBackground.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        flashcardBackground.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        flashcardBackground.heightAnchor.constraint(greaterThanOrEqualToConstant: 350).isActive = true
        
        // Prevent Flashcard from becoming to large
        flashcardBackground.topAnchor.constraint(greaterThanOrEqualTo: container.bottomAnchor, constant: 10).isActive = true
        flashcardBackground.bottomAnchor.constraint(lessThanOrEqualTo: buttonsStackView.topAnchor, constant: -10).isActive = true

                
        flashcardBackground.addSubview(currentCard)
        flashcardBackground.addSubview(imageContainer)
        
        currentCard.anchor(top: flashcardBackground.topAnchor,
                        bottom: flashcardBackground.bottomAnchor,
                        leading: flashcardBackground.leadingAnchor,
                        trailing: flashcardBackground.trailingAnchor,
                        height: nil,
                        width: nil)
        
        imageContainer.anchor(top: flashcardBackground.topAnchor,
                              bottom: flashcardBackground.bottomAnchor,
                              leading: flashcardBackground.leadingAnchor,
                              trailing: flashcardBackground.trailingAnchor,
                              height: nil,
                              width: nil)
        
        imageContainer.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor).isActive = true
        
        flashcardBackground.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCard(_:))))
        flashcardBackground.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_:))))

        buttonsStackView.anchor(top: contentView.bottomAnchor,
                                bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                leading: view.leadingAnchor,
                                trailing: view.trailingAnchor,
                                height: nil,
                                width: nil,
                                padding: UIEdgeInsets(top: 0, left: 50, bottom: -20, right: -50))
        
        buttonsStackView.addArrangedSubview(XView)
        buttonsStackView.addArrangedSubview(flipView)
        buttonsStackView.addArrangedSubview(checkmarkView)
    }
    
    func setupForSmallerPhones() {
        
        // Add subviews to main view
        view.addSubview(container)
        view.addSubview(contentView)
        view.addSubview(flashcardBackground)
        view.addSubview(buttonsStackView)
        
        // Add Progress View
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        container.addSubview(progressView)
        container.addSubview(progressLabel)
        
        progressView.anchor(top: container.topAnchor,
                            bottom: container.bottomAnchor,
                            leading: container.leadingAnchor,
                            trailing: nil,
                            height: nil,
                            width: nil)
        
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor).isActive = true
        progressLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor,constant: 4).isActive = true
        progressLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        progressView.setProgress(Float(questionIndex) / Float(myDeck.cards.count), animated: false)
        
        // Add content view
        view.sendSubviewToBack(contentView)
        contentView.anchor(top: container.bottomAnchor,
                           bottom: buttonsStackView.topAnchor,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        // Create first card
        createTestFlashcard()
        
        flashcardBackground.translatesAutoresizingMaskIntoConstraints = false
        flashcardBackground.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        flashcardBackground.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        flashcardBackground.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        flashcardBackground.heightAnchor.constraint(greaterThanOrEqualToConstant: 280).isActive = true
        
        // Prevent Flashcard from becoming to large
        flashcardBackground.topAnchor.constraint(greaterThanOrEqualTo: container.bottomAnchor, constant: 10).isActive = true
        flashcardBackground.bottomAnchor.constraint(lessThanOrEqualTo: buttonsStackView.topAnchor, constant: -10).isActive = true

                
        flashcardBackground.addSubview(currentCard)
        flashcardBackground.addSubview(imageContainer)
        
        currentCard.anchor(top: flashcardBackground.topAnchor,
                        bottom: flashcardBackground.bottomAnchor,
                        leading: flashcardBackground.leadingAnchor,
                        trailing: flashcardBackground.trailingAnchor,
                        height: nil,
                        width: nil)
        
        imageContainer.anchor(top: flashcardBackground.topAnchor,
                              bottom: flashcardBackground.bottomAnchor,
                              leading: flashcardBackground.leadingAnchor,
                              trailing: flashcardBackground.trailingAnchor,
                              height: nil,
                              width: nil)
        
        imageContainer.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor).isActive = true
        
        flashcardBackground.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCard(_:))))
        flashcardBackground.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_:))))

        buttonsStackView.anchor(top: contentView.bottomAnchor,
                                bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                leading: view.leadingAnchor,
                                trailing: view.trailingAnchor,
                                height: nil,
                                width: nil,
                                padding: UIEdgeInsets(top: 0, left: 50, bottom: -20, right: -50))
        
        buttonsStackView.addArrangedSubview(XView)
        buttonsStackView.addArrangedSubview(flipView)
        buttonsStackView.addArrangedSubview(checkmarkView)
    }
    
    func createTestFlashcard() {
        guard myQueue.count > 0 else { return }
        let flashcard = myQueue[0]
        
        var coloredResults = [ColorResultModel]()
        
        // Populate Results Array
        for (word,wordModel) in zip(flashcard.wordArray, flashcard.wordModelArray) {
            
            // If  Word Model Exists, addg colored word and audio to result
            if let wordModel = wordModel {
                
                // Take only the first ipa spelling for now
                if let ipa = wordModel.ipa[flashcard.ipaIndex] {
                    
                    let audio = (0 < wordModel.audio.count ? wordModel.audio[flashcard.ipaIndex] : nil)
                    var text = WordColoringManager.shared.colorWord(word: wordModel.id, ipa: ipa).0
                    text = text.setCapitalLetters(from: word).replaceSpecialCharacters(from: word)
                    coloredResults.append(ColorResultModel(attributedText: text, audioString: audio, ipa: ipa, isColored: true))
                }
            }
            
            else {
                
                let text = NSMutableAttributedString(string: word)
                coloredResults.append(ColorResultModel(attributedText: text, audioString: nil, ipa: "", isColored: false))
                
            }
            
        }
        
        let soundItOutColors = createButtons(coloredResults[0].attributedText)
        
        self.currentCard = TestFlashcard(frame: .zero,
                                         results: coloredResults,
                                         bottomLabelText: flashcard.bottomLabelText,
                                         soundItOutColors: soundItOutColors)
       
        isFront = isReverse ? false : true
        currentCard.updateSubviewVisibilities(isFront: isFront)
        
    }
    
    func updateTestFlashcard() {
        guard myQueue.count > 0 else { return }
        let flashcard = myQueue[0]
        
        var coloredResults = [ColorResultModel]()
        
        // Populate Results Array
        for (word,wordModel) in zip(flashcard.wordArray, flashcard.wordModelArray) {
            
            // If  Word Model Exists, addg colored word and audio to result
            if let wordModel = wordModel {
                
                // Take only the first ipa spelling for now
                if let ipa = wordModel.ipa[flashcard.ipaIndex] {
                    
                    let audio = (0 < wordModel.audio.count ? wordModel.audio[flashcard.ipaIndex] : nil)
                    var text = WordColoringManager.shared.colorWord(word: wordModel.id, ipa: ipa).0
                    text = text.setCapitalLetters(from: word).replaceSpecialCharacters(from: word)
                    coloredResults.append(ColorResultModel(attributedText: text, audioString: audio, ipa: ipa, isColored: true))
                }
            }
            
            else {
                
                let text = NSMutableAttributedString(string: word)
                coloredResults.append(ColorResultModel(attributedText: text, audioString: nil, ipa: "", isColored: false))
                
            }
            
        }
        
        let soundItOutColors = createButtons(coloredResults[0].attributedText)
        
        currentCard.results = coloredResults
        currentCard.bottomLabelText = flashcard.bottomLabelText
        currentCard.soundItOutColors = soundItOutColors
        
        currentCard.updateViews()
        
        isFront = isReverse ? false : true
        currentCard.updateSubviewVisibilities(isFront: isFront)
        
        UIView.animate(withDuration: 0.2) {
            self.flashcardBackground.alpha = 1
            
        }
        
    }
    
    //MARK: - Animations
    
    @objc func panCard(_ sender: UIPanGestureRecognizer) {
                
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: contentView.center.x + point.x, y: contentView.center.y + point.y)
        
        let scale = min(100/abs(point.x), 1)
        
        card.transform = CGAffineTransform(rotationAngle: point.x / divisor).scaledBy(x: scale, y: scale)
        
        if point.x > 0.0 {
            if #available(iOS 13.0, *) {
                imageView.image = UIImage(systemName: "checkmark")
            } else {
                imageView.image = #imageLiteral(resourceName: "check").withRenderingMode(.alwaysTemplate)
            }
            imageView.tintColor = K.Colors.green
        } else {
            if #available(iOS 13.0, *) {
                imageView.image = UIImage(systemName: "xmark")
            } else {
                imageView.image = #imageLiteral(resourceName: "xmark").withRenderingMode(.alwaysTemplate)
            }
            imageView.tintColor = K.Colors.red
        }
        
        imageContainer.alpha = abs(point.x) / contentView.center.x
        
        if sender.state == .ended {
            
            if card.center.x < 75 {
                // Move off to left
                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                }, completion: {(finished: Bool) in
                    self.getNewCard(wasCorrect: false)
                })
                
                return
            }
                
            else if card.center.x > (view.frame.width - 75) {
                // Move off to right
                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }, completion: {(finished: Bool) in
                    self.getNewCard(wasCorrect: true)
                })
                
                return
            }
            
            resetCard()
        }
    }
    
    func getNewCard(wasCorrect: Bool) {
        
        updateDeckAfterSwipe(wasCorrect)
        flashcardBackground.center = self.contentView.center
        flashcardBackground.transform = .identity
        self.imageContainer.alpha = 0
            
    }
    
    func resetCard() {
        
        UIView.animate(withDuration: 0.2) {
            self.flashcardBackground.center = self.contentView.center
            self.imageContainer.alpha = 0
            self.flashcardBackground.alpha = 1
            self.flashcardBackground.transform = .identity
        }
    }
    
    @objc func flipCard(_ sender: UITapGestureRecognizer) {
        
        // Animate
        UIView.animate(withDuration: 0.2) {
            sender.view?.transform = .identity
            sender.view?.superview?.layer.shadowOpacity = 0.5
        }
        
        if isFront {
            
            isFront = false
            currentCard.updateSubviewVisibilities(isFront: isFront)
            UIView.transition(with: self.flashcardBackground, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
        }
            
        else {
            
            isFront = true
            currentCard.updateSubviewVisibilities(isFront: isFront)
            UIView.transition(with: self.flashcardBackground, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            
        }
    }
    
    @objc func flipButtonPressed(_ sender: UIButton) {
        
        // Animate
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.5
        }
        
        if isFront {
            
            isFront = false
            currentCard.updateSubviewVisibilities(isFront: isFront)
            UIView.transition(with: self.flashcardBackground, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
        }
            
        else {
            
            isFront = true
            currentCard.updateSubviewVisibilities(isFront: isFront)
            UIView.transition(with: self.flashcardBackground, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            
        }
    }
    
    @objc func xButtonPressed(_ sender: UIButton) {
        
        // Animate Button
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.5
        }
        
        // Animate Card Left
        UIView.animate(withDuration: 0.4) {
            self.flashcardBackground.transform = CGAffineTransform(
                translationX: -350, y: 50)
                .rotated(by: -0.6)
                .scaledBy(x: 0.4, y: 0.4)
            self.flashcardBackground.alpha = 0
        } completion: { (_) in
            self.getNewCard(wasCorrect: false)
        }
    }
        
    @objc func checkButtonPressed(_ sender: UIButton) {
        
        // Animate Button
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.5
        }
        
        // Animate Card Left
        UIView.animate(withDuration: 0.4) {
            self.flashcardBackground.transform = CGAffineTransform(
                translationX: +350, y: 50)
                .rotated(by: 0.6)
                .scaledBy(x: 0.4, y: 0.4)
            self.flashcardBackground.alpha = 0
        } completion: { (_) in
            self.getNewCard(wasCorrect: true)
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
    
    func updateDeckAfterSwipe(_ wasCorrect: Bool) {
                
        if wasCorrect {
            numCorrect += 1
        }
    
        guard myQueue.count > 0 else {
              showResults()
              return
          }
        _ = myQueue.remove(at: 0)
        
        if myQueue.count != 0 {
            questionIndex += 1
            progressLabel.text = "\(questionIndex) / \(myDeck.cards.count)"
            progressView.setProgress(Float(questionIndex) / Float(myDeck.cards.count), animated: true)
            updateTestFlashcard()
        } else {
            showResults()
        }
    }
    
    func showResults() {
        
        // Update Previous Test Score
        let score = 100.0*(Double(numCorrect) / Double(myDeck.cards.count))
        Utilities.shared.user!.decks[myDeckIndex].prevTestScore = score
        FirebaseManager.shared.updateUser(user: Utilities.shared.user!)
        
        // Show Results
        let v = TestResultPopUpView(frame: .zero)
        v.setupLabelsFromScore(score)
        let popUpManager = TestResultPopUpManager(popUpView: v)
        popUpManager.delegate = self
        popUpManager.showPopUpFromBottom()
    }
}

extension TestController: TestManagerDelegate {
    
    func finishTest(willRestart: Bool) {
        
        if willRestart {
            myQueue = myDeck.cards.shuffled()
            numCorrect = 0
            questionIndex = 1
            progressLabel.text = "\(questionIndex) / \(myDeck.cards.count)"
            progressView.setProgress(Float(questionIndex) / Float(myDeck.cards.count), animated: true)
            updateTestFlashcard()
        } else {
            navigationController?.popViewController(animated: true)
        }
        
    }
    
}
