//
//  HorizontalScrollView.swift
//  Aura
//
//  Created by Max Dolensky on 10/8/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class HorizontalScrollView: UIScrollView {
        
    var stackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.layer.masksToBounds = false
        return stackView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupScrollView() {
        
        // Setup Scroll View
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.layer.masksToBounds = false
        
        // Anchor Content View
        self.addSubview(stackView)
        stackView.anchor(top: self.topAnchor,
                         bottom: self.bottomAnchor,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil)
        
        stackView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
}

protocol MyDeckScrollViewDelegate {
    func goToDeck(deckIndex: Int)
}

class MyDecksScrollView: HorizontalScrollView {
    
    var decks = [DeckModel]()
    var myDeckDelegate: MyDeckScrollViewDelegate?
    
    convenience init(frame: CGRect, decks: [DeckModel]) {
        self.init(frame: frame)
        self.decks = decks
        addDeckViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addDeckViews() {
        
        var i = 0
        for deck in decks {
            
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
            
            let titleLabel = UILabel()
            titleLabel.text = deck.name
            titleLabel.textColor = K.DesignColors.primary
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            titleLabel.numberOfLines = 1
            titleLabel.lineBreakMode = .byTruncatingTail
            
            let numCardsLabel = UILabel()
            numCardsLabel.text = "\(deck.numberOfCards) \(NSLocalizedString("Cards", comment: "flashcards, number of words they have saved in this flashcard deck"))"
            numCardsLabel.textColor = .gray
            numCardsLabel.textAlignment = .left
            numCardsLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            numCardsLabel.numberOfLines = 1
            numCardsLabel.lineBreakMode = .byTruncatingTail
            
            let scoreLabel = UILabel()
            let (text, color) = getPrevScoreTextAndColor(deck: deck)
            scoreLabel.text = text
            scoreLabel.textColor = color
            scoreLabel.textAlignment = .right
            scoreLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            scoreLabel.numberOfLines = 1
            scoreLabel.lineBreakMode = .byTruncatingTail
            
            container.addSubview(titleLabel)
            container.addSubview(numCardsLabel)
            container.addSubview(scoreLabel)
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
            titleLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
            titleLabel.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -10).isActive = true
            
            numCardsLabel.translatesAutoresizingMaskIntoConstraints = false
            numCardsLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
            numCardsLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -6).isActive = true
            
            scoreLabel.translatesAutoresizingMaskIntoConstraints = false
            scoreLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
            scoreLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -6).isActive = true
            
            let b = AnimatedButton(frame: .zero)
            b.index = i
            b.addTarget(self, action: #selector(myDeckPressed(_:)), for: .touchUpInside)
            
            background.addSubview(b)
            b.anchor(top: background.topAnchor,
                     bottom: background.bottomAnchor,
                     leading: background.leadingAnchor,
                     trailing: background.trailingAnchor,
                     height: nil,
                     width: nil)
            
            self.stackView.addArrangedSubview(background)
            i += 1
        }
    }
    
    func getPrevScoreTextAndColor(deck: DeckModel) -> (String, UIColor) {
        
        let formatted = String(format: "%.1f", deck.avgScore)
        
        if deck.avgScore < 0 {
            return ("-%", .black)
        }
        
        else if deck.avgScore <= 50 {
            return ("\(formatted)%", .red)
        }
        
        else if deck.avgScore <= 69 {
            return ("\(formatted)%", .orange)
        }
        
        else if deck.avgScore <= 79 {
            return ("\(formatted)%", K.Colors.yellow)
        }
        
        else {
            return ("\(formatted)%", .green)
        }
    }
    
    func updateVisibility() {
        
        if decks.count == 0 {
            self.superview?.isHidden = true
        }
        
        else {
            self.superview?.isHidden = false
        }
        
    }
    
    func updateDecks() {
        DispatchQueue.main.async {
            
            for v in self.stackView.subviews {
                v.removeFromSuperview()
            }
            
            self.addDeckViews()
            
            for v in self.stackView.subviews {
                v.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
            }
            
        }
    }
    
    @objc func myDeckPressed(_ sender: AnimatedButton) {
        
        UIView.animate(withDuration: 0.2) {
            
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
            
        } completion: { (_) in
            
            self.myDeckDelegate?.goToDeck(deckIndex: sender.index)
            
        }
        
    }
    
}

protocol PopularDeckScrollViewDelegate {
    func showPurchasePopUp(deckIndex: Int)
}


class PopularDecksScrollView: HorizontalScrollView {
    
    var popularDeckDelegate: PopularDeckScrollViewDelegate?
    var decks = [DeckModel]()
    
    convenience init(frame: CGRect, decks: [DeckModel]) {
        self.init(frame: frame)
        self.decks = decks
        addDeckViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addDeckViews() {
        
        var i = 0
        for deck in decks {
            
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
            
            let titleLabel = UILabel()
            titleLabel.text = deck.name
            titleLabel.textColor = K.DesignColors.primary
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            titleLabel.numberOfLines = 1
            titleLabel.lineBreakMode = .byTruncatingTail
            
            container.addSubview(titleLabel)
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
            titleLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
            titleLabel.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -10).isActive = true

            let b = AnimatedButton(frame: .zero)
            b.index = i
            b.addTarget(self, action: #selector(myDeckPressed(_:)), for: .touchUpInside)
            
            background.addSubview(b)
            b.anchor(top: background.topAnchor,
                     bottom: background.bottomAnchor,
                     leading: background.leadingAnchor,
                     trailing: background.trailingAnchor,
                     height: nil,
                     width: nil)
            
            self.stackView.addArrangedSubview(background)
            i += 1
        }
    }
        
    func updateVisibility() {
        
        if decks.count == 0 {
            self.superview?.isHidden = true
        }
        
        else {
            self.superview?.isHidden = false
        }
        
    }
    
    func updateDecks() {
        DispatchQueue.main.async {
            
            for v in self.stackView.subviews {
                v.removeFromSuperview()
            }
            
            self.addDeckViews()
            
            for v in self.stackView.subviews {
                v.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
            }
            
        }
    }
        
    @objc func myDeckPressed(_ sender: AnimatedButton) {
        
        UIView.animate(withDuration: 0.2) {
            
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
            
        } completion: { (_) in
            
            self.popularDeckDelegate?.showPurchasePopUp(deckIndex: sender.index)
            
        }
        
    }
    
}

protocol LessonsScrollViewDelegate {
    func goToLesson(lessonIndex: Int)
}

class LessonsScrollView: HorizontalScrollView {
    
    var lessons = [VideoGroup]()
    var lessonsScrollViewDelegate: LessonsScrollViewDelegate?
    
    convenience init(frame: CGRect, lessons: [VideoGroup]) {
        self.init(frame: frame)
        self.lessons = lessons
        addLessonViews()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addLessonViews() {
        var i = 0
        for lesson in lessons {
            let background = UIView()
            
            let iv = CustomImageView()
            iv.backgroundColor = K.DesignColors.primary
            iv.roundCorners(cornerRadius: 10)
            
            background.addSubview(iv)
            iv.anchor(top: background.topAnchor,
                             bottom: background.bottomAnchor,
                             leading: background.leadingAnchor,
                             trailing: background.trailingAnchor,
                             height: nil,
                             width: nil)
            
            background.translatesAutoresizingMaskIntoConstraints = false
            background.widthAnchor.constraint(equalToConstant: 200).isActive = true
            background.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            iv.loadImageUsingCacheWithURLString(urlString: lesson.thumbnailURL)
            iv.backgroundColor = K.DesignColors.primary
            iv.contentMode = .scaleAspectFill
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.heightAnchor.constraint(equalToConstant: 180).isActive = true
            iv.widthAnchor.constraint(equalToConstant: 280).isActive = true
            
            let b = AnimatedButton(frame: .zero)
            b.index = i
            b.addTarget(self, action: #selector(lessonPressed(_:)), for: .touchUpInside)
            
            background.addSubview(b)
            b.anchor(top: background.topAnchor,
                     bottom: background.bottomAnchor,
                     leading: background.leadingAnchor,
                     trailing: background.trailingAnchor,
                     height: nil,
                     width: nil)
            
            self.stackView.addArrangedSubview(background)
            i += 1
        }
    }
    
    func updateLessons() {
        DispatchQueue.main.async {
            for v in self.stackView.subviews {
                v.removeFromSuperview()
            }
            
            self.addLessonViews()
            
            for v in self.stackView.subviews {
                v.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 10)
            }
        }
    }
    
    @objc func lessonPressed(_ sender: AnimatedButton) {
        UIView.animate(withDuration: 0.2) {
            
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
            
        } completion: { (_) in
            
            self.lessonsScrollViewDelegate?.goToLesson(lessonIndex: sender.index)
            
        }
    }
}
