//
//  ColorKeyView.swift
//  Aura
//
//  Created by Max Dolensky on 8/12/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//
import UIKit

class ColorKeyView: UIView {
    
    // Data
    var title: String?
    var explanation: String?
    var numRows: Int?
    var numColumns: Int?
    var cornerRadius: CGFloat = 12
    var colors = [UIColor]()
    var doesButtonScrollToView = true
    var myScrollView: UIScrollView?
    var keyType: KeyType?
    
    // Subviews
    var container = UIView()
    
    var mainStackView: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 10
        return stack

    }()
    
    var titleLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.backgroundColor = .white
        
        if UIScreen.main.bounds.width > 375 {
            label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        } else if UIScreen.main.bounds.width > 320 {
            label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        } else {
            label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        }
        
        return label
        
    }()
    
    var explanationLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = K.Colors.darkGrey
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    convenience init(frame: CGRect, doesButtonScrollToView: Bool = true, title: String, explanation: String?, numRows: Int, numCol: Int, cornerRadius: CGFloat = 12, colors: [UIColor], keyType: KeyType? = nil) {
        self.init(frame: frame)
        
        self.title = title
        self.explanation = explanation
        self.numRows = numRows
        self.numColumns = numCol
        self.colors = colors
        self.cornerRadius = cornerRadius
        self.doesButtonScrollToView = doesButtonScrollToView
        self.keyType = keyType
        
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
        
        container.roundCorners(cornerRadius: cornerRadius)
        container.backgroundColor = .white
        self.addSubview(container)
        
        container.anchor(top: self.topAnchor,
                             bottom: self.bottomAnchor,
                             leading: self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             height: nil,
                             width: nil)
        
        container.addSubview(mainStackView)
        
        titleLabel.text = title
        mainStackView.addArrangedSubview(titleLabel)
        
        if let explanation = explanation {
            
            explanationLabel.text = explanation
            explanationLabel.isHidden = false
            
        }
        
        else {
            explanationLabel.isHidden = true
        }
        
        mainStackView.addArrangedSubview(explanationLabel)
        
        if UIScreen.main.bounds.width > 320 {
            mainStackView.anchor(top: container.topAnchor,
                                 bottom: container.bottomAnchor,
                                 leading: container.leadingAnchor,
                                 trailing: container.trailingAnchor,
                                 height: nil,
                                 width: nil,
                                 padding: UIEdgeInsets(top: 20, left: 20, bottom: -20, right: -20))
        } else {
            mainStackView.anchor(top: container.topAnchor,
                                 bottom: container.bottomAnchor,
                                 leading: container.leadingAnchor,
                                 trailing: container.trailingAnchor,
                                 height: nil,
                                 width: nil,
                                 padding: UIEdgeInsets(top: 20, left: 6, bottom: -20, right: -6))
        }
        
        var count = 0
        for i in 0..<numRows {
            
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .equalSpacing
            
            if UIScreen.main.bounds.width > 320 {
                stackView.spacing = 10
            } else {
                stackView.spacing = 4
            }
            self.mainStackView.addArrangedSubview(stackView)
            
            for j in 0..<numColumns {
                
                let view = UIView()
                view.backgroundColor = .white
                
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
                button.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
                button.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
                button.backgroundColor = colors[ (numColumns * i) + j ]
                button.roundCorners(cornerRadius: 17)
                
                view.addSubview(button)
                button.anchor(top: view.topAnchor,
                              bottom: view.bottomAnchor,
                              leading: view.leadingAnchor,
                              trailing: view.trailingAnchor,
                              height: nil,
                              width: nil)
                
                // These will be used in the Key VC to scroll to the right key card
                if colors[ (numColumns * i) + j ] != .white &&
                   colors[ (numColumns * i) + j ] != .black &&
                   colors[ (numColumns * i) + j ] != K.Colors.darkGrey &&
                   colors[ (numColumns * i) + j ] != K.Colors.yellow &&
                   colors[ (numColumns * i) + j ] != K.Colors.lightGrey {
                    
                    button.addTarget(self, action: #selector(scrollButtonPressed(_:)), for: .touchUpInside)
                    button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
                    button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
                    button.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
                    button.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
                    
                    button.tag = count
                    count += 1
                    
                }
                
                // These will be used in the Full Key View for whatever use we want. Right now does nothing
                else {
                    button.isUserInteractionEnabled = false
                }
                
                stackView.addArrangedSubview(view)

            }
            
        }
        
    }
    
    func setShadows() {
        
        self.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 0, height: 2), radius: 3, cornerRadius: cornerRadius)
        
        for stack in mainStackView.subviews {
            
            for view in stack.subviews {
                
                if view.subviews[0].backgroundColor != .white {
                    
                    view.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 2, height: 2), radius: 2, cornerRadius: 30)
                    
                }
            }
            
        }
        
    }
    
    @objc func scrollButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            sender.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            sender.superview?.layer.shadowOpacity = 0.5
            
        }) { (completion) in
            
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
            
        }
        
        if doesButtonScrollToView {
                        
            if let myScrollView = myScrollView as? KeyCardScrollView {
                
                myScrollView.setContentOffset( CGPoint(x: myScrollView.frame.size.width * CGFloat(sender.tag), y: 0.0), animated: true)
                
                if let keyCard = myScrollView.stackView.subviews[sender.tag].subviews[0] as? KeyCardView {
                    keyCard.soundButton.sendActions(for: .touchUpInside)
                }
                
            }
            
        }
        
        else {
            
            if let keyType = self.keyType {
                
                switch keyType {
                    
                case .vowel:
                    
                    let soundString = K.KeyInfo.vowelSoundAndColor[sender.tag].0
                    playSound(audioString: soundString)
                    
                case .fluidConsonant:
                    
                    let soundString = K.KeyInfo.fluidSoundAndColor[sender.tag].0
                    playSound(audioString: soundString)
                    
                case .trueConsonant:
                    
                    let soundString = K.KeyInfo.trueSoundAndText[sender.tag].0
                    playSound(audioString: soundString)
                    
                case .flipConsonant:
                    
                    let soundString = K.KeyInfo.flipSoundAndText[sender.tag].0
                    playSound(audioString: soundString)
                    
                case .silent:
                    
                    break
                    
                case .wildcard:
                    
                    break
                    
                }
                
            }
        }
        
    }
    
    @objc func touchDown(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
            sender.superview?.layer.shadowOpacity = 0.5
        }
    }
    
    @objc func cancelEvent(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
        }
        
    }
    
    func playSound(audioString: String) {
        
        Utilities.shared.playSound(audioString)
        
    }
    
}


