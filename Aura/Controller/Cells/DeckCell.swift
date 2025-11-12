//
//  DeckCell.swift
//  Aura
//
//  Created by Max Dolensky on 8/9/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class DeckCell: UITableViewCell {

    let nameLabel: UILabel = {
       
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
        
    }()
    
    let numCardsLabel: UILabel = {
       
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
        
    }()
    
    let stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        stackView.spacing = 0
        return stackView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        self.addSubview(stackView)
        
        stackView.anchor(top: self.topAnchor,
                         bottom: self.bottomAnchor,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: 10))
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(numCardsLabel)
        
    }

}
