//
//  HomeViewController.swift
//  Aura
//
//  Created by Max Dolensky on 7/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    var mainScrollView = VerticalScrollView(frame: .zero)
    var shouldRefresh: Bool = false
    
    var noNetworkConnectionView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        
        let container = UIView()
        
        let l = UILabel()
        l.text = NSLocalizedString("Connect to the internet", comment: "Cannot connect to the internet")
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        l.textColor = .gray
        
        let l1 = UILabel()
        l1.text = NSLocalizedString("You're offline. Check your connection", comment: "Cannot connect to the internet")
        l1.textAlignment = .center
        l1.font = UIFont.systemFont(ofSize: 17, weight: .regular)
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
        iv.widthAnchor.constraint(equalToConstant: 160).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 160).isActive = true
        iv.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        l.anchor(top: iv.bottomAnchor,
                 bottom: nil,
                 leading: container.leadingAnchor,
                 trailing: container.trailingAnchor,
                 height: nil,
                 width: nil,
                 padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        
        l1.anchor(top: l.bottomAnchor,
                  bottom: container.bottomAnchor,
                  leading: container.leadingAnchor,
                  trailing: container.trailingAnchor,
                  height: nil,
                  width: nil,
                  padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        v.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: v.centerYAnchor, constant: -30).isActive = true
        
        v.isHidden = true
        
        return v
    }()
    
    var titleLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 30))
        label.backgroundColor = .clear
        label.font = UIFont(name: K.Fonts.avenirBlack, size: 17)
        label.text = "Aura"
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
        
    var discoverEHDView: UIView = {
        
        let container = UIView()
        
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Discover")
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .white
        iv.roundCorners(cornerRadius: 20)
        
        container.addSubview(iv)
        iv.anchor(top: container.topAnchor,
                      bottom: container.bottomAnchor,
                      leading: container.leadingAnchor,
                      trailing: container.trailingAnchor,
                      height: nil,
                      width: nil)
        
        let b = AnimatedButton(frame: .zero)
        b.addTarget(self, action: #selector(discoverPressed(_:)), for: .touchUpInside)
        
        container.addSubview(b)
        b.anchor(top: container.topAnchor,
                 bottom: container.bottomAnchor,
                 leading: container.leadingAnchor,
                 trailing: container.trailingAnchor,
                 height: nil,
                 width: nil)
        
        return container
        
    }()
    
    var whereToStartLabel: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Where to Start", comment: "")
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
        
    }()
    
    var searchView: UIView = {
        
        let background = UIView()
        
        let container = UIView()
        container.backgroundColor = .white
        
        let l = UILabel()
        l.text = NSLocalizedString("Search", comment: "")
        l.textAlignment = .left
        l.textColor = K.DesignColors.primary
        l.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        let iv = UIImageView()
        
        if #available(iOS 13, *) {
            iv.image = UIImage(systemName: "magnifyingglass")
        } else {
            iv.image = #imageLiteral(resourceName: "Search1").withRenderingMode(.alwaysTemplate)
        }
        
        iv.tintColor = K.DesignColors.primary
        
        iv.contentMode = .scaleAspectFit
                
        container.addSubview(l)
        container.addSubview(iv)
        
        l.anchor(top: container.topAnchor,
                 bottom: container.bottomAnchor,
                 leading: container.leadingAnchor,
                 trailing: nil,
                 height: nil,
                 width: nil,
                 padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 24).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iv.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        iv.centerYAnchor.constraint(equalTo: l.centerYAnchor).isActive = true
        
        background.addSubview(container)
        
        container.anchor(top: background.topAnchor,
                         bottom: background.bottomAnchor,
                         leading: background.leadingAnchor,
                         trailing: background.trailingAnchor,
                         height: nil,
                         width: nil)
        
        container.roundCorners(cornerRadius: 10)
        
        let b = AnimatedButton(frame: .zero)
        b.addTarget(self, action: #selector(searchPressed(_:)), for: .touchUpInside)
        
        background.addSubview(b)
        b.anchor(top: background.topAnchor,
                 bottom: background.bottomAnchor,
                 leading: background.leadingAnchor,
                 trailing: background.trailingAnchor,
                 height: nil,
                 width: nil)
        
        return background
        
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
    
    var popularFlashcardLabel: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Popular Flashcards", comment: "popular flashcard decks for sale")
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
        
    }()
    
    var popularFlashcardScrollView: PopularDecksScrollView!
    
    var lessonsLabel: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Lessons", comment: "Course video lessons")
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
        
    }()
    
    var lessonsScrollView = LessonsScrollView(frame: .zero)
    
    var myDecksLabel: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("My Decks", comment: "The flashcard decks I have created")
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
        
    }()
    
    var myDecksScrollView: MyDecksScrollView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseManager.shared.loadLessons()
        setup()
        resetDefaultsForAppUpdate1_18()
        //populateLessonsDB()
        //getMatches(for: "ɪ", letterCombo: "oi")
        
//        FOR TESTING
//        AdManager.shared.funnelProgress = .hasNotSeenVideo1
//        UserDefaults.standard.set(false, forKey: "hasLaunchedHome")
//        UserDefaults.standard.setValue(0, forKey: "searchCount")
//        UserDefaults.standard.setValue(false, forKey: "hasEnteredDeckController")
//        UserDefaults.standard.set(false, forKey: "hasLaunchedFlashcards")
//        UserDefaults.standard.set(false, forKey: "hasSeenDeckSelector")
//        UserDefaults.standard.set(false, forKey: "hasClickedLock")
//        UserDefaults.standard.removeObject(forKey: "currentVideoPosition")
//        FirebaseManager.shared.loadUserWhoPurchased()
//        UserDefaults.standard.set(false, forKey: "hasClickedKYGLock")
    }
    
    override func viewDidLayoutSubviews() {
        
        discoverEHDView.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 10)

        searchView.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 10)

        introVideoView.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 10)
        
        for v in popularFlashcardScrollView.stackView.subviews {
            v.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
        }
        
        for v in lessonsScrollView.stackView.subviews {
            v.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
        }
        
        for v in myDecksScrollView.stackView.subviews {
            v.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
        }
        
        playView.setShadow(color: .black, opacity: 0.7, offset: CGSize(width: 5, height: 5), radius: 5, cornerRadius: 30)
    }
    
    override func viewDidAppear(_ animated: Bool) {
         
        if shouldRefresh {
            updateMyDecksDisplay()
        }
        
        if UserDefaults.standard.bool(forKey: "hasLaunchedHome") {
            return
        } else {
            let popUpManager = SeminarPopUpManager()
            popUpManager.showPopUpFadingIn()
            UserDefaults.standard.set(true, forKey: "hasLaunchedHome")
        }
    }
    
    func resetDefaultsForAppUpdate1_18() {
        
        if UserDefaults.standard.bool(forKey: "isFirstLaunchOfVersion1_18") {
            return
        } else {
            if !(Utilities.shared.user != nil && Utilities.shared.user!.purchases[K.productNames.ehdMasterCourse] == true) {
                AdManager.shared.funnelProgress = .hasNotSeenVideo1
                UserDefaults.standard.set(false, forKey: "hasLaunchedHome")
                UserDefaults.standard.setValue(0, forKey: "searchCount")
                UserDefaults.standard.setValue(false, forKey: "hasEnteredDeckController")
                UserDefaults.standard.set(false, forKey: "hasLaunchedFlashcards")
                UserDefaults.standard.set(false, forKey: "hasSeenDeckSelector")
                UserDefaults.standard.set(false, forKey: "hasClickedLock")
                UserDefaults.standard.removeObject(forKey: "currentVideoPosition")
                UserDefaults.standard.set(true, forKey: "isFirstLaunchOfVersion1_18")
            } else {
                AdManager.shared.funnelProgress = .completedVideo1Bought
                UserDefaults.standard.set(true, forKey: "isFirstLaunchOfVersion1_18")
            }
        }
    }
    
    func setup() {
        
        NetworkManager.shared.homeDelegate = self
        Utilities.shared.homeDelegate = self
        AdManager.shared.homeDelegate = self
        
        view.backgroundColor = K.DesignColors.background
        view.addSubview(noNetworkConnectionView)
        
        noNetworkConnectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                       bottom: view.bottomAnchor,
                                       leading: view.leadingAnchor,
                                       trailing: view.trailingAnchor,
                                       height: nil,
                                       width: nil)
        
        // Add Center Title
        self.navigationItem.titleView = titleLabel
        
        // Add Settings Button
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
        self.navigationController?.navigationBar.isTranslucent = false

        // Configure navigation bar appearance for iOS 13+
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = K.DesignColors.primary
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
            self.navigationController?.navigationBar.compactAppearance = appearance
        } else {
            self.navigationController?.navigationBar.barTintColor = K.DesignColors.primary
        }
        
        // Initialize My Decks Scroll View
        if let decks = Utilities.shared.user?.decks {
            myDecksScrollView = MyDecksScrollView(frame: .zero, decks: decks)
            myDecksScrollView.myDeckDelegate = self
        } else {
            myDecksScrollView = MyDecksScrollView(frame: .zero)
            myDecksScrollView.myDeckDelegate = self
        }
        
        // Initialize Popular Decks Scroll View
        if let decks = Utilities.shared.superUser?.decks {
            popularFlashcardScrollView = PopularDecksScrollView(frame: .zero, decks: decks, isFromHomeController: true)
            popularFlashcardScrollView.popularDeckDelegate = self
        } else {
            popularFlashcardScrollView = PopularDecksScrollView(frame: .zero, decks: [], isFromHomeController: true)
            popularFlashcardScrollView.popularDeckDelegate = self
            
            FirebaseManager.shared.loadSuperUser()
        }
        
        // Initialize Lessons Scroll View
        lessonsScrollView.lessonsScrollViewDelegate = self
        if let lessons = Utilities.shared.lessons {
            lessonsScrollView.lessons = lessons
            lessonsScrollView.updateLessons()
        } else {
            FirebaseManager.shared.loadLessons()
        }
        
        view.addSubview(mainScrollView)
        mainScrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              bottom: view.bottomAnchor,
                              leading: view.leadingAnchor,
                              trailing: view.trailingAnchor,
                              height: nil,
                              width: nil)
        
        mainScrollView.stackView.addArrangedSubview(discoverEHDView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(searchView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(popularFlashcardLabel, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(popularFlashcardScrollView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(lessonsLabel, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(lessonsScrollView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(myDecksLabel, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(myDecksScrollView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        
        discoverEHDView.translatesAutoresizingMaskIntoConstraints = false
        discoverEHDView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        introVideoView.translatesAutoresizingMaskIntoConstraints = false
        introVideoView.heightAnchor.constraint(equalToConstant: 175).isActive = true
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
        
        popularFlashcardScrollView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        lessonsScrollView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        myDecksScrollView.heightAnchor.constraint(equalToConstant: 100).isActive = true
                        
        // Update My Decks Visibility
        myDecksScrollView.updateVisibility()
        if myDecksScrollView.decks.count == 0 {
            myDecksLabel.superview?.isHidden = true
        }
        
        // Update Popular Decks Visibility
        popularFlashcardScrollView.updateVisibility()
        if popularFlashcardScrollView.decks.count == 0 {
            popularFlashcardLabel.superview?.isHidden = true
        }
        
        if !NetworkManager.shared.isConnected {
            noNetworkConnectionView.isHidden = false
            view.bringSubviewToFront(noNetworkConnectionView)
        }
    }
    
    func populatePopularFlashcards(decks: [DeckModel]) {
                
        for _ in 0...3 {
            
            let background = UIView()
            
            let container = UIView()
            container.backgroundColor = .white
            container.roundCorners(cornerRadius: 10)
            
            background.addSubview(container)
            container.anchor(top: background.topAnchor,
                             bottom: background.bottomAnchor,
                             leading: background.leadingAnchor,
                             trailing: background.trailingAnchor,
                             height: nil,
                             width: nil)
            
            background.translatesAutoresizingMaskIntoConstraints = false
            background.widthAnchor.constraint(equalToConstant: 200).isActive = true
            background.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            
            popularFlashcardScrollView.stackView.addArrangedSubview(background)
            
        }
        
    }
    
    @objc func discoverPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
            
        } completion: { (_) in
            
            self.tabBarController?.selectedIndex = 2
            
        }
        
    }
        
    @objc func searchPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
            
        } completion: { (_) in
            
            self.tabBarController?.selectedIndex = 1
            
        }
         
    }
                    
    @objc func settingsButtonTapped() {
    
        Utilities.shared.settingsLauncher.parentVC = self
        Utilities.shared.settingsLauncher.showSettings()
                
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
}

extension HomeController: MyDeckScrollViewDelegate, PopularDeckScrollViewDelegate, LessonsScrollViewDelegate {
    
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
    
    func showPurchasePopUp(deckIndex: Int) {
        print("purchase?")
        let alert = UIAlertController(title: NSLocalizedString("Coming Soon!", comment: "You cannot purchase this yet, it is coming soon"), message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: "ok, I acknowledge the action (for example successfully signing out) that just happened. When I press ok, the alert will go away and I can continue doing what I am doing in the app"), style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func goToDeckController(deckIndex: Int) {
        // Navigate to DeckController (FlashCard tab)
        let tabVC = self.tabBarController
        tabVC?.selectedIndex = 3 // Assuming FlashCard tab is at index 2
        
        // Optional: Pass the selected deck index to the controller if needed
        // You can implement additional logic here to show the specific deck
        print("Navigating to DeckController with deck index: \(deckIndex)")
    }
    
    func goToLesson(lessonIndex: Int) {
        let tabVC = self.tabBarController
        tabVC?.selectedIndex = 4
        
        let vc = tabVC!.viewControllers![4] as! UINavigationController
        let lessonVC = vc.children.first as! LessonsController
        lessonVC.scrollViewIndex = lessonIndex
        lessonVC.scrollToPage(page: lessonIndex, animated: true)
        
        
    }
    
}

extension HomeController: FirebaseUpdaterDelegate {
    
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
    
    func updatePopularDecksDisplay() {
        
        guard let decks = Utilities.shared.superUser?.decks else { return }
        
        popularFlashcardScrollView.decks = decks
        popularFlashcardScrollView.updateDecks()
        popularFlashcardScrollView.updateVisibility()
        
        if decks.count == 0 {
            popularFlashcardLabel.superview?.isHidden = true
        } else { popularFlashcardLabel.superview?.isHidden = false }
        
    }
    
    func updateLessonsDisplay() {
        guard let lessons = Utilities.shared.lessons else { return }
        lessonsScrollView.lessons = lessons
        lessonsScrollView.updateLessons()
    }
    
}


// MARK: - Find Specific Letter Combo Matches
extension HomeController {
    
    func getMatches(for ipaLetter: String, letterCombo: String) {
        
        var count = 0
        var arr = [[String]]()
        
        // Get File URL
        guard let fileURL = Bundle.main.url(forResource: "finalWordAndIPA", withExtension: "txt") else {
            return
        }
        
        // Get Contents of File URL
        guard let data = try? String(contentsOf: fileURL) else {
            return
        }
        
        // Break up document line by line
        let lines = data.components(separatedBy: "\n")
        
        for line in lines {
            
            // Get Word And IPA
            let wordAndIPA = line.components(separatedBy: " ")
            
            // Check there is a word and IPA
            if wordAndIPA.count != 2 {
                continue
            }
            
            // Check if ipa and word contains ipaLetter and letterCombo
            if !(wordAndIPA[0].contains(letterCombo) && wordAndIPA[1].contains(ipaLetter)) {
                continue
            }
            
            let wordArray = WordColoringManager.shared.getWordArray(word: wordAndIPA[0], ipa: wordAndIPA[1])
            let indices = wordAndIPA[0].indicesOf(string: letterCombo)
            
            for index in indices {
                var isMatch = true
                for i in index..<(index + letterCombo.count) {
                    if wordArray[i].ipaParent != ipaLetter {
                        isMatch = false
                    }
                }
                if isMatch {
                    arr.append(wordAndIPA)
                    count += 1
                }
            }
        }
        
        arr.sort {
            $0[0].count < $1[0].count
        }
        
        print("\n\n----------RESULTS----------\n")
        print("Number of Matches Found: \(count)\n")
        
        for wordAndIpa in arr {
            print(wordAndIpa[0], wordAndIpa[1])
        }
    }
}


// MARK: - AdManagerDelegate
extension HomeController: AdManagerDelegate {
    
    func updateSecretsThumbnail() {
        introImageView.loadImageUsingCacheWithURLString(
            urlString: AdManager.shared.getFunnelThumbnailURLForCurrentUserState()
        )
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

extension HomeController: NetworkConnectionUpdater {
    
    func setInterfaceForNetworkConnection() {
        noNetworkConnectionView.isHidden = true
        updateLessonsDisplay()
        updateSecretsThumbnail()
        updateMyDecksDisplay()
        updatePopularDecksDisplay()
    }
    
    func setInterfaceForNoNetworkConnection() {
        noNetworkConnectionView.isHidden = false
        view.bringSubviewToFront(noNetworkConnectionView)
    }
    
}
