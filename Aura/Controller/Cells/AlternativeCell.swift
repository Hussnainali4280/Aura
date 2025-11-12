//
//  AlternativeCell.swift
//  Aura
//
//  Created by Max Dolensky on 9/17/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class AlternativeCell: UICollectionViewCell {
    
    // MARK: - DATA
    static let identifier = "AlternativeCell"
    
    // MARK: - Subviews
    var topLabel: UILabel = {
        
        let l = UILabel()
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        l.numberOfLines = 1
        l.textAlignment = .left
        return l
        
    }()
    
    var bottomLabel: UILabel = {
        
        let l = UILabel()
        l.textColor = K.Colors.darkGrey
        l.font = UIFont.systemFont(ofSize: 15, weight: .light)
        l.numberOfLines = 2
        l.textAlignment = .left
        l.lineBreakMode = .byWordWrapping
        return l
        
    }()
    
    // MARK: - INIT
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setup() {
        
        self.addSubview(topLabel)
        self.addSubview(bottomLabel)
        
        topLabel.anchor(top: self.topAnchor,
                        bottom: nil,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        
        bottomLabel.anchor(top: topLabel.bottomAnchor,
                           bottom: nil,
                           leading: self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        
        let selectedView = UIView(frame: bounds)
        selectedView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.7)
        self.selectedBackgroundView = selectedView
        
    }
    
}
