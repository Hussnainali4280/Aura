//
//  DeckController.swift
//  Aura
//
//  Created by Max Dolensky on 8/5/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import SwipeCellKit

class DeckController: UIViewController {

    //MARK: - Data
    var myDeck: DeckModel!
    var myDeckIndex: Int!
    var scrollViewHeight: NSLayoutConstraint!
    var heightArray = [CGFloat]()
    var currentCardIndex = 0
    var editLauncher = EditLauncher()
    
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
    
    var mainScrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        return scrollView
        
    }()
        
    var mainStackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
        return stackView
        
    }()
    
    var flashcardsScrollView: FlashcardsScrollView?
    
    var studyLoopBackground: UIView = {
        
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return background
        
    }()
    
    var takeTestBackground: UIView = {
        
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return background
        
    }()
    
    var studyLoopButton: AnimatedButton = {
        
        let button = AnimatedButton(frame: .zero)
        button.backgroundColor = K.DesignColors.primary
        button.setTitle(NSLocalizedString("Study Loop", comment: "An infinite loop through all your flashcards that you can study until you want to stop"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(startLoop(_:)), for: .touchUpInside)
        button.roundCorners(cornerRadius: 10)
        return button
        
    }()
    
    var takeTestButton: AnimatedButton = {
        
        let b = AnimatedButton(frame: .zero)
        b.backgroundColor = K.DesignColors.primary
        b.setTitle(NSLocalizedString("Test Yourself", comment: "A one time run through all of your cards in the deck testing you on each of them"), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(takeTest(_:)), for: .touchUpInside)
        return b
        
    }()
    
    var numCardsTitle: UILabel = {
        let l = UILabel()
        l.textAlignment = .right
        l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        l.text = NSLocalizedString("Number of cards:", comment: "number of flashcards in the flashcard deck")
        return l
        
    }()
        
    var numCardsLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        return l
        
    }()
    
    var avgScoreTitle: UILabel = {
        let l = UILabel()
        l.textAlignment = .right
        l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        l.text = NSLocalizedString("Average study score:", comment: "(num of questions right) / (total number of questions seen) since the beginning")
        return l
        
    }()
    
    var avgScoreLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        return l
    }()
    
    var prevTestScoreTitle: UILabel = {
        let l = UILabel()
        l.textAlignment = .right
        l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        l.text = NSLocalizedString("Previous test score:", comment: "The last score you got when you took the test")
        return l
        
    }()
    
    var prevTestScoreLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        return l
    }()
    
    var statsViewContainer: UIView = {
        
        let v = UIView()
        v.backgroundColor = .white
        v.roundCorners(cornerRadius: 10)
        return v
        
    }()
    
    var statsViewBackground: UIView = {
        
        let background = UIView()
        return background
        
    }()
        
    var noFlashcardsLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .left
        label.textColor = K.Colors.darkGrey
        label.text = NSLocalizedString("There are no flashcards in the deck yet.\n\nTo add flashcards search a word and then press the + icon", comment: "")
        return label
    
    }()
        
    let tableView = NoScrollTableView()
    
    //MARK: - VC LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

    }
    
    override func viewDidLayoutSubviews() {
        
        studyLoopBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 4, height: 4), radius: 3, cornerRadius: 10)
        takeTestBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 4, height: 4), radius: 3, cornerRadius: 10)
                
        for card in flashcardsScrollView!.stackView.subviews {
            card.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 4, height: 4), radius: 3, cornerRadius: 10)
        }
        
        for view in flashcardsScrollView!.flashcards {
        
            view.addFlashcardBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 30)
            
            view.loopBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
            
            view.playBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
            
            view.topLabel.adjustsMultiLineFontToFitWidth()
            view.bottomLabel.adjustsMultiLineFontToFitWidth()
        }
        
        statsViewBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 4, height: 4), radius: 3, cornerRadius: 10)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.updateFlashcardScrollView()
        self.updateVisibilities()
        
        for card in flashcardsScrollView!.stackView.subviews {
            
            if let card = card as? ResultCardView {
                card.updateLoopColor()
            }
        }
    }
        
    override func viewDidAppear(_ animated: Bool) {
        
        self.scrollViewHeight.isActive = false
        self.view.layoutIfNeeded()
        
        heightArray = []
        
        for card in self.flashcardsScrollView!.stackView.subviews {
            self.heightArray.append(card.frame.height)
        }
        
        if myDeck.cards.count > 0 {
            
            self.scrollViewHeight.constant = self.heightArray[self.currentCardIndex]
            self.scrollViewHeight.isActive = true
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    //MARK: - Setup
    func setup() {
        
        view.backgroundColor = K.DesignColors.background
        
        // Setup Navigation Bar
        centerTitle.text = myDeck.name
        self.navigationItem.titleView = centerTitle
        self.navigationController?.navigationBar.topItem?.title = " "
        
        // Add Edit Button
        let editButton = UIBarButtonItem(title: NSLocalizedString("Edit", comment: "edit the deck name"), style: .plain, target: self, action: #selector(editButtonPressed))
            
        self.navigationItem.rightBarButtonItems = [editButton]
        
        // Make bar color purple, and buttons white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = K.DesignColors.primary
        
        // Add scroll view and Content view
        view.addSubview(mainScrollView)
        view.sendSubviewToBack(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        
        // Anchor Scroll View
        mainScrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              leading: view.leadingAnchor,
                              trailing: view.trailingAnchor,
                              height: nil,
                              width: nil)
        
        // Anchor Content View
        mainStackView.anchor(top: mainScrollView.topAnchor,
                             bottom: mainScrollView.bottomAnchor,
                             leading: mainScrollView.leadingAnchor,
                             trailing: mainScrollView.trailingAnchor,
                             height: nil,
                             width: nil)
        
        mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        
        
        let flashcards = makeResultCardViews()
        
        for card in flashcards {

            card.translatesAutoresizingMaskIntoConstraints = false
            card.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true

        }
                
        flashcardsScrollView = FlashcardsScrollView(frame: .zero, flashcards: flashcards)
        scrollViewHeight = flashcardsScrollView?.heightAnchor.constraint(equalToConstant: 0)
        flashcardsScrollView?.delegate = self
                
        mainStackView.addArrangedSubview(flashcardsScrollView!)
        
        // Constrain Scroll View width so that the prev and next cards show on the screen and the main stackView can adjust its size
        flashcardsScrollView?.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        
        // Add Study Loop Button
        studyLoopBackground.addSubview(studyLoopButton)
        
        studyLoopButton.anchor(top: studyLoopBackground.topAnchor,
                                  bottom: studyLoopBackground.bottomAnchor,
                                  leading: studyLoopBackground.leadingAnchor,
                                  trailing: studyLoopBackground.trailingAnchor,
                                  height: nil,
                                  width: nil)
        
        studyLoopBackground.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        
        mainStackView.addArrangedSubview(studyLoopBackground)
          
        // Add Take Test Button
        takeTestBackground.addSubview(takeTestButton)
        
        takeTestButton.anchor(top: takeTestBackground.topAnchor,
                                  bottom: takeTestBackground.bottomAnchor,
                                  leading: takeTestBackground.leadingAnchor,
                                  trailing: takeTestBackground.trailingAnchor,
                                  height: nil,
                                  width: nil)
        
        takeTestBackground.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        
        mainStackView.addArrangedSubview(takeTestBackground)
                
        // Add Stats View
        updateStatsLabel()
        
        statsViewBackground.addSubview(statsViewContainer)
        
        statsViewContainer.anchor(top: statsViewBackground.topAnchor,
                          bottom: statsViewBackground.bottomAnchor,
                          leading: statsViewBackground.leadingAnchor,
                          trailing: statsViewBackground.trailingAnchor,
                          height: nil,
                          width: nil)
        
        statsViewBackground.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        mainStackView.addArrangedSubview(statsViewBackground)
        
        statsViewContainer.addSubview(numCardsTitle)
        statsViewContainer.addSubview(numCardsLabel)
        statsViewContainer.addSubview(avgScoreTitle)
        statsViewContainer.addSubview(avgScoreLabel)
        statsViewContainer.addSubview(prevTestScoreTitle)
        statsViewContainer.addSubview(prevTestScoreLabel)
        
        numCardsTitle.anchor(top: statsViewContainer.topAnchor,
                             bottom: nil,
                             leading: statsViewContainer.leadingAnchor,
                             trailing: nil,
                             height: nil,
                             width: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))
        
        avgScoreTitle.anchor(top: numCardsTitle.bottomAnchor,
                             bottom: nil,
                             leading: statsViewContainer.leadingAnchor,
                             trailing: nil,
                             height: nil,
                             width: nil, padding: UIEdgeInsets(top: 4, left: 10, bottom: 0, right: 0))
        
        prevTestScoreTitle.anchor(top: avgScoreTitle.bottomAnchor,
                                  bottom: statsViewContainer.bottomAnchor,
                                  leading: statsViewContainer.leadingAnchor,
                                  trailing: nil,
                                  height: nil,
                                  width: nil, padding: UIEdgeInsets(top: 4, left: 10, bottom: -10, right: 0))
        
        numCardsLabel.anchor(top: statsViewContainer.topAnchor,
                             bottom: nil,
                             leading: nil,
                             trailing: statsViewContainer.trailingAnchor,
                             height: nil,
                             width: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: -10))
        
        avgScoreLabel.anchor(top: numCardsLabel.bottomAnchor,
                             bottom: nil,
                             leading: nil,
                             trailing: statsViewContainer.trailingAnchor,
                             height: nil,
                             width: nil, padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: -10))
        
        prevTestScoreLabel.anchor(top: avgScoreLabel.bottomAnchor,
                                  bottom: statsViewContainer.bottomAnchor,
                                  leading: nil,
                                  trailing: statsViewContainer.trailingAnchor,
                                  height: nil,
                                  width: nil, padding: UIEdgeInsets(top: 4, left: 0, bottom: -10, right: -10))
        
        // Setup Flashcard Detail Views
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 70.0;
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.register(FlashcardCell.self, forCellReuseIdentifier: K.Cells.flashcardCell)
        tableView.backgroundColor = .clear
        
        mainStackView.addArrangedSubview(tableView)
        tableView.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        
        // Add Header
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        headerView.backgroundColor = .clear
        
        let headerLabel = UILabel()
        headerLabel.backgroundColor = .clear
        headerLabel.text = NSLocalizedString("Cards", comment: "")
        headerLabel.font = .systemFont(ofSize: 17, weight: .bold)
        headerLabel.textAlignment = .left
        
        let cardScoreLabel = UILabel()
        cardScoreLabel.backgroundColor = .clear
        cardScoreLabel.text = NSLocalizedString("Retention Rate", comment: "How well you know each individual flashcard. Basically an individual average percent taken from the study loop.")
        cardScoreLabel.font = .systemFont(ofSize: 17, weight: .bold)
        cardScoreLabel.textAlignment = .right
        
        headerView.addSubview(headerLabel)
        headerLabel.anchor(top: nil,
                           bottom: headerView.bottomAnchor,
                           leading: headerView.leadingAnchor,
                           trailing: nil,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0))
        
        headerView.addSubview(cardScoreLabel)
        cardScoreLabel.anchor(top: nil,
                              bottom: headerView.bottomAnchor,
                              leading: headerLabel.trailingAnchor,
                              trailing: headerView.trailingAnchor,
                              height: nil,
                              width: nil,
                              padding: UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0))
        
        tableView.tableHeaderView = headerView
        
        // Add Footer
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        footerView.backgroundColor = .clear
        tableView.tableFooterView = footerView
        
        // Add No Cards Label
        noFlashcardsLabel.translatesAutoresizingMaskIntoConstraints = false
        noFlashcardsLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        mainStackView.addArrangedSubview(noFlashcardsLabel)
        
        updateVisibilities()
    }
    
    func updateVisibilities() {
        
        DispatchQueue.main.async {
            
            self.myDeck = Utilities.shared.user?.decks[self.myDeckIndex]
            
            if self.myDeck.cards.count == 0 {
                
                self.flashcardsScrollView?.isHidden = true
                self.studyLoopBackground.isHidden = true
                self.takeTestBackground.isHidden = true
                self.statsViewBackground.isHidden = true
                self.tableView.isHidden = true
                self.noFlashcardsLabel.isHidden = false
                
            }
            
            else {
                
                self.flashcardsScrollView?.isHidden = false
                self.studyLoopBackground.isHidden = false
                self.takeTestBackground.isHidden = false
                self.statsViewBackground.isHidden = false
                self.tableView.isHidden = false
                self.noFlashcardsLabel.isHidden = true
                self.tableView.reloadData()
                self.updateStatsLabel()
            }
            
        }
    }
    
    func updateStatsLabel() {
        
        let avgScore = myDeck.avgScore.getAsFormattedScore()
        let prevTestScore = myDeck.prevTestScore.getAsFormattedScore()
        let numCards = NSMutableAttributedString(string: "\(myDeck.numberOfCards)")
        
        avgScore.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .medium), range: .init(location: 0, length: avgScore.length))
        prevTestScore.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .medium), range: .init(location: 0, length: prevTestScore.length))
        numCards.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .medium), range: .init(location: 0, length: numCards.length))
         
        DispatchQueue.main.async {
            self.avgScoreLabel.attributedText = avgScore
            self.numCardsLabel.attributedText = numCards
            self.prevTestScoreLabel.attributedText = prevTestScore
        }
    }
        
    func makeResultCardViews() -> [ResultCardView] {
        
        var result = [ResultCardView]()
        
        for flashcard in myDeck.cards {
            
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
            
            let card = ResultCardView(frame: .zero,
                                      results: coloredResults,
                                      bottomLabelText: flashcard.bottomLabelText,
                                      soundItOutColors: soundItOutColors,
                                      isFlashcard: true)
            result.append(card)
            
        }
        
        return result
    }
    
    func updateFlashcardScrollView(didDelete: Bool = false) {
    
        DispatchQueue.main.async {
            
            self.myDeck = Utilities.shared.user?.decks[self.myDeckIndex]
            
            let flashcards = self.makeResultCardViews()
            
            for card in flashcards {
                
                card.translatesAutoresizingMaskIntoConstraints = false
                card.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
                
            }
                        
            self.flashcardsScrollView!.updateFlashcards(flashcards) {
                
                for card in self.flashcardsScrollView!.stackView.subviews {
                    card.setShadow(color: .black, opacity: 0.5, offset: .zero, radius: 2, cornerRadius: 10)
                }
                
                if didDelete {
                    
                    if self.myDeck.cards.count > 0 {
                        
                        self.scrollViewHeight.constant = self.heightArray[self.currentCardIndex]
                        UIView.animate(withDuration: 0.3) {
                            self.view.layoutIfNeeded()
                        }
                        
                    }
                }
            }
        }
    }
    
    //MARK: - Selector Functions
    @objc func editButtonPressed() {
        
        editLauncher.parentView = self
        editLauncher.navBarYValue = self.view.safeAreaLayoutGuide.layoutFrame.minY
        editLauncher.showSettings()
        
    }
        
    @objc func startLoop(_ sender: UIButton) {
        AnalyticsManager.shared.logStudyLoopPressed()
        
        UIView.animate(withDuration: 0.2) {
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
        } completion: { (_) in
            let vc = StudyController()
            vc.myDeck = self.myDeck
            vc.myDeckIndex = self.myDeckIndex
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func takeTest(_ sender: UIButton) {
        AnalyticsManager.shared.logTestPressed()
        
        let alert = UIAlertController(title: NSLocalizedString("Flashcard Orientation", comment: "do you want to be shown the front or back of the flashcard first"), message: NSLocalizedString("Test Yourself by seeing the front, or back, of the flashcard first", comment: ""), preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: NSLocalizedString("Front to Back", comment: "see front first and test yourself on back of flashcard"), style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
            let vc = TestController()
            vc.myDeck = self.myDeck
            vc.myDeckIndex = self.myDeckIndex
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let action2 = UIAlertAction(title: NSLocalizedString("Back to Front", comment: "see back of flashcard first and test on front"), style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
            let vc = TestController()
            vc.isReverse = false
            vc.myDeck = self.myDeck
            vc.myDeckIndex = self.myDeckIndex
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { (_) in
            // Do Nothing
        }
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(cancel)
        
        UIView.animate(withDuration: 0.2) {
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
        } completion: { (_) in
            self.present(alert, animated: true)
        }
    }
}

//MARK: - TableView Data Source Method
extension DeckController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myDeck.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.flashcardCell) as! FlashcardCell
        cell.delegate = self
        
        let card = myDeck.cards[indexPath.row]
        
        // Set top label text
        let wordArray = card.wordArray
        var topText = ""
        
        for i in 0..<wordArray.count {
            
            topText.append(wordArray[i])
            
            if i != wordArray.count - 1 {
                topText.append(" ")
            }
        }
        
        cell.topLabel.text = topText
        
        // Set bottom label text
        cell.bottomLabel.text = card.bottomLabelText
        
        // Set score
        let cardScoreText = card.score.getAsFormattedScore()
        cardScoreText.addAttribute(.font, value: UIFont.systemFont(ofSize: 18, weight: .medium), range: .init(location: 0, length: cardScoreText.length))
        cell.scoreLabel.attributedText = cardScoreText
        
        cell.heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
        
        return cell
    }
    
    
}

//MARK: - TableView Delegate Methods
extension DeckController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        mainScrollView.setContentOffset(.zero, animated: true)
        
        flashcardsScrollView?.setContentOffset( CGPoint(x: flashcardsScrollView!.frame.size.width * CGFloat(indexPath.row), y: 0.0), animated: true)
        
        currentCardIndex = indexPath.row
        scrollViewHeight.constant = heightArray[currentCardIndex]
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
}

//MARK: -  Swipe Delegate Methods
extension DeckController: SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
            guard orientation == .right else { return nil }

            let deleteAction = SwipeAction(style: .destructive, title: NSLocalizedString("Delete", comment: "")) { action, indexPath in
                
                // Update Current Card Index
                self.currentCardIndex = (self.currentCardIndex == self.myDeck.cards.count - 1) ? (self.currentCardIndex - 1): self.currentCardIndex
                if self.currentCardIndex < 0 { self.currentCardIndex = 0 }
                
                self.heightArray.remove(at: indexPath.row)
                
                // handle action by updating model with deletion
                self.myDeck.cards.remove(at: indexPath.row)
                self.myDeck.numberOfCards -= 1
                
                // Decrease each card index after the deleted card by one
                for i in indexPath.row..<self.myDeck.cards.count {
                    self.myDeck.cards[i].cardIndex -= 1
                }
                
                if var user = Utilities.shared.user {
                    
                    user.decks[self.myDeckIndex] = self.myDeck
                    FirebaseManager.shared.updateUser(user: user)
                    self.updateStatsLabel()
                    self.updateFlashcardScrollView(didDelete: true)
                    
                }
                self.updateVisibilities()
            }
        
            return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }

}

//MARK: - Scroll View Delegate

extension DeckController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        currentCardIndex = Int(targetContentOffset.pointee.x / flashcardsScrollView!.frame.size.width)
        
        scrollViewHeight.constant = heightArray[currentCardIndex]
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
}
