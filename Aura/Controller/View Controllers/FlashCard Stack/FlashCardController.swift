//
//  FlashCardController.swift
//  Aura
//
//  Created by Max Dolensky on 7/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class FlashCardController: UIViewController {

    // MARK: - Views
    var shouldRefresh: Bool = true
    
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
    
    var centerTitle: UILabel = {
       
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 30))
        label.backgroundColor = .clear
        label.font = UIFont(name: K.Fonts.avenirBlack, size: 17)
        label.text = NSLocalizedString("Decks", comment: "")
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    var mainScrollView = VerticalScrollView(frame: .zero)
    
    var createNewDeckButton: UIView = {
        
        let background = UIView()
        
        let view = UIView()
        view.backgroundColor = .white
        
        let container = UIView()
        container.backgroundColor = .white
        
        let imageView = UIImageView()
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "plus.circle.fill")
        } else {
            imageView.image = #imageLiteral(resourceName: "plus.circle").withRenderingMode(.alwaysTemplate)
        }
        imageView.tintColor = K.DesignColors.primary
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let constant = UIScreen.main.bounds.width > 320 ? 40 : 30
        imageView.heightAnchor.constraint(equalToConstant: CGFloat(constant)).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: CGFloat(constant)).isActive = true
        imageView.contentMode = .scaleAspectFit
        
        
        let label = UILabel()
        label.text = NSLocalizedString("Create New Deck", comment: "")
        if UIScreen.main.bounds.width > 320 {
            label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        } else {
            label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        }
        
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        
        let button: AnimatedButton = {
            
            let b = AnimatedButton(frame: .zero)
            b.backgroundColor = .clear
            b.addTarget(self, action: #selector(createNewDeck(_:)), for: .touchUpInside)
            return b
            
        }()
        
        container.addSubview(imageView)
        container.addSubview(label)
        
        imageView.anchor(top: container.topAnchor,
                         bottom: container.bottomAnchor,
                         leading: container.leadingAnchor,
                         trailing: nil,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0))
        
        label.anchor(top: container.topAnchor,
                     bottom: container.bottomAnchor,
                     leading: imageView.trailingAnchor,
                     trailing: container.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 20, left: 20, bottom: -20, right: 0))
        

        view.roundCorners(cornerRadius: 10)
        
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor).isActive = true
        container.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true
        container.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        background.addSubview(view)
        
        view.anchor(top: background.topAnchor,
                    bottom: background.bottomAnchor,
                    leading: background.leadingAnchor,
                    trailing: background.trailingAnchor,
                    height: nil,
                    width: nil)
        
        view.addSubview(button)
        
        button.anchor(top: view.topAnchor,
                      bottom: view.bottomAnchor,
                      leading: view.leadingAnchor,
                      trailing: view.trailingAnchor,
                      height: nil,
                      width: nil)
                
        return background
        
    }()
    
    var popularFlashcardScrollView: PopularDecksScrollView!
    
    var popularFlashcardLabel: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("Popular Flashcards", comment: "")
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
        
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
    
    // MARK: - INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        //DeckCreater.shared.createDeck(deckName: "California Slang", translationLang: "ja")
//        Utilities.shared.addPurchasesAndDecksSoIDontHaveTo()
    }
    
    override func viewDidLayoutSubviews() {
        
        createNewDeckButton.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
        
        for v in popularFlashcardScrollView.stackView.subviews {
            v.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
        }
        
        for v in myDecksScrollView.stackView.subviews {
            v.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if shouldRefresh {
            updateMyDecksDisplay()
        }
        
        if UserDefaults.standard.bool(forKey: "hasEnteredDeckController") {
            return
        } else {
            AdManager.shared.showAdPopUP(parentVC: self)
            UserDefaults.standard.set(true, forKey: "hasEnteredDeckController")
        }
    }
    
    // MARK: - Setup
    func setup() {
        
        NetworkManager.shared.deckDelegate = self
        Utilities.shared.decksDelegate = self
        
        view.backgroundColor = K.DesignColors.background
        
        view.addSubview(noNetworkConnectionView)
        
        noNetworkConnectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                       bottom: view.bottomAnchor,
                                       leading: view.leadingAnchor,
                                       trailing: view.trailingAnchor,
                                       height: nil,
                                       width: nil)
        
        // Setup Navigation Bar
        self.navigationItem.titleView = centerTitle
        
        // Add UserButton
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
            popularFlashcardScrollView = PopularDecksScrollView(frame: .zero, decks: decks)
            popularFlashcardScrollView.popularDeckDelegate = self
        } else {
            popularFlashcardScrollView = PopularDecksScrollView(frame: .zero)
            popularFlashcardScrollView.popularDeckDelegate = self
            
            FirebaseManager.shared.loadSuperUser()
        }
        
        view.addSubview(mainScrollView)
        mainScrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              bottom: view.bottomAnchor,
                              leading: view.leadingAnchor,
                              trailing: view.trailingAnchor,
                              height: nil,
                              width: nil)
        
        // Add Create New Deck Button
        mainScrollView.stackView.addArrangedSubview(createNewDeckButton, withMargin: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(popularFlashcardLabel, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(popularFlashcardScrollView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(myDecksLabel, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        mainScrollView.stackView.addArrangedSubview(myDecksScrollView, withMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        
        if !NetworkManager.shared.isConnected && Utilities.shared.user == nil{
            noNetworkConnectionView.isHidden = false
            view.bringSubviewToFront(noNetworkConnectionView)
        }
        
        if let decks = Utilities.shared.user?.decks, decks.count > 0  {
            // do nothing
        } else {
            myDecksLabel.superview?.isHidden = true
        }
    }
    
    //MARK: - Selector Functions
    @objc func settingsButtonTapped() {
    
        Utilities.shared.settingsLauncher.parentVC = self
        Utilities.shared.settingsLauncher.showSettings()
                
    }
    
    @objc func createNewDeck(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            sender.superview?.transform = .identity
            sender.superview?.superview?.layer.shadowOpacity = 0.3
        }
        
        var textField = UITextField()
        
        // Main Alert
        let alert = UIAlertController(title: NSLocalizedString("Add New Flashcard Deck", comment: ""), message: "", preferredStyle: .alert)
        
        // Action: Create New Deck
        let action = UIAlertAction(title: NSLocalizedString("Add Deck", comment: ""), style: .default) { (action) in
            
            if textField.text != nil && textField.text!.count > 0 {
                
                let newDeckName = Utilities.shared.getUniqueDeckName(from: textField.text!, given: Utilities.shared.user!.decks)
                
                // Create New Deck And Save To Firebase
                let newDeck = DeckModel(name: newDeckName)
                Utilities.shared.user?.decks.append(newDeck)
                
                FirebaseManager.shared.updateUser(user: Utilities.shared.user!)
                
            }
        }
        
        // Action: Cancel
        let action1 = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default) { (action) in
            return
        }
        
        // Add TextField to alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = NSLocalizedString("Deck Name", comment: "")
            textField = alertTextField
        }
        
        // Add Actions and Present
        alert.addAction(action)
        alert.addAction(action1)
        present(alert, animated: true, completion: nil)
        
    }
}

extension FlashCardController: FirebaseUpdaterDelegate {
    
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
}

extension FlashCardController: MyDeckScrollViewDelegate, PopularDeckScrollViewDelegate {
    
    func goToDeck(deckIndex: Int) {
        let vc = DeckController()
        vc.myDeck = Utilities.shared.user?.decks[deckIndex]
        vc.myDeckIndex = deckIndex
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showPurchasePopUp(deckIndex: Int) {
        print("purchase?")
        let alert = UIAlertController(title: NSLocalizedString("Coming Soon!", comment: ""), message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: "ok, I acknowledge the action (for example successfully signing out) that just happened. When I press ok, the alert will go away and I can continue doing what I am doing in the app"), style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func goToDeckController(deckIndex: Int) {
        // Already in DeckController, so this method won't be called from here
        // But we need to implement it to conform to the protocol
        print("Already in DeckController")
    }
    
}

extension FlashCardController: NetworkConnectionUpdater {
    
    func setInterfaceForNetworkConnection() {
        noNetworkConnectionView.isHidden = true
        updateMyDecksDisplay()
        updatePopularDecksDisplay()
    }
    
    func setInterfaceForNoNetworkConnection() {
        
        if Utilities.shared.user == nil {
            noNetworkConnectionView.isHidden = false
            view.bringSubviewToFront(noNetworkConnectionView)
        }
        
    }
    
}
