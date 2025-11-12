//
//  flashcardsScrollView.swift
//  Aura
//
//  Created by Max Dolensky on 8/8/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class FlashcardsScrollView: UIScrollView {
    
    // Data
    var flashcards = [ResultCardView]()

    // Subviews
    var stackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, flashcards: [ResultCardView]) {
        self.init(frame: frame)
        self.flashcards = flashcards
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = false
        self.isPagingEnabled = true
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        
        self.layer.masksToBounds = false
        
        // Add Stack View to Scroll View
        self.addSubview(stackView)
        
        // Anchor StackView Within Scroll View
        stackView.anchor(top: self.topAnchor,
                         bottom: self.bottomAnchor,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil)
        
        // Prevent Vertical Scrolling
        stackView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        for flashcard in flashcards {
                        
            stackView.addHorizontallyCenteredSubview(flashcard, stackViewParent: self)
            
        }
    }
    
    func updateFlashcards(_ flashcards: [ResultCardView], completion: @escaping() -> ()) {
        
        self.flashcards = flashcards
        
        for view in stackView.subviews {
            view.removeFromSuperview()
        }
        
        for flashcard in flashcards {

            stackView.addHorizontallyCenteredSubview(flashcard, stackViewParent: self)
        }
        
        completion()
        
    }
}

