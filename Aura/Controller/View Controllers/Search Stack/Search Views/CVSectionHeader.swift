//
//  CVSectionHeader.swift
//  Aura
//
//  Created by Max Dolensky on 9/21/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class CVSectionHeader: UICollectionReusableView {
    
    static var identifier = "CVSectionHeader"
    
    var label: UILabel = {
        
        let label: UILabel = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.anchor(top: self.topAnchor,
                     bottom: self.bottomAnchor,
                     leading: self.leadingAnchor,
                     trailing: self.trailingAnchor,
                     height: nil,
                     width: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
