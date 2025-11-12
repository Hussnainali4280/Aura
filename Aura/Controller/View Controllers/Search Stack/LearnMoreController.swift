//
//  LearnMoreController.swift
//  Aura
//
//  Created by Max Dolensky on 8/21/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation
import AMPopTip

class LearnMoreController: UIViewController {
    
    //MARK: - Data
    
    var shouldRefresh: Bool = false
    var bottomLabelText = ""
    var searchInput = ""
    var searchOutput = ""
    var ipaIndex = 0
    var wordArray = [String]()
    var wordModelArray = [WordModel?]()
    var results = [ColorResultModel]()
    var dictionaryResult = [String : [DictionaryResult]]()
    var soundItOutColors = [(color: UIColor, ID: String, range: NSRange)]()
    var learnMoreArray = [(text: NSMutableAttributedString, ipaIndex: Int)]()
    var isFullyMatched = true
    var learnMoreIsFullyMatched = true
    var searchStatus: SearchStatus!
    var learnMoreSearchStatus: SearchStatus!
    
    // Search Information
    var searchInfo = SearchInfo(sourceLanguageCode: "en", sourceLanguageName: "English")
    
    //MARK: - Utilities
    
    let cellID = "SoundItOutCell"
    
    //MARK: - Views
    
    var networkConnection = true
    
    var centerTitle: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 30))
        label.backgroundColor = .clear
        label.font = UIFont(name: K.Fonts.avenirBlack, size: 17)
        label.text = NSLocalizedString("Search", comment: "")
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    var mainScrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = K.DesignColors.background
        return scrollView
        
    }()
    
    var mainStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        return stackView
        
    }()
    
    var searchStatusView = SearchStatusView()
    
    var resultCard = ResultCardView()
    
    var alternativeCard = AltTranslationsView()
        
    var learnMoreScrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.layer.masksToBounds = false
        return scrollView
        
    }()
    
    var learnMoreContentView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .clear
        return view
        
    }()
    
    var learnMoreStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.layer.masksToBounds = false
        return stackView
        
    }()
    
    var learnMoreHeaderLabel: UILabel = {
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = NSLocalizedString( "Related Searches", comment: "")
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .left
        return label
        
    }()
    
    var myDecksLabel: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("My Decks", comment: "")
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
        
    }()
    
    var myDecksScrollView: MyDecksScrollView!
    
    var whereToStartLabel: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Where to Start", comment: "")
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
        
    }()
    
    var introImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        return iv
    }()
    
    var playImageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = K.DesignColors.primary
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var playView: UIView = {
        let v = UIView()
        
        let container = UIView()
        container.backgroundColor = .white
        
        v.addSubview(container)
        container.addSubview(playImageView)
        
        playImageView.translatesAutoresizingMaskIntoConstraints = false
        playImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        playImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        playImageView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        playImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        container.anchor(top: v.topAnchor,
                             bottom: v.bottomAnchor,
                             leading: v.leadingAnchor,
                             trailing: v.trailingAnchor,
                             height: nil,
                             width: nil)
        
        container.roundCorners(cornerRadius: 30)
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 60).isActive = true
        v.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return v
        
        
    }()
    
    lazy var introVideoView: UIView = {
        
        let container = UIView()
        container.addSubview(introImageView)
        
        introImageView.anchor(top: container.topAnchor,
                  bottom: container.bottomAnchor,
                  leading: container.leadingAnchor,
                  trailing: container.trailingAnchor,
                  height: nil,
                  width: nil)
    
        introImageView.roundCorners(cornerRadius: 10)
        
        container.addSubview(playView)
        
        playView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        playView.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        let b = AnimatedButton(frame: .zero)
        b.addTarget(self, action: #selector(introVideoPressed(_:)), for: .touchUpInside)
        
        container.addSubview(b)
        b.anchor(top: container.topAnchor,
                 bottom: container.bottomAnchor,
                 leading: container.leadingAnchor,
                 trailing: container.trailingAnchor,
                 height: nil,
                 width: nil)
        
        return container
        
    }()
    
    // Background Views
    let resultBackgroundView = UIView ()
        
    //MARK: - INIT
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.DesignColors.background
        NetworkManager.shared.learnMoreDelegates.append(self)
        Utilities.shared.learnMoreDelegates.append(self)
        AdManager.shared.learnMoreDelegates.append(self)
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if shouldRefresh {
            updateMyDecksDisplay()
        }
        
        if searchStatus != .success {
            
            searchStatusView.setLabelText(status: searchStatus)
            searchStatusView.superview?.isHidden = false
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        
        else if !self.isFullyMatched {
            
            self.searchStatusView.setLabelTextAsColorErr()
            self.searchStatusView.superview?.isHidden = false
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultCard.topLabel.adjustsMultiLineFontToFitWidth()
        resultCard.bottomLabel.adjustsMultiLineFontToFitWidth()
        setupShadows()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        resultCard.updateLoopColor()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if isMovingFromParent {
            NetworkManager.shared.learnMoreDelegates.removeLast()
            Utilities.shared.learnMoreDelegates.removeLast()
            AdManager.shared.learnMoreDelegates.removeLast()
        }
    }
    
}

extension LearnMoreController {
    
    //MARK:- View Setup Functions
    
    func setupView() {
        self.setupToHideKeyboardOnTapOnView()
        setupNavBar()
        setupScrollView()
        
        if !NetworkManager.shared.isConnected {
            networkConnection = false
        }
    }
    
    func setupShadows() {
        
        searchStatusView.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 10)
        
        resultBackgroundView.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 10)
        
        resultCard.addFlashcardBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 30)
        
        resultCard.loopBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        
        resultCard.playBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        
        resultCard.reportErrorBackgroundView.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
                
        alternativeCard.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 21)
        
        for view in learnMoreStackView.arrangedSubviews {
            view.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
        }
                
        introVideoView.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 10)
        
        for v in myDecksScrollView.stackView.subviews {
            v.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
        }
        
        playView.setShadow(color: .black, opacity: 0.7, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 30)
        
    }
    
    func setupNavBar() {
        
        // Add Center Title
        self.navigationItem.titleView = centerTitle
        self.navigationController?.navigationBar.topItem?.title = " "
                
        // Make bar color purple, and buttons white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = K.DesignColors.primary
        
    }
    
    func setupScrollView() {
        
        mainScrollView.delegate = self
        
        // Add scroll view and content view
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
        
        // Setup Results Card
        resultCard = ResultCardView(frame: .zero,
                                    results: self.results,
                                    bottomLabelText: self.bottomLabelText,
                                    soundItOutColors: self.soundItOutColors,
                                    delegate: self)
        
        resultBackgroundView.addSubview(resultCard)
        
        resultCard.anchor(top: resultBackgroundView.topAnchor,
                          bottom: resultBackgroundView.bottomAnchor,
                          leading: resultBackgroundView.leadingAnchor,
                          trailing: resultBackgroundView.trailingAnchor,
                          height: nil,
                          width: nil)
        
        // Add Search Status View to Stack View
        mainStackView.addArrangedSubview(searchStatusView, withMargin: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        searchStatusView.superview?.isHidden = true
        
        // Add Results Card to Stack View
        mainStackView.addArrangedSubview(resultBackgroundView, withMargin: UIEdgeInsets(top: 27, left: 20, bottom: 0, right: -20))
        
        // Add Alternatives Card
        setupAlternativesView()
        
        // Setup Learn More Scroll View
        setupLearnMoreScrollView()
        
        // Setup Lessons UpSaleButton
        setupLessonsButton()
        
        // Setup FlashCard UpSaleButton
        setupMyFlashcards()
    }
        
    func setupAlternativesView() {
        
        self.alternativeCard = AltTranslationsView(frame: .zero, searchedText: self.searchInput, dictionaryResult: self.dictionaryResult, searchInfo: self.searchInfo)
        self.alternativeCard.delegate = self
        mainStackView.addArrangedSubview(alternativeCard, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        
        if self.dictionaryResult.count == 0 {
            self.alternativeCard.superview?.isHidden = true
        }
        
    }
    
    func setupLearnMoreScrollView() {
        
        // Add Header Label and Scroll View to the Main Content View
        mainStackView.addArrangedSubview(learnMoreHeaderLabel, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        mainStackView.addArrangedSubview(learnMoreScrollView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        
        // Add Stack View to Scroll View
        learnMoreScrollView.addSubview(learnMoreStackView)
        
        learnMoreStackView.anchor(top: learnMoreScrollView.topAnchor,
                                  bottom: learnMoreScrollView.bottomAnchor,
                                  leading: learnMoreScrollView.leadingAnchor,
                                  trailing: learnMoreScrollView.trailingAnchor,
                                  height: nil,
                                  width: nil)
        
        // Prevent Vertical Scrolling
        learnMoreStackView.heightAnchor.constraint(equalTo: learnMoreScrollView.heightAnchor).isActive = true
        
        
        // Populate Alternative Translations Stack View
        populateLearnMoreStackView()
        
    }
    
    func populateLearnMoreStackView() {
        
        if results.count <= 1 && learnMoreArray.count <= 1 {
            
            learnMoreHeaderLabel.superview?.isHidden = true
            learnMoreScrollView.superview?.isHidden = true
            
        }
            
        else if learnMoreArray.count == 0 {
            
            learnMoreHeaderLabel.superview?.isHidden = true
            learnMoreScrollView.superview?.isHidden = true
            
        }
            
        else {
            
            learnMoreHeaderLabel.superview?.isHidden = false
            learnMoreScrollView.superview?.isHidden = false
            
        }
        
        for result in learnMoreArray {
            
            // Create Background Shadow View
            let myView = UIView()
            learnMoreStackView.addArrangedSubview(myView)
            myView.widthAnchor.constraint(equalToConstant: 220).isActive = true
            myView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            // Create Content View
            let myContentView = UIView()
            myContentView.backgroundColor = .white
            myContentView.roundCorners(cornerRadius: 10)
            myView.addSubview(myContentView)
            myContentView.anchor(top: myView.topAnchor,
                                 bottom: myView.bottomAnchor,
                                 leading: myView.leadingAnchor,
                                 trailing: myView.trailingAnchor,
                                 height: nil,
                                 width: nil)
            
            // Formate Atrributed Text
            let attText = NSMutableAttributedString(attributedString: result.text).removeSymbols()
            attText.addAttribute(.font, value: UIFont.systemFont(ofSize: 30), range: NSRange(location: 0, length: attText.length))
            
            // Create Label
            let myLabel = UILabel()
            myLabel.attributedText = attText
            myLabel.numberOfLines = 1
            myLabel.backgroundColor = .white
            myLabel.textAlignment = .left
            myContentView.addSubview(myLabel)
            
            // Anchor Label so its left aligned but stays in center if text doesn't fill the view
            myLabel.translatesAutoresizingMaskIntoConstraints = false
            myLabel.topAnchor.constraint(equalTo: myContentView.topAnchor, constant: 10).isActive = true
            myLabel.bottomAnchor.constraint(equalTo: myContentView.bottomAnchor, constant: -10).isActive = true
            myLabel.centerXAnchor.constraint(equalTo: myContentView.centerXAnchor).isActive = true
            myLabel.widthAnchor.constraint(lessThanOrEqualTo: myContentView.widthAnchor, constant: -20).isActive = true
            
            // Create Clear button to overlay the label
            let myButton = QueryButton()
            myButton.queryText = result.text.string.removeSymbols()
            myButton.ipaIndex = result.ipaIndex
            myButton.backgroundColor = .clear
            myButton.addTarget(self, action: #selector(learnMoreButtonPressed(_:)), for: .touchUpInside)
            myButton.addTarget(self, action: #selector(touchDown1(_:)), for: .touchDown)
            myButton.addTarget(self, action: #selector(cancelEvent1(_:)), for: .touchUpOutside)
            myButton.addTarget(self, action: #selector(cancelEvent1(_:)), for: .touchDragOutside)
            myButton.addTarget(self, action: #selector(touchDown1(_:)), for: .touchDragInside)
            
            // Anchor Button
            myContentView.addSubview(myButton)
            myButton.anchor(top: myContentView.topAnchor,
                            bottom: myContentView.bottomAnchor,
                            leading: myContentView.leadingAnchor,
                            trailing: myContentView.trailingAnchor,
                            height: nil,
                            width: nil)
        }
        
    }
    
    func setupMyFlashcards() {
        
        // Initialize My Decks Scroll View
        if let decks = Utilities.shared.user?.decks {
            myDecksScrollView = MyDecksScrollView(frame: .zero, decks: decks)
            myDecksScrollView.myDeckDelegate = self
        } else {
            myDecksScrollView = MyDecksScrollView(frame: .zero)
            myDecksScrollView.myDeckDelegate = self
        }
        
        mainStackView.addArrangedSubview(myDecksLabel, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        
        mainStackView.addArrangedSubview(myDecksScrollView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: -27, right: -20))
        
        myDecksScrollView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Update My Decks Visibility
        myDecksScrollView.updateVisibility()
        if myDecksScrollView.decks.count == 0 {
            myDecksLabel.superview?.isHidden = true
        }
        
    }
    
    func setupLessonsButton() {
        
        introImageView.loadImageUsingCacheWithURLString(urlString: AdManager.shared.getFunnelThumbnailURLForCurrentUserState())
        whereToStartLabel.text = AdManager.shared.getFunnelLabelTitleForCurrentUserState()
        
        if AdManager.shared.shouldVideoBeLocked() {
            if #available(iOS 13, *) {
                playImageView.image = UIImage(systemName: "lock.fill")
            } else {
                playImageView.image = #imageLiteral(resourceName: "lock.fill").withRenderingMode(.alwaysTemplate)
            }
        } else {
            if #available(iOS 13, *) {
                playImageView.image = UIImage(systemName: "play.fill")
            } else {
                playImageView.image = #imageLiteral(resourceName: "play.fill").withRenderingMode(.alwaysTemplate)
            }
        }
        
        introVideoView.translatesAutoresizingMaskIntoConstraints = false
        introVideoView.heightAnchor.constraint(equalToConstant: 175).isActive = true
        
        mainStackView.addArrangedSubview(whereToStartLabel, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainStackView.addArrangedSubview(introVideoView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        
    }
    
    //MARK:- Selector Functions
            
    @objc func learnMoreButtonPressed(_ sender: QueryButton) {
        
        UIView.animate(withDuration: 0.2) {
             sender.superview?.transform = .identity
             sender.superview?.superview?.layer.shadowOpacity = 0.3
         }
        
        if networkConnection == false {
            self.showCannotSearchAlert()
            return
        }
        
        let sourceCode = (searchInfo.searchType == .englishToNative) ? searchInfo.sourceLanguageCode : searchInfo.targetLanguageCode
        let sourceName = (searchInfo.searchType == .englishToNative) ? searchInfo.sourceLanguageName : searchInfo.targetLanguageName
        let targetCode = (searchInfo.searchType == .englishToNative) ? searchInfo.targetLanguageCode : searchInfo.sourceLanguageCode
        let targetName = (searchInfo.searchType == .englishToNative) ? searchInfo.targetLanguageName : searchInfo.sourceLanguageName
        
        let newSearchInfo = SearchInfo(searchType: .englishToNative,
                                       sourceLanguageCode: sourceCode,
                                       sourceLanguageName: sourceName,
                                       targetLanguageCode: targetCode,
                                       targetLanguageName: targetName)
        
        startSearchSequence(searchText: sender.queryText, newSearchInfo, ipaIndex: sender.ipaIndex)
        
    }
    
    @objc func goToFlashcardButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.7
        }
        
        self.tabBarController?.selectedIndex = 3
    }
    
    @objc func introVideoPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
            
        } completion: { (_) in
            
            if AdManager.shared.shouldVideoBeLocked() {
                AdManager.shared.showBuyButton(inVideo: false, videoVC: nil, parentVC: self)
            } else {
                self.tabBarController?.selectedIndex = 4

                if let vc = self.tabBarController!.viewControllers![4] as? UINavigationController {
                    let vc = vc.viewControllers[0] as! LessonsController
                    let page = AdManager.shared.lessonPageToScrollTo()
                    vc.scrollToPage(page: page, animated: false)
                    vc.playVideo()
                }
            }
        }
    }
    
    @objc func touchDown(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            sender.superview?.layer.shadowOpacity = 0.8
        }
    }
    
    @objc func touchDown1(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.superview?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            sender.superview?.superview?.layer.shadowOpacity = 0.4
        }
    }
    
    @objc func cancelEvent(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.7
        }
        
    }
    
    @objc func cancelEvent1(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            sender.superview?.transform = .identity
            sender.superview?.superview?.layer.shadowOpacity = 0.3
        }
        
    }
}

//MARK: - Result Card Delegate Function

extension LearnMoreController: ResultCardDelegate {
    
    func presentReportErrorAlert(alert: UIAlertController) {
        self.present(alert, animated: true)
    }
    
    func presentDeckSelectionView() {
        
        let vc = DeckSelectingController()
        vc.bottomLabelText = self.bottomLabelText
        vc.wordArray = self.wordArray
        vc.wordModelArray = self.wordModelArray
        vc.ipaIndex = self.ipaIndex
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func goToLogin() {
        
        let vc = Utilities.shared.getLoginVC()
        let login = vc.viewControllers[0] as! LoginController
        login.isModal = true
        login.delegate = self
        self.present(vc, animated: true, completion: nil)
        
    }
    
}

//MARK: - AddFlashcard Delegate
extension LearnMoreController: AddFlashcardDelegate {
    
    func tapAddFlashcardButton() {
        
        resultCard.addFlashcardButton.sendActions(for: .touchUpInside)
        
    }
    
}

// MARK:- Search Sequence Functions

extension LearnMoreController {
    
    func startSearchSequence(searchText: String,_ searchInfo: SearchInfo, ipaIndex: Int = 0) {
        
        AnalyticsManager.shared.logSearch(searchTerm: searchText)
        
        //Update Search Input Variable
        self.searchInput = searchText
        
        //Clear popTip
        resultCard.popTip.hide()
                
        //Set Language Codes
        AzureTranslationManager.shared.sourceLanguageCode = searchInfo.sourceLanguageCode
        AzureTranslationManager.shared.targetLanguageCode = searchInfo.targetLanguageCode
        
        // Clear Results Array
        results = []
        wordArray = []
        bottomLabelText = ""
        wordModelArray = []
        soundItOutColors = []
        learnMoreArray = []
        learnMoreIsFullyMatched = true
        
        //Update Query Text
        bottomLabelText = searchText
        
        //Update IpaIndex
        self.ipaIndex = ipaIndex
        
        // Start Loading Screen
        DispatchQueue.main.async {
            self.startLoadingScreen()
        }
        
        // Create And Enter Dispatch Group For Tranlsation Request
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        // 1. Translate
        // 2. Color Words
        runSearchsequence(searchText: searchText, searchInfo: searchInfo) { (searchStatus) in
            
            self.learnMoreSearchStatus = searchStatus
            
            switch searchStatus {
                
            case .success,
                 .missingSomeWordModels,
                 .emptyTranslationMissingSomeWordModels,
                 .emptyTranslationWithAllWordModels:
                
                // Populate Results Array
                for (word,wordModel) in zip(self.wordArray, self.wordModelArray) {
                    
                    // If  Word Model Exists, addg colored word and audio to result
                    if let wordModel = wordModel {
                        
                        // Take only the first ipa spelling for now
                        if let ipa = wordModel.ipa[ipaIndex] {
                            
                            // Add Colored Text
                            let audio = (0 < wordModel.audio.count ? wordModel.audio[ipaIndex] : nil)
                            let coloringResult = WordColoringManager.shared.colorWord(word: wordModel.id, ipa: ipa)
                            var text = coloringResult.0
                            text = text.setCapitalLetters(from: word).replaceSpecialCharacters(from: word)
                            self.results.append(ColorResultModel(attributedText: text, audioString: audio, ipa: ipa, isColored: true))
                            
                            // If Text Colored Incorrectly Update isFullyMatched
                            if !coloringResult.1 {
                                self.learnMoreIsFullyMatched = false
                            }
                            
                        }
                                                
                        // Add all ipa spellings for each word to the Learn More Array
                        for i in 0..<wordModel.ipa.count {
                            
                            if let ipa = wordModel.ipa[i] {
                                
                                var text = WordColoringManager.shared.colorWord(word: wordModel.id, ipa: ipa).0
                                text = text.setCapitalLetters(from: word).replaceSpecialCharacters(from: word)
                                self.learnMoreArray.append((text: text, ipaIndex: i))
                            }
                            
                        }
                        
                    }
                        
                    // If Word Model doesn't exist, add plain text to result
                    else {
                        
                        let text = NSMutableAttributedString(string: word)
                        self.results.append(ColorResultModel(attributedText: text, audioString: nil, ipa: "", isColored: false))
                    }
                }
                
                dispatchGroup.leave()
                
            case .nilTranslation,
                 .noExistingWordModels,
                 .emptyTranslationNoExistingWordModels:
                
                for word in self.wordArray {
                    
                    self.results.append(ColorResultModel(attributedText: NSMutableAttributedString(string: word),
                                                         audioString: nil, ipa: "", isColored: false))
                    
                }
                
                self.isFullyMatched = false
                
                dispatchGroup.leave()
            }
        }
        
        if !(AzureTranslationManager.shared.sourceLanguageCode == "en" && AzureTranslationManager.shared.targetLanguageCode == "en") {
            
            dispatchGroup.enter()
            AzureTranslationManager.shared.fetchDictionaryTranslations { (dictionaryResult) in
                
                self.dictionaryResult = dictionaryResult
                dispatchGroup.leave()
                
            }
            
        }
        
        dispatchGroup.notify(queue: .main) {
            
            DispatchQueue.main.async {
                self.endLoadingScreen()
                self.pushToLearnMoreController(searchInfo)
            }
        }
    }
    
    func runSearchsequence(searchText: String, searchInfo: SearchInfo, completion: @escaping(_ success: SearchStatus) -> Void) {
        
        switch searchInfo.searchType {
            
        case .nativeToEnglish:
            
            // If source Lang is English, retrieve word models from database
            if AzureTranslationManager.shared.sourceLanguageCode == "en" {
                
                self.searchOutput = searchText
                
                self.wordArray = searchText.replacingOccurrences(of: "’", with: "'").split(separator: " ").map {String($0)}
                
                FirebaseManager.shared.readEnglishDocumentByWord(words: wordArray) { (wordModelArray) in
                    
                    self.wordModelArray = wordModelArray
                    
                    let filteredArray = wordModelArray.filter { $0 != nil }
                    
                    // All Word Models Found
                    if wordModelArray.count > 0 && wordModelArray.count == filteredArray.count { completion(.success) }
                        
                    // Some Word Models Found
                    else if wordModelArray.count > 0 && filteredArray.count > 0 { completion(.missingSomeWordModels) }
                        
                    // No Word Models Found
                    else { completion(.noExistingWordModels) }
                }
            }
                
            // Otherwise get translations and then retrieve word models from database
            else {
                
                var isEmptyTranslation = true
                
                AzureTranslationManager.shared.textToTranslate = searchText
                AzureTranslationManager.shared.fetchTranslation { (translation) in
                    
                    guard var translation = translation else {
                        print("Translation is nil")
                        self.searchOutput = searchText
                        self.wordArray = searchText.split(separator: " ").map { String($0) }
                        completion(.nilTranslation)
                        return
                    }
                    
                    // If the Translation Returns an empty string we want the result to be the original searched Text
                    if translation == "" {
                        
                        translation = searchText
                        
                    } else { isEmptyTranslation = false }
                    
                    self.searchOutput = translation
                    
                    self.wordArray = translation.split(separator: " ").map { String($0) }
                    
                    // Retrieve word models from database
                    FirebaseManager.shared.readEnglishDocumentByWord(words: self.wordArray) { (wordModelArray) in
                        
                        self.wordModelArray = wordModelArray
                        
                        let filteredArray = wordModelArray.filter { $0 != nil }
                        
                        // All  Word Models Found
                        if wordModelArray.count > 0 && wordModelArray.count == filteredArray.count {
                            
                            if isEmptyTranslation { completion(.emptyTranslationWithAllWordModels) }
                                
                            else { completion(.success) }
                            
                        }
                        
                        // Some Word Models Found
                        else if wordModelArray.count > 0 && filteredArray.count > 0 {
                            
                            if isEmptyTranslation { completion(.emptyTranslationMissingSomeWordModels) }
                            
                            else { completion(.missingSomeWordModels) }
                            
                        }
                        
                        // No Word Models Found
                        else {
                            
                            if isEmptyTranslation { completion(.emptyTranslationNoExistingWordModels) }
                            
                            else { completion(.noExistingWordModels) }
                            
                        }
                    }
                }
            }
            
        case .englishToNative:
            
            // If Target Lang is English, retrieve word models from database
            if AzureTranslationManager.shared.targetLanguageCode == "en" {
                
                self.searchOutput = searchText
                
                self.wordArray = searchText.replacingOccurrences(of: "’", with: "'").split(separator: " ").map {String($0)}
                
                FirebaseManager.shared.readEnglishDocumentByWord(words: wordArray) { (wordModelArray) in
                    
                    self.wordModelArray = wordModelArray
                    
                    let filteredArray = wordModelArray.filter { $0 != nil }
                    
                    // All Word Models Found
                    if wordModelArray.count > 0 && wordModelArray.count == filteredArray.count { completion(.success) }
                    
                    // Some Word Models Found
                    else if wordModelArray.count > 0 && filteredArray.count > 0 { completion(.missingSomeWordModels) }
                    
                    // No Word Models Found
                    else { completion(.noExistingWordModels) }
                }
            }
                
            // Otherwise get translations and then retrieve word models from database
            else {
                
                var isEmptyTranslation = true
                
                AzureTranslationManager.shared.textToTranslate = searchText
                AzureTranslationManager.shared.fetchTranslation { (translation) in
                    
                    guard var translation = translation else {
                        print("Translation is nil")
                        self.searchOutput = searchText
                        self.wordArray = searchText.split(separator: " ").map { String($0) }
                        completion(.nilTranslation)
                        return
                    }
      
                    // If the Translation Returns an empty string we want the result to be the original searched Text
                    if translation == "" {
                        
                        translation = searchText
                        
                    } else { isEmptyTranslation = false }
                    
                    self.searchOutput = translation
                    
                    self.bottomLabelText = translation
                    
                    self.wordArray = searchText.split(separator: " ").map { String($0) }
                    
                    // Retrieve word models from database
                    FirebaseManager.shared.readEnglishDocumentByWord(words: self.wordArray) { (wordModelArray) in
                        
                        self.wordModelArray = wordModelArray
                        
                        let filteredArray = wordModelArray.filter { $0 != nil }
                        
                        // All  Word Models Found
                        if wordModelArray.count > 0 && wordModelArray.count == filteredArray.count {
                            
                            if isEmptyTranslation { completion(.emptyTranslationWithAllWordModels) }
                                
                            else { completion(.success) }
                            
                        }
                        
                        // Some Word Models Found
                        else if wordModelArray.count > 0 && filteredArray.count > 0 {
                            
                            if isEmptyTranslation { completion(.emptyTranslationMissingSomeWordModels) }
                            
                            else { completion(.missingSomeWordModels) }
                            
                        }
                        
                        // No Word Models Found
                        else {
                            
                            if isEmptyTranslation { completion(.emptyTranslationNoExistingWordModels) }
                            
                            else { completion(.noExistingWordModels) }
                            
                        }
                    }
                }
            }
        }
    }
        
    func pushToLearnMoreController(_ searchInfo: SearchInfo) {
        
        // Initialize result controller
        let vc = LearnMoreController()
        
        // Populate LearnMore Controller Data
        vc.searchInfo = searchInfo
        vc.bottomLabelText = self.bottomLabelText
        vc.ipaIndex = 0
        vc.wordArray = self.wordArray
        vc.wordModelArray = self.wordModelArray
        vc.results = self.results
        vc.dictionaryResult = self.dictionaryResult
        vc.learnMoreArray = self.learnMoreArray
        vc.searchStatus = self.searchStatus
        vc.isFullyMatched = self.learnMoreIsFullyMatched
        vc.checkForColorError()
        
        // Update Search History
        if Utilities.shared.isUserSignedIn {
            
            if var user = Utilities.shared.user {
                
                let searchType = searchInfo.searchType == .nativeToEnglish ? 0 : 1
                let fbSearchinfo = FBSearchInfo(searchType: searchType,
                                                sourceLanguageCode: searchInfo.sourceLanguageCode,
                                                sourceLanguageName: searchInfo.sourceLanguageName,
                                                targetLanguageCode: searchInfo.targetLanguageCode,
                                                targetLanguageName: searchInfo.targetLanguageName)
                
                let info = SearchAndResult(searchText: self.searchInput, resultText: self.searchOutput, searchInfo: fbSearchinfo)
                
                user.prevSearches.insert(info, at: 0)
                
                if user.prevSearches.count > 50 { _ =  user.prevSearches.popLast() }
                
                Utilities.shared.user = user
                FirebaseManager.shared.updateUser(user: user)
            }
            
        }
        
        // Create sound it out buttons for result controller
        if results.count == 1 {
            
            vc.soundItOutColors = createButtons(results[0].attributedText)
            
        } else { vc.soundItOutColors = [] }
        
        // Push Result Controller
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - AltTranslation Delegate Methods
extension LearnMoreController: AltTranslationDelegate {
    
    func searchBackTranslation(backTranslation: String, searchInfo: SearchInfo) {
        
        if networkConnection == false {
            self.showCannotSearchAlert()
            return
        }
        
        startSearchSequence(searchText: backTranslation, searchInfo)
    }

}

// MARK: - Scroll View Delegate Methods
extension LearnMoreController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if !searchStatusView.superview!.isHidden {
            
            DispatchQueue.main.async {
                
                self.searchStatusView.superview?.isHidden = true
                
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
}

// MARK: - Utilities
extension LearnMoreController {
    
    func checkForColorError() {
        
        if !self.isFullyMatched {
            
            var text = ""
            
            if self.searchInfo.searchType == .englishToNative {
                text = self.searchInput
            }
            
            else {
                text = self.searchOutput
            }
            
            FirebaseManager.shared.writeColorError(text: text)
        }
    }
}

extension LearnMoreController: FirebaseUpdaterDelegate {
    
    func updateMyDecksDisplay() {
        
        if !isShowing() {
            self.shouldRefresh = true
            return
        }
        
        self.shouldRefresh = false
        
        guard let decks = Utilities.shared.user?.decks else {
            
            myDecksScrollView.decks = []
            myDecksScrollView.updateDecks()
            myDecksScrollView.updateVisibility()
            myDecksLabel.superview?.isHidden = true
            return
            
        }
        
        myDecksScrollView.decks = decks
        myDecksScrollView.updateDecks()
        myDecksScrollView.updateVisibility()
                
        if decks.count == 0 {
            myDecksLabel.superview?.isHidden = true
        } else { myDecksLabel.superview?.isHidden = false }
    }
}

extension LearnMoreController: MyDeckScrollViewDelegate {
    
    func goToDeck(deckIndex: Int) {
        
        self.tabBarController?.selectedIndex = 3
        if let controllers = tabBarController?.viewControllers {
            if let navVC = controllers[3] as? UINavigationController {
                navVC.popToRootViewController(animated: false)
                if let rootVC = navVC.viewControllers[0] as? FlashCardController {
                    rootVC.goToDeck(deckIndex: deckIndex)
                }
                
            }
        }
        
    }
    
}

extension LearnMoreController: AdManagerDelegate {
    
    func updateSecretsThumbnail() {
        introImageView.loadImageUsingCacheWithURLString(urlString: AdManager.shared.getFunnelThumbnailURLForCurrentUserState())
        whereToStartLabel.text = AdManager.shared.getFunnelLabelTitleForCurrentUserState()
        
        if AdManager.shared.shouldVideoBeLocked() {
            if #available(iOS 13, *) {
                playImageView.image = UIImage(systemName: "lock.fill")
            } else {
                playImageView.image = #imageLiteral(resourceName: "lock.fill").withRenderingMode(.alwaysTemplate)
            }
        } else {
            if #available(iOS 13, *) {
                playImageView.image = UIImage(systemName: "play.fill")
            } else {
                playImageView.image = #imageLiteral(resourceName: "play.fill").withRenderingMode(.alwaysTemplate)
            }
        }
    }
}

extension LearnMoreController: NetworkConnectionUpdater {
    
    func setInterfaceForNetworkConnection() {
        networkConnection = true
        updateSecretsThumbnail()
        updateMyDecksDisplay()
    }
    
    func setInterfaceForNoNetworkConnection() {
        networkConnection = false
    }
    
}
