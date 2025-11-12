//
//  VerticalScrollView.swift
//  Aura
//
//  Created by Max Dolensky on 10/8/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class VerticalScrollView: UIScrollView {

    var stackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
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
        self.backgroundColor = K.DesignColors.background
        self.showsVerticalScrollIndicator = false
        
        // Anchor Content View
        self.addSubview(stackView)
        stackView.anchor(top: self.topAnchor,
                         bottom: self.bottomAnchor,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0))
        
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
    }
    
}

