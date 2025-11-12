//
//  HeaderCollectionReusableView.swift
//  Aura
//
//  Created by Maxwell Dolensky on 3/2/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "Header"
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textAlignment = .left
        return l
    }()
    
    func configure(title: String) {
        label.text = title
        backgroundColor = K.DesignColors.background
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.anchor(top: self.topAnchor,
                     bottom: self.bottomAnchor,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
    }
    
}
