//
//  Page10.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/23/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class Page10: UIView {

    var mainHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Translation Result", comment: "")
        l.numberOfLines = 2
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()
        
    let iv: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "translationResult")
        iv.contentMode = .scaleAspectFit
        return iv
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
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        
        self.addSubview(mainHeader)
        self.addSubview(iv)
        
        if UIScreen.main.bounds.height > 736 {
            setConstraintsForLargerPhone()
        } else if UIScreen.main.bounds.height > 568 {
            setConstraintsForSmallerPhone()
        } else {
            setConstraintsForSmallestPhone()
        }

    }
    
    func setConstraintsForLargerPhone() {
        mainHeader.anchor(top: self.topAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 70, left: 30, bottom: 0, right: -30))
                
        iv.anchor(top: mainHeader.bottomAnchor,
                        bottom: self.bottomAnchor,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 30, left: 10, bottom: -100, right: -10))
    }

    func setConstraintsForSmallerPhone() {
        mainHeader.anchor(top: self.topAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
                
        iv.anchor(top: mainHeader.bottomAnchor,
                        bottom: self.bottomAnchor,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 10, left: 10, bottom: -60, right: -10))
    }
    
    func setConstraintsForSmallestPhone() {
        mainHeader.anchor(top: self.topAnchor,
                         bottom: nil,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: -30))
                
        iv.anchor(top: mainHeader.bottomAnchor,
                        bottom: self.bottomAnchor,
                        leading: self.leadingAnchor,
                        trailing: self.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 10, left: 10, bottom: -60, right: -10))
    }
    
}
