//
//  FullKeyView.swift
//  Aura
//
//  Created by Max Dolensky on 7/29/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class FullKeyView: UIView {
    
    // Data
    var screenWidth: CGFloat?
    
    // Subviews
    let vowelKey = ColorKeyView(frame: .zero,
                                doesButtonScrollToView: false,
                                title: "Vowels",
                                explanation: nil,
                                numRows: 5,
                                numCol: 3,
                                colors: [K.Colors.green,      K.Colors.red,       K.Colors.blue,
                                         K.Colors.lightGreen, K.Colors.lightPink, K.Colors.lightBlue,
                                         K.Colors.seaBlue,    K.Colors.orange,    .white,
                                         K.Colors.darkGreen,  K.Colors.pink,      K.Colors.darkBlue,
                                         .white,              K.Colors.purple,    K.Colors.turquoise],
                                keyType: .vowel)
    
    let trueConsonantsKey = ColorKeyView(frame: .zero,
                                         doesButtonScrollToView: false,
                                         title: "True Consonants",
                                         explanation: nil,
                                         numRows: 1,
                                         numCol: 1,
                                         colors: [.black],
                                         keyType: .trueConsonant)
    
    let flipConsonantsKey = ColorKeyView(frame: .zero,
                                         doesButtonScrollToView: false,
                                         title: "Flip Consonants",
                                         explanation: nil,
                                         numRows: 1,
                                         numCol: 1,
                                         colors: [K.Colors.darkGrey],
                                         keyType: .flipConsonant)
    
    let fluidConsonantsKey = ColorKeyView(frame: .zero,
                                          doesButtonScrollToView: false,
                                          title: "Fluid Consonants",
                                          explanation: nil,
                                          numRows: 3,
                                          numCol: 2,
                                          colors: [K.Colors.brownPurple, K.Colors.brownYellow,
                                                   K.Colors.brownRed, K.Colors.tan,
                                                   K.Colors.blueGrey, .white],
                                          keyType: .fluidConsonant)
    
    let silentKey = ColorKeyView(frame: .zero,
                                 doesButtonScrollToView: false,
                                 title: "Silent",
                                 explanation: nil,
                                 numRows: 1,
                                 numCol: 1,
                                 colors: [K.Colors.lightGrey],
                                 keyType: .silent)
    
    let wildcardKey = ColorKeyView(frame: .zero,
                                   doesButtonScrollToView: false,
                                   title: "Wildcards",
                                   explanation: nil,
                                   numRows: 1,
                                   numCol: 1,
                                   colors: [K.Colors.yellow],
                                   keyType: .wildcard)
    
    let lineDivider: UIView = {
        
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
        
    }()
    
    let vowelBackground = UIView()
    let fluidBackground = UIView()
    let trueBackground = UIView()
    let flipBackground = UIView()
    let silentBackground = UIView()
    let wildcardBackground = UIView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, width: CGFloat) {
        
        self.init(frame: frame)
        self.screenWidth = width
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func setup() {
        
        self.backgroundColor = K.DesignColors.background
        
        // Embedd all the sub-Keys in a view to add shadows
        vowelBackground.addSubview(vowelKey)
        fluidBackground.addSubview(fluidConsonantsKey)
        trueBackground.addSubview(trueConsonantsKey)
        flipBackground.addSubview(flipConsonantsKey)
        silentBackground.addSubview(silentKey)
        wildcardBackground.addSubview(wildcardKey)
        
        vowelKey.anchor(top: vowelBackground.topAnchor,
                        bottom: vowelBackground.bottomAnchor,
                        leading: vowelBackground.leadingAnchor,
                        trailing: vowelBackground.trailingAnchor,
                        height: nil,
                        width: nil)
        
        fluidConsonantsKey.anchor(top: fluidBackground.topAnchor,
                                  bottom: fluidBackground.bottomAnchor,
                                  leading: fluidBackground.leadingAnchor,
                                  trailing: fluidBackground.trailingAnchor,
                                  height: nil,
                                  width: nil)
        
        trueConsonantsKey.anchor(top: trueBackground.topAnchor,
                                 bottom: trueBackground.bottomAnchor,
                                 leading: trueBackground.leadingAnchor,
                                 trailing: trueBackground.trailingAnchor,
                                 height: nil,
                                 width: nil)
        
        flipConsonantsKey.anchor(top: flipBackground.topAnchor,
                                 bottom: flipBackground.bottomAnchor,
                                 leading: flipBackground.leadingAnchor,
                                 trailing: flipBackground.trailingAnchor,
                                 height: nil,
                                 width: nil)
        
        
        
        silentKey.anchor(top: silentBackground.topAnchor,
                         bottom: silentBackground.bottomAnchor,
                         leading: silentBackground.leadingAnchor,
                         trailing: silentBackground.trailingAnchor,
                         height: nil,
                         width: nil)
        
        wildcardKey.anchor(top: wildcardBackground.topAnchor,
                           bottom: wildcardBackground.bottomAnchor,
                           leading: wildcardBackground.leadingAnchor,
                           trailing: wildcardBackground.trailingAnchor,
                           height: nil,
                           width: nil)
        
        vowelBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 12)
        fluidBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 12)
        trueBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 12)
        flipBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 12)
        silentBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 12)
        wildcardBackground.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 12)
        
        self.addSubview(vowelBackground)
        self.addSubview(fluidBackground)
        self.addSubview(trueBackground)
        self.addSubview(flipBackground)
        self.addSubview(lineDivider)
        self.addSubview(silentBackground)
        self.addSubview(wildcardBackground)
                
        vowelBackground.anchor(top: self.topAnchor,
                               bottom: nil,
                               leading: self.leadingAnchor,
                               trailing: nil,
                               height: nil,
                               width: ( (screenWidth! - 60) / 2 ),
                               padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0))
                
        fluidBackground.anchor(top: self.topAnchor, bottom: nil,
                               leading: vowelBackground.trailingAnchor,
                               trailing: self.trailingAnchor,
                               height: nil,
                               width: ( (screenWidth! - 60) / 2 ),
                               padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        trueBackground.anchor(top: fluidBackground.bottomAnchor,
                              bottom: nil,
                              leading: fluidBackground.leadingAnchor,
                              trailing: fluidBackground.trailingAnchor,
                              height: nil,
                              width: ( (screenWidth! - 60) / 2 ),
                              padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        flipBackground.anchor(top: trueBackground.bottomAnchor,
                              bottom: nil,
                              leading: fluidBackground.leadingAnchor,
                              trailing: fluidBackground.trailingAnchor,
                              height: nil,
                              width: ( (screenWidth! - 60) / 2 ),
                              padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        lineDivider.anchor(top: flipBackground.bottomAnchor,
                           bottom: nil,
                           leading: vowelBackground.leadingAnchor,
                           trailing: fluidBackground.trailingAnchor,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        wildcardBackground.anchor(top: lineDivider.bottomAnchor,
                                  bottom: nil,
                                  leading: vowelBackground.leadingAnchor,
                                  trailing: nil,
                                  height: nil,
                                  width: ( (screenWidth! - 60) / 2 ),
                                  padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        silentBackground.anchor(top: lineDivider.bottomAnchor,
                              bottom: nil,
                              leading: fluidBackground.leadingAnchor,
                              trailing: fluidBackground.trailingAnchor,
                              height: nil,
                              width: ( (screenWidth! - 60) / 2 ),
                              padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        wildcardBackground.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -20).isActive = true
        silentBackground.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -20).isActive = true
    }
}
