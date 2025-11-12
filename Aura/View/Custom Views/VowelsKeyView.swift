//
//  VowelsKey.swift
//  Aura
//
//  Created by Max Dolensky on 7/29/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class ColorKeyView: UIView {
    
    // Data
    var title: String?
    var numRows: Int?
    var numColumns: Int?
    var colors = [UIColor]()
    
    // Subviews
    var mainStackView: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
        
    }()
    
    var titleLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textColor = .black
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    convenience init(frame: CGRect, title: String, numRows: Int, numCol: Int, colors: [UIColor]) {
        self.init(frame: frame)
        
        self.title = title
        self.numRows = numRows
        self.numColumns = numCol
        self.colors = colors
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        
        guard let numRows = numRows, let numColumns = numColumns else { return }

        if (numRows*numColumns != colors.count) {

            print("Number of colors must equal #rows * #columns")
            return
        }
        
        self.backgroundColor = .white
        self.roundCorners(cornerRadius: 12)
        
        self.addSubview(titleLabel)
        titleLabel.text = title
        titleLabel.anchor(top: self.topAnchor,
                          bottom: nil,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -10))
        
        self.addSubview(mainStackView)
        mainStackView.anchor(top: titleLabel.bottomAnchor,
                             bottom: self.bottomAnchor,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: nil,
                             width: nil,
                             padding: UIEdgeInsets(top: 10, left: 20, bottom: -20, right: -50))
        
        for i in 0..<numRows {
            
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .equalSpacing
            stackView.spacing = 10
            
            self.mainStackView.addArrangedSubview(stackView)
            
            for j in 0..<numColumns {
                
                let view = UIView()
                view.translatesAutoresizingMaskIntoConstraints = false
                view.widthAnchor.constraint(equalToConstant: 34).isActive = true
                view.heightAnchor.constraint(equalToConstant: 34).isActive = true
                view.backgroundColor = colors[ (numColumns * i) + j ]
                view.roundCorners(cornerRadius: 17)
                
                stackView.addArrangedSubview(view)
                
                
            }
            
        }
        
    }
    
}
