//
//  DeckSelectingController.swift
//  Aura
//
//  Created by Max Dolensky on 8/9/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class DeckSelectingController: UIViewController {

    //MARK: - Data
    var bottomLabelText = ""
    var ipaIndex = 0
    var wordArray = [String]()
    var wordModelArray = [WordModel?]()
    
    //MARK: - SubViews
    let tableView = UITableView()
    
    let newDeckButton: UIButton = {
        
        let button = UIButton()
        
        button.tintColor = .white
        button.backgroundColor = K.DesignColors.primary
        button.titleLabel?.backgroundColor = K.DesignColors.primary
        button.setTitleColor(.white, for: .normal)
       
        button.setTitle(NSLocalizedString("NEW DECK", comment: "new flashcard deck to save cards to"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        
        button.roundCorners(cornerRadius: 20)
        button.addTarget(self, action: #selector(newDeckPressed(_:)), for: .touchUpInside)
        
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return button
        
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
        
    }()
    
    let cancelButton: UIButton = {
        
        let button = UIButton()
        
        button.tintColor = .black
        button.backgroundColor = .clear
        button.titleLabel?.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        
        button.setTitle(NSLocalizedString("cancel", comment: ""), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        button.titleLabel?.textAlignment = .left

        button.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)

        return button
        
    }()
    
    // MARK: - INIT
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "hasSeenDeckSelector") {
            return
        } else {
            AdManager.shared.showAdPopUP(parentVC: self)
            UserDefaults.standard.set(true, forKey: "hasSeenDeckSelector")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Setup
    func setup() {
        
        view.backgroundColor = .clear
        
        let text = wordArray.joined(separator: " ")
        let attText1 = NSMutableAttributedString(string: NSLocalizedString("Add ", comment: "Add (word) to your flashcard deck"))
        let attText2 = NSMutableAttributedString(string: "\"\(text)\" ")
        let attText3 = NSMutableAttributedString(string: NSLocalizedString("to deck", comment: "Add (word) to your flashcard deck"))
        
        attText1.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .regular), range: .init(location: 0, length: attText1.length))
        attText2.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .bold), range: .init(location: 0, length: attText2.length))
        attText3.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .regular), range: .init(location: 0, length: attText3.length))
        
        attText1.append(attText2)
        attText1.append(attText3)
        
        titleLabel.attributedText = attText1
        
        let container = UIView()
        container.backgroundColor = .white
        container.addSubview(titleLabel)
        container.addSubview(cancelButton)
        container.setUnderlineStyle(color: K.DesignColors.primary)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        cancelButton.topAnchor.constraint(equalTo: container.topAnchor,constant: 10).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20).isActive = true
        titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: container.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(container)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.anchor(top: view.topAnchor,
                         bottom: nil,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         height: nil,
                         width: nil)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DeckCell.self, forCellReuseIdentifier: K.Cells.deckCell)

        view.addSubview(tableView)

        tableView.anchor(top: container.bottomAnchor,
                         bottom: view.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         height: nil,
                         width: nil)
        
        // Add Header
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        headerView.backgroundColor = .white
        
        headerView.addSubview(newDeckButton)
        
        newDeckButton.translatesAutoresizingMaskIntoConstraints = false
        newDeckButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        newDeckButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        tableView.tableHeaderView = headerView
        
        // Add Footer
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        footerView.backgroundColor = .white
        tableView.tableFooterView = footerView
        
    }
    
    // MARK: - Selector Functions
    @objc func cancelPressed() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func newDeckPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, animations: {
            
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        }) { (completion) in
            
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
            
        }
        
        // Create New Deck
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
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
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

// MARK: - TableView Data Source
extension DeckSelectingController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Utilities.shared.user?.decks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.deckCell) as! DeckCell
        
        guard let decks = Utilities.shared.user?.decks else { return cell }
        
        cell.nameLabel.text = decks[indexPath.row].name
        cell.numCardsLabel.text = "\(decks[indexPath.row].numberOfCards) \(NSLocalizedString("cards", comment: "flashcards"))"

        return cell
    }
    
    
}

// MARK: - TableView Delegate
extension DeckSelectingController: UITableViewDelegate {
    
    func presentAlert(deckIndex idx: Int) {
        
        let alert = UIAlertController(title: "", message: NSLocalizedString("This card already exists in this deck. Would you like to add a duplicate?", comment: ""), preferredStyle: .alert)
        
        let add = UIAlertAction(title: NSLocalizedString("Add", comment: ""), style: .default) { (action) in
            
            self.addNewCard(deckIndex: idx)
            
            self.dismiss(animated: true) {
                
                if let window = UIApplication.shared.keyWindow {
                    
                    window.displayCheck(text: NSLocalizedString("Card Added", comment: "added flashcard"))
                    
                }
            }
        }
        
        let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { (action) in
            
            return
            
        }
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func addNewCard(deckIndex idx: Int) {
        
        let cardIndex = Utilities.shared.user!.decks[idx].numberOfCards
        
        let flashcard = FlashcardModel(wordArray: wordArray,
                                       wordModelArray: wordModelArray,
                                       ipaIndex: ipaIndex,
                                       bottomLabelText: bottomLabelText,
                                       score: -1,
                                       numRight: 0,
                                       numSeen: 0,
                                       cardIndex: cardIndex)
        
        Utilities.shared.user?.decks[idx].cards.append(flashcard)
        Utilities.shared.user?.decks[idx].numberOfCards += 1
        
        FirebaseManager.shared.updateUser(user: Utilities.shared.user!)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // If Deck already contains card, present alert
        for flashcard in Utilities.shared.user!.decks[indexPath.row].cards {
            
            if flashcard.wordArray == wordArray {
                
                tableView.deselectRow(at: indexPath, animated: true)
                presentAlert(deckIndex: indexPath.row)
                return
                
            }
        }
        
        // Otherwise Add new card
        addNewCard(deckIndex: indexPath.row)
             
        // Dismiss this Controller and animate a checkmark
        tableView.deselectRow(at: indexPath, animated: true)
        self.dismiss(animated: true) {
            
            if let window = UIApplication.shared.keyWindow {
                
                window.displayCheck(text: NSLocalizedString("Card Added", comment: ""))
                
            }
        }
    }
    
}
