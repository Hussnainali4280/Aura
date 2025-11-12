//
//  SearchController.swift
//  Aura
//
//  Created by Max Dolensky on 7/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import Speech

class SearchController: UIViewController {
    
    // Data
    var shouldRefresh: Bool = false
    var bottomLabelText = ""
    var searchInput = ""
    var searchOutput = ""
    var wordArray = [String]()
    var wordModelArray = [WordModel?]()
    var results = [ColorResultModel]()
    var dictionaryResult = [String: [DictionaryResult]]()
    var learnMoreArray = [(text: NSMutableAttributedString, ipaIndex: Int)]()
    var isFullyMatched = true
    var searchStatus: SearchStatus!
    
    // Search Information
    var searchInfo = SearchInfo(sourceLanguageCode: "en", sourceLanguageName: "English") {
        
        didSet {
            
            updateMicButtonVisibility()
            
        }
        
    }

    // Main Views and Buttons
    
    var noNetworkConnectionView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        
        let container = UIView()
        
        let l = UILabel()
        l.text = NSLocalizedString("Connect to the internet", comment: "Cannot connect to the internet")
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .gray
        
        let l1 = UILabel()
        l1.text = NSLocalizedString("You're offline. Check your connection", comment: "Cannot connect to the internet")
        l1.textAlignment = .center
        l1.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        l1.textColor = .gray
        
        let iv = UIImageView()
        if #available(iOS 13, *) {
            iv.image = UIImage(systemName: "icloud.slash")
        } else {
            iv.image = #imageLiteral(resourceName: "wifi.slash").withRenderingMode(.alwaysTemplate)
        }
        iv.tintColor = K.DesignColors.lightVariant
        iv.contentMode = .scaleAspectFit
        
        container.addSubview(iv)
        container.addSubview(l)
        container.addSubview(l1)
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iv.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        l.anchor(top: iv.bottomAnchor,
                 bottom: nil,
                 leading: container.leadingAnchor,
                 trailing: container.trailingAnchor,
                 height: nil,
                 width: nil,
                 padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0))
        
        l1.anchor(top: l.bottomAnchor,
                  bottom: container.bottomAnchor,
                  leading: container.leadingAnchor,
                  trailing: container.trailingAnchor,
                  height: nil,
                  width: nil,
                  padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0))
        
        v.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: v.centerYAnchor, constant: -8).isActive = true
        
        v.isHidden = true
        
        return v
    }()
    
    var titleLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 30))
        label.backgroundColor = .clear
        label.font = UIFont(name: K.Fonts.avenirBlack, size: 17)
        label.text = NSLocalizedString("Search", comment: "")
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    var languageBarView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        view.setUnderlineStyle(color: K.Colors.lightGrey)
        return view
        
    }()
    
    var langStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
        
    }()
    
    var languageButton: UIButton = {
        
        let button = UIButton()
        button.addTarget(self, action: #selector(languageButtonPressed), for: .touchUpInside)
        button.backgroundColor = .white
        button.titleLabel!.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.setTitleColor(K.DesignColors.primary, for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
        
    }()
    
    var swapButton: UIButton = {
        
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "arrow.right.arrow.left.circle"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "arrow.right.arrow.left").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        button.addTarget(self, action: #selector(swapButtonPressed(_:)), for: .touchUpInside)
        button.tintColor = K.DesignColors.primary
        button.backgroundColor = .white
        return button
        
    }()
    
    var englishLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Am. English HD"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    var textView: UITextView = {
        
        let textView = UITextView()
        textView.returnKeyType = .search
        textView.text = NSLocalizedString("Enter text", comment: "enter the text you want to  search here")
        textView.textColor = .lightGray
        textView.font = .systemFont(ofSize: 17)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 50)
        textView.backgroundColor = .white
        return textView
    
    }()
    
    var micButton: UIButton = {
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "mic.fill").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        button.backgroundColor = K.DesignColors.primary
        button.tintColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.roundCorners(cornerRadius: 20)
        
        button.addTarget(self, action: #selector(recordPressed), for: .touchUpInside)
        
        return button
        
    }()
    
    var searchButton: UIButton = {
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "arrow.forward").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        button.backgroundColor = K.DesignColors.primary
        button.tintColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.roundCorners(cornerRadius: 20)
        
        button.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        
        return button
        
    }()
    
    var cancelButton: UIButton = {
        
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "multiply"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "multiply").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        button.backgroundColor = .white
        button.tintColor = .black
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        button.isHidden = true
        return button
        
    }()
    
    var tableView = UITableView()
    
    // Background Views
    let textViewBackgroundView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.searchDelegate = self
        Utilities.shared.searchHistoryDelegate = self
        setupView()
        view.backgroundColor = K.DesignColors.background
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           
           setupShadows()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
        if Utilities.shared.isUserSignedIn {
            
            if Utilities.shared.user!.prevSearches.count > 0 { tableView.isHidden = false }
            else { tableView.isHidden = true }
            
        } else { tableView.isHidden = true }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if shouldRefresh {
            updateSearchHistory()
        }
    }
}

extension SearchController {
    
//MARK:- View Setup Functions
    
    func setupView() {
        self.setupToHideKeyboardOnTapOnView()
        setupNavBar()
        setupLanguageSelectionView()
        setupTextView()
        setupTableView()
        
        view.addSubview(noNetworkConnectionView)
        noNetworkConnectionView.anchor(top: textView.topAnchor,
                                       bottom: textView.bottomAnchor,
                                       leading: textView.leadingAnchor,
                                       trailing: textView.trailingAnchor,
                                       height: nil,
                                       width: nil)
        
        if !NetworkManager.shared.isConnected {
            noNetworkConnectionView.isHidden = false
            view.bringSubviewToFront(noNetworkConnectionView)
        }
    }
    
    func setupShadows() {
        textViewBackgroundView.setShadowWithBZPath(color: UIColor.black, opacity: 0.3, offset: .init(width: 0, height: 3), radius: 2)
    }
    
    func setupNavBar() {
        
        // Add Center Title
        self.navigationItem.titleView = titleLabel
        
        // Add user button
        if #available(iOS 13.0, *) {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                                                     style: .plain,
                                                                     target: self,
                                                                     action: #selector(settingsButtonTapped))
        } else {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "line.horizontal.3").withRenderingMode(.alwaysTemplate),
                                                                     style: .plain,
                                                                     target: self,
                                                                     action: #selector(settingsButtonTapped))
        }

        // Make bar color purple, and buttons white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = K.DesignColors.primary
        
    }
    
    func setupLanguageSelectionView() {
        
        // Add Language Bar View
        view.addSubview(languageBarView)
        languageBarView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                           bottom: nil,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           height: 60,
                           width: nil)
        
        // Add Stack View
        languageBarView.addSubview(langStackView)
        langStackView.anchor(top: languageBarView.topAnchor,
                             bottom: languageBarView.bottomAnchor,
                             leading: languageBarView.leadingAnchor,
                             trailing: languageBarView.trailingAnchor,
                             height: nil,
                             width: nil,
                             padding: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))

        // Add Language Button
        langStackView.addArrangedSubview(languageButton)
        setupLangButtonFromUserDefault()
        
        // Add Swap Button
        langStackView.addArrangedSubview(swapButton)
        
        // Add English Label
        langStackView.addArrangedSubview(englishLabel)
        
        swapButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        languageButton.widthAnchor.constraint(equalTo: englishLabel.widthAnchor).isActive = true
        
    }
    
    func fetchLocale() -> String {
        
        let currentLangCode = String(searchInfo.sourceLanguageCode[0...1])
        let phoneLanguageCode = String(Locale.preferredLanguages[0][0...1])
        
        let finalLangCode = currentLangCode == phoneLanguageCode ? Locale.preferredLanguages[0] : searchInfo.sourceLanguageCode
        
        return finalLangCode
    }
    
    func updateMicButtonVisibility() {
        
        let localeString = fetchLocale()
        
        if let isAvailable = SFSpeechRecognizer(locale: Locale(identifier: localeString))?.isAvailable {
            
            if isAvailable {
                micButton.isHidden = false
            }
            else {
                micButton.isHidden = true
            }
            return
        }
        else {
            micButton.isHidden = true
        }
    }
    
    func setupTextView() {
        
        // Add View
        view.addSubview(textViewBackgroundView)
        textViewBackgroundView.anchor(top: langStackView.bottomAnchor,
                       bottom: nil,
                       leading: view.leadingAnchor,
                       trailing: view.trailingAnchor,
                       height: 160,
                       width: nil,
                       padding: UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0))
        
        // Add TextView
        textView.delegate = self
        view.addSubview(textView)
        textView.anchor(top: textViewBackgroundView.topAnchor,
                        bottom: textViewBackgroundView.bottomAnchor,
                        leading: textViewBackgroundView.leadingAnchor,
                        trailing: textViewBackgroundView.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
       
        // Add X Button
        view.addSubview(cancelButton)
        cancelButton.anchor(top: textView.topAnchor,
                            bottom: nil,
                            leading: nil,
                            trailing: textView.trailingAnchor,
                            height: 40,
                            width: 40,
                            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        // Add Search Button
        view.addSubview(searchButton)
        searchButton.anchor(top: nil,
                        bottom: textView.bottomAnchor,
                        leading: nil,
                        trailing: textView.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 0, bottom: -10, right: -10))
        
        // Add Mic Button
        view.addSubview(micButton)
        micButton.anchor(top: nil,
                        bottom: textView.bottomAnchor,
                        leading: nil,
                        trailing: searchButton.leadingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 0, bottom: -10, right: -10))
        
        updateMicButtonVisibility()
    }
    
    func setupTableView() {
        
        // TableView Setup
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PrevSearchCell.self, forCellReuseIdentifier: K.Cells.prevSearchCell)
        tableView.backgroundColor = K.DesignColors.background
        
        // Add TableView
        view.addSubview(tableView)
        view.sendSubviewToBack(tableView)
        tableView.anchor(top: textView.bottomAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10))
        
        // Add Header
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        headerView.backgroundColor = .clear
        
        let headerLabel = UILabel()
        headerLabel.backgroundColor = K.DesignColors.background
        headerLabel.text = NSLocalizedString("Previous Searches", comment: "Search History")
        headerLabel.font = .systemFont(ofSize: 17, weight: .bold)
        headerLabel.textAlignment = .left
        
        headerView.addSubview(headerLabel)
        headerLabel.anchor(top: nil,
                           bottom: headerView.bottomAnchor,
                           leading: headerView.leadingAnchor,
                           trailing: headerView.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 10, left: 0, bottom: -20, right: 0))
        tableView.tableHeaderView = headerView
        
        // Add Footer
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        footerView.backgroundColor = K.DesignColors.background
        tableView.tableFooterView = footerView
        
        
    }
    
//MARK:- Selector Functions
    
    @objc func settingsButtonTapped() {
    
        Utilities.shared.settingsLauncher.parentVC = self
        Utilities.shared.settingsLauncher.showSettings()
                
    }
    
    @objc func languageButtonPressed() {
                
        let supportedLanguagesVC = SupportedLanguagesVC()
        supportedLanguagesVC.delegate = self
        
        if AzureTranslationManager.shared.supportedLanguages.count == 0 {
            
            DispatchQueue.main.async {
                self.startLoadingScreen()
            }
            
            AzureTranslationManager.shared.fetchSupportedLanguages {
                
                supportedLanguagesVC.supportedLanguages = AzureTranslationManager.shared.supportedLanguages
                
                DispatchQueue.main.async {
                    self.endLoadingScreen()
                    self.present(supportedLanguagesVC, animated: true, completion: nil)
                }
            }
        }
            
        else {
            
            supportedLanguagesVC.supportedLanguages = AzureTranslationManager.shared.supportedLanguages
                        
            self.present(supportedLanguagesVC, animated: true, completion: nil)
            
        }
    }
    
    @objc func swapButtonPressed(_ sender: UIButton) {
        
        DispatchQueue.main.async {
            
            // Retrieve Subviews
            let subviews = self.langStackView.arrangedSubviews
            
            let sub0 = subviews[0]
            let sub1 = subviews[1]
            let sub2 = subviews[2]
            
            // Change Search Type and If Necessary, Change English HD to English
            switch self.searchInfo.searchType {
            
            case .englishToNative:
                self.searchInfo.searchType = .nativeToEnglish
                
            case .nativeToEnglish:
                self.searchInfo.searchType = .englishToNative

            }
            
            // Clear Subviews
            for subview in self.langStackView.arrangedSubviews {
                self.langStackView.removeArrangedSubview(subview)
            }
            
            // Add Subviews Flipped
            self.langStackView.addArrangedSubview(sub2)
            self.langStackView.addArrangedSubview(sub1)
            self.langStackView.addArrangedSubview(sub0)
            
        }
        
        // Swap Source And Target Language Codes and Names
        let tempSourceCode = searchInfo.sourceLanguageCode
        searchInfo.sourceLanguageCode = searchInfo.targetLanguageCode
        searchInfo.targetLanguageCode = tempSourceCode
        
        let tempSourceName = searchInfo.sourceLanguageName
        searchInfo.sourceLanguageName = searchInfo.targetLanguageName
        searchInfo.targetLanguageName = tempSourceName
        
    }
    
    @objc func cancelButtonPressed() {
        textView.text = ""
        textView.textColor = .lightGray
        textView.text = NSLocalizedString("Enter text", comment: "enter the text you want to  search here")
        cancelButton.isHidden = true
    }
    
    @objc func recordPressed() {
        
        let vc = SpeechToTextController()
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        vc.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: self.fetchLocale()))!
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @objc func searchPressed() {
        if textView.text != nil && textView.text.count > 0 {
            textView.resignFirstResponder()
            startSearchSequence(searchText: textView.text!, searchInfo)
        }
    }
    
}

// MARK:- UITextView Delegate Methods

extension SearchController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        DispatchQueue.main.async {
            
            if textView.textColor == .lightGray {
                textView.text = ""
                textView.textColor = .black
                self.cancelButton.isHidden = false
            }
            
        }
    }

    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        DispatchQueue.main.async {
            
            if textView.text.isEmpty || textView.text == "" {
                textView.textColor = .lightGray
                textView.text = NSLocalizedString("Enter text", comment: "enter the text you want to  search here")
                self.cancelButton.isHidden = true
            }
            
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            
            // Make sure textView is not Empty
            if textView.text != nil && textView.text.count > 0 {
                
                textView.resignFirstResponder()
                
                startSearchSequence(searchText: textView.text!, searchInfo)
                
            }
            return false
        }
        return true
    }

}

//MARK:- UITableView Data Source Methods

extension SearchController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let user = Utilities.shared.user {
            
            return user.prevSearches.count
        }
        
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.prevSearchCell) as! PrevSearchCell
        
        guard let prevSearches = Utilities.shared.user?.prevSearches else { return cell }
        
        cell.populateCell(topLabelText: prevSearches[indexPath.row].searchText, bottomLabelText: prevSearches[indexPath.row].resultText)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }


}

//MARK:- UITableView Delegate Methods

extension SearchController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if noNetworkConnectionView.isHidden == false {
            showCannotSearchAlert()
            return 
        }
        
        if let searchAndResult = Utilities.shared.user?.prevSearches[indexPath.row] {
            
            let searchType: SearchType = searchAndResult.searchInfo.searchType == 0 ? .nativeToEnglish : .englishToNative
            
            let searchInfo = SearchInfo(searchType: searchType,
                                        sourceLanguageCode: searchAndResult.searchInfo.sourceLanguageCode,
                                        sourceLanguageName: searchAndResult.searchInfo.sourceLanguageName,
                                        targetLanguageCode: searchAndResult.searchInfo.targetLanguageCode,
                                        targetLanguageName: searchAndResult.searchInfo.targetLanguageName)
            
            startSearchSequence(searchText: searchAndResult.searchText, searchInfo)
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        textView.resignFirstResponder()
    }
    
}

//MARK:- Language Selection Functions

extension SearchController: SupportedLanguagesDelegate, ResultsControllerDelegate {
    
    func updateLanguageStackView(searchInfo: SearchInfo) {
        
        self.searchInfo = searchInfo
        
        DispatchQueue.main.async {
            
            for view in self.langStackView.arrangedSubviews {
                self.langStackView.removeArrangedSubview(view)
            }
            
            switch self.searchInfo.searchType {
            
            case .englishToNative:
                self.langStackView.addArrangedSubview(self.englishLabel)
                self.englishLabel.text = "English HD"
                
                self.langStackView.addArrangedSubview(self.swapButton)
                
                self.langStackView.addArrangedSubview(self.languageButton)
                self.languageButton.setTitle(self.searchInfo.targetLanguageName, for: .normal)
                
            case .nativeToEnglish:
                self.langStackView.addArrangedSubview(self.languageButton)
                self.languageButton.setTitle(self.searchInfo.sourceLanguageName, for: .normal)
                
                self.langStackView.addArrangedSubview(self.swapButton)
                
                self.langStackView.addArrangedSubview(self.englishLabel)
                self.englishLabel.text = "English HD"
            }
            
        }
    }
    
    func updateLanguageCodes(languageName: String, languageCode: String) {
        
        switch searchInfo.searchType {
            
        case .englishToNative:
            searchInfo.targetLanguageCode = languageCode
            searchInfo.targetLanguageName = languageName
            
        case .nativeToEnglish:
            searchInfo.sourceLanguageCode = languageCode
            searchInfo.sourceLanguageName = languageName
            
        }
        
        languageButton.setTitle(languageName, for: .normal)
    }
    
    func setupLangButtonFromUserDefault() {
        
        if let langCode = UserDefaults.standard.object(forKey: K.UserDefaultKeys.langCode) as? String,
            let langName = UserDefaults.standard.object(forKey: K.UserDefaultKeys.langName) as? String {
            
            languageButton.setTitle(langName, for: .normal)
            searchInfo.sourceLanguageCode = langCode
            searchInfo.sourceLanguageName = langName
            
        }
        
        else {
            
            UserDefaults.standard.set("en", forKey: K.UserDefaultKeys.langCode)
            UserDefaults.standard.set("English", forKey: K.UserDefaultKeys.langName)
            
            languageButton.setTitle("English", for: .normal)
            searchInfo.sourceLanguageCode = "en"
            searchInfo.sourceLanguageName = "English"
            
        }
    }
}

// MARK:- Search Sequence Functions

extension SearchController {
    
    func startSearchSequence(searchText: String,_ searchInfo: SearchInfo, ipaIndex: Int = 0) {
        
        AnalyticsManager.shared.logSearch(searchTerm: searchText)
        
        //Update Search Count
        AdManager.shared.updateSearchCount()
        
        //Update Search Input Variable
        self.searchInput = searchText
        
        //Update Global SearchInfo
        self.searchInfo = searchInfo
        
        // Set Language Codes
        AzureTranslationManager.shared.sourceLanguageCode = searchInfo.sourceLanguageCode
        AzureTranslationManager.shared.targetLanguageCode = searchInfo.targetLanguageCode
        
        // Clear Results Array and Other Data
        results = []
        wordArray = []
        bottomLabelText = ""
        wordModelArray = []
        learnMoreArray = []
        dictionaryResult = [:]
        isFullyMatched = true
        
        // Update Query Text
        bottomLabelText = searchText
        
        // Start Loading Screen
        DispatchQueue.main.async {
            self.startLoadingScreen()
        }
        
        // Create And Enter Dispatch Group For Tranlsation Request
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        // 1. Translate
        // 2. Color Words
        runSearchsequence(searchText: searchText) { (searchStatus) in
            
            self.searchStatus = searchStatus
            
            switch searchStatus {
                
            case .success,
                 .missingSomeWordModels,
                 .emptyTranslationMissingSomeWordModels,
                 .emptyTranslationWithAllWordModels:
                
                // Populate Results Array with ColorResultModel
                for (word,wordModel) in zip(self.wordArray, self.wordModelArray) {
                    
                    // If  Word Model Exists, add colored word and audio to result
                    if let wordModel = wordModel {
                        
                        // Take only the first ipa spelling for for the Results Array
                        if let ipa = wordModel.ipa[ipaIndex] {
                            
                            // Add Colored Text
                            let audio = (0 < wordModel.audio.count ? wordModel.audio[ipaIndex] : nil)
                            let coloringResult = WordColoringManager.shared.colorWord(word: wordModel.id, ipa: ipa)
                            var text = coloringResult.0
                            text = text.setCapitalLetters(from: word).replaceSpecialCharacters(from: word)
                            self.results.append(ColorResultModel(attributedText: text, audioString: audio, ipa: ipa, isColored: true))
                            
                            // If Text Colored Incorrectly Update isFullyMatched
                            if !coloringResult.1 {
                                self.isFullyMatched = false
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
        
        // Enter Dispatch Group Again For Dictionary Request
        if !(AzureTranslationManager.shared.sourceLanguageCode == "en" && AzureTranslationManager.shared.targetLanguageCode == "en") {
            
            dispatchGroup.enter()
            AzureTranslationManager.shared.fetchDictionaryTranslations { (dictionaryResult) in
                
                self.dictionaryResult = dictionaryResult
                dispatchGroup.leave()
                
            }
            
        }
        
        // When Both Network Tasks Finish
        dispatchGroup.notify(queue: .main) {
            
            // End Loading Screen
            DispatchQueue.main.async {
                self.endLoadingScreen()
                self.goToResultsVC(searchInfo: searchInfo)
            }
        }
    }
    
    func runSearchsequence(searchText: String, completion: @escaping(_ status: SearchStatus) -> Void) {
        
        switch searchInfo.searchType {
        
        case .nativeToEnglish:
            
            // If source Lang is English, Retrieve word models from database
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
        
    func goToResultsVC(searchInfo: SearchInfo) {
        
        // Initialize result controller
        let resultsController = ResultsController()
        
        // Populate result controller data
        resultsController.delegate = self
        resultsController.searchInfo = searchInfo
        resultsController.bottomLabelText = self.bottomLabelText
        resultsController.ipaIndex = 0
        resultsController.wordArray = self.wordArray
        resultsController.wordModelArray = self.wordModelArray
        resultsController.results = self.results
        resultsController.dictionaryResult = self.dictionaryResult
        resultsController.learnMoreArray = self.learnMoreArray
        resultsController.textView.text = self.searchInput
        resultsController.searchStatus = self.searchStatus
        resultsController.isFullyMatched = self.isFullyMatched
        resultsController.searchInput = self.searchInput
        resultsController.searchOutput = self.searchOutput
        resultsController.checkForColorError()
        
        // Update search history
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
                self.tableView.reloadData()
                
            }
            
        }
        
        // Create sound it out buttons for result controller
        if results.count == 1 {
            
            resultsController.soundItOutColors = createButtons(results[0].attributedText)
        
        } else { resultsController.soundItOutColors = [] }
        
        // Push Result Controller
        navigationController?.pushViewController(resultsController, animated: true)
        
    }
}

extension SearchController: AddSearchHistoryDelegate {
    
    func updateSearchHistory() {
        
        if !isShowing() {
            self.shouldRefresh = true
            return
        }
        
        self.shouldRefresh = false
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
            if Utilities.shared.user == nil || Utilities.shared.user?.prevSearches.count == 0 {
                
                self.tableView.isHidden = true
                
            } else { self.tableView.isHidden = false}
        }
        

        
    }
}

extension SearchController: SpeechToTextDelegate {
    
    func updateText(with transcription: String, shouldPerformSearch: Bool) {
        
        textView.textColor = .black
        textView.text = transcription
        cancelButton.isHidden = false
        
        if shouldPerformSearch {
            startSearchSequence(searchText: transcription, searchInfo)
        }
    }
    
}

extension SearchController: NetworkConnectionUpdater {
    
    func setInterfaceForNetworkConnection() {
        noNetworkConnectionView.isHidden = true
    }
    
    func setInterfaceForNoNetworkConnection() {
        noNetworkConnectionView.isHidden = false
        view.bringSubviewToFront(noNetworkConnectionView)
    }
    
}
