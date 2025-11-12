//
//  FlashcardDetailsView.swift
//  Aura
//
//  Created by Max Dolensky on 8/11/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class FlashcardDetailsView: UIView {

    var topLabel = UILabel()
    var bottomLabel = UILabel()
    let scoreLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    func setup() {
        self.backgroundColor = .white
        
        // Add Stack Views
        let horzStackView = UIStackView()
        horzStackView.backgroundColor = .white
        horzStackView.alignment = .center
        horzStackView.spacing = 10
        self.addSubview(horzStackView)
        horzStackView.anchor(top: self.topAnchor,
                             bottom: self.bottomAnchor,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: nil,
                             width: nil,
                             padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10))
        
        let vertStackView = UIStackView()
        vertStackView.backgroundColor = .white
        vertStackView.axis = .vertical
        vertStackView.spacing = 6
        
        horzStackView.addArrangedSubview(vertStackView)
        
        // Add topLabel
        vertStackView.addArrangedSubview(topLabel)
        topLabel.textAlignment = .left
        topLabel.numberOfLines = 0
        bottomLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        // Add bottomLabel
        vertStackView.addArrangedSubview(bottomLabel)
        bottomLabel.textAlignment = .left
        bottomLabel.numberOfLines = 0
        bottomLabel.font = .systemFont(ofSize: 13, weight: .light)
        
        // Add Score
        scoreLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        scoreLabel.numberOfLines = 1
        scoreLabel.setContentHuggingPriority(UILayoutPriority(999), for: .horizontal)
        scoreLabel.setContentCompressionResistancePriority(UILayoutPriority(999), for: .horizontal)
        horzStackView.addArrangedSubview(scoreLabel)
        
        // Add chevron
        var chevron = UIImageView()
        
        if #available(iOS 13.0, *) {
            chevron = UIImageView(image: UIImage(systemName: "chevron.right"))
        } else {
            chevron = UIImageView(image: #imageLiteral(resourceName: "chevron").withRenderingMode(.alwaysTemplate))
        }
        horzStackView.addArrangedSubview(chevron)
        chevron.setContentHuggingPriority(UILayoutPriority(999), for: .horizontal)
        chevron.setContentCompressionResistancePriority(UILayoutPriority(999), for: .horizontal)
        chevron.contentMode = .scaleAspectFit
        chevron.tintColor = .black

    }
    
}
