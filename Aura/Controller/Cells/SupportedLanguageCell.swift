//
//  SupportedLanguageCell.swift
//  Aura
//
//  Created by Max Dolensky on 7/20/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class SupportedLanguageCell: UITableViewCell {

    var label: UILabel = {
       
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.backgroundColor = .white
        label.textColor = .black
        return label
        
    }()
    
    var chevron: UIImageView = {
        
        var chevron = UIImageView()
        
        if #available(iOS 13.0, *) {
            chevron = UIImageView(image: UIImage(systemName: "chevron.right"))
        } else {
            chevron = UIImageView(image: #imageLiteral(resourceName: "chevron").withRenderingMode(.alwaysTemplate))
        }
        chevron.setContentHuggingPriority(UILayoutPriority(999), for: .horizontal)
        chevron.contentMode = .scaleAspectFit
        chevron.tintColor = .black
        return chevron
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        self.addSubview(label)
        self.addSubview(chevron)
        
        label.anchor(top: self.topAnchor,
                     bottom: self.bottomAnchor,
                     leading: self.leadingAnchor,
                     trailing: chevron.leadingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10))
        
        chevron.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: nil, trailing: self.trailingAnchor, height: nil, width: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: -10, right: -10))
        
    }

}
