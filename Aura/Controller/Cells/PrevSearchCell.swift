//
//  PrevSearchCell.swift
//  Aura
//
//  Created by Max Dolensky on 7/8/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class PrevSearchCell: UITableViewCell {

    var topLabel = UILabel()
    var bottomLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
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
        topLabel.numberOfLines = 1
        bottomLabel.font = .systemFont(ofSize: 17, weight: .regular)
        
        // Add bottomLabel
        vertStackView.addArrangedSubview(bottomLabel)
        bottomLabel.textAlignment = .left
        bottomLabel.numberOfLines = 1
        bottomLabel.font = .systemFont(ofSize: 13, weight: .light)
        
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
    
    func populateCell(topLabelText: String, bottomLabelText: String) {
        topLabel.text = topLabelText
        bottomLabel.text = bottomLabelText
    }
    
}
