//
//  SoundItOutCell.swift
//  Aura
//
//  Created by Max Dolensky on 7/13/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation
import AMPopTip

class SoundItOutCell: UICollectionViewCell {
    
    static let identifier = "SoundItOutCell"
        
    var soundButton: SoundButton = {
        
        let button = SoundButton()
        button.clipsToBounds = true
        button.setTitleColor( .clear, for: .normal)
        return button
        
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {

        self.addSubview(soundButton)
        
        soundButton.anchor(top: self.topAnchor,
                           bottom: self.bottomAnchor,
                           leading: self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           height: nil,
                           width: nil)
        
        soundButton.roundCorners(cornerRadius: 6)
        
        self.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 3, height: 3), radius: 2)
    }
    
}
