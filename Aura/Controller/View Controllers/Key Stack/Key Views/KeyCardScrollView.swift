//
//  KeyCardScrollView.swift
//  Aura
//
//  Created by Max Dolensky on 7/30/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class KeyCardScrollView: UIScrollView {
    
    // Data
    var soundAndColorArray: [(String, UIColor)]?
    var soundAndTextArray: [(String, String)]?
    var isTextBlack: Bool = true
    
    // Subviews    
    var stackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect,_ soundAndColor: [(String, UIColor)]?,_ soundAndText: [(String, String)]?,_ isTextBlack: Bool) {
        self.init(frame: frame)
        
        self.soundAndColorArray = soundAndColor
        self.soundAndTextArray = soundAndText
        self.isTextBlack = isTextBlack
        
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
        
        if let soundAndColorArray = soundAndColorArray {
            
            for soundAndColor in soundAndColorArray {
                
                let keyCard = KeyCardView(frame: .zero, audioString: soundAndColor.0, color: soundAndColor.1, text: nil)
                stackView.addCenteredSubview(keyCard, stackViewParent: self)
                
            }
            
        }
        
        if let soundAndTextArray = soundAndTextArray {
            
            for soundAndText in soundAndTextArray {
                
                let keyCard = KeyCardView(frame: .zero, audioString: soundAndText.0, color: .white, text: soundAndText.1)
                
                if !isTextBlack {
                    keyCard.textLabel.textColor = K.Colors.darkGrey
                }
                
                stackView.addCenteredSubview(keyCard, stackViewParent: self)
            }
            
        }
    }
}
