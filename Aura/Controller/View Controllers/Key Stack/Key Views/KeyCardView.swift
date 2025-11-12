//
//  KeyCardView.swift
//  Aura
//
//  Created by Max Dolensky on 7/28/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation

class KeyCardView: UIView {
    
    // Data
    var audioString: String?
    var color: UIColor?
    var text: String?
    
    // Subviews
    var contentView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        view.roundCorners(cornerRadius: 20)
        return view
        
    }()
    
    var colorCircle: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.roundCorners(cornerRadius: 150/2)
        return view
        
    }()
    
    var textLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 100, weight: .medium)
        label.backgroundColor = .white
        label.textColor = .black
        return label
        
    }()
    
    var soundButton: AnimatedButton = {
        
        let button = AnimatedButton(frame: .zero)
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "play.fill").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentMode = .center
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        
        button.widthAnchor.constraint(equalToConstant: 42).isActive = true
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        button.roundCorners(cornerRadius: 21)
        
        button.addTarget(self, action: #selector(soundButtonPressed(_:)), for: .touchUpInside)
        return button
        
    }()
    
    let soundBackgroundView: UIView = {
        
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 42).isActive = true
        view.heightAnchor.constraint(equalToConstant: 42).isActive = true
        view.roundCorners(cornerRadius: 21)
        return view
        
    }()
    
    var learnMoreButton: AnimatedButton = {
        
        let button = AnimatedButton(frame: .zero)
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "ellipsis").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentMode = .center
        button.backgroundColor = .white
        button.tintColor = K.DesignColors.primary
        
        button.widthAnchor.constraint(equalToConstant: 42).isActive = true
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        button.roundCorners(cornerRadius: 21)
        
        button.addTarget(self, action: #selector(learnMoreButtonPressed(_:)), for: .touchUpInside)
        return button
        
    }()
    
    let learnMoreBackgroundView: UIView = {
        
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 42).isActive = true
        view.heightAnchor.constraint(equalToConstant: 42).isActive = true
        view.roundCorners(cornerRadius: 21)
        return view
        
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    convenience init(frame: CGRect, audioString: String, color: UIColor, text: String?) {
        self.init(frame: frame)
        self.audioString = audioString
        self.color = color
        self.text = text
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        
    }
    
    func setupView() {
        
        // Background and Shadow
        self.backgroundColor = .white
        self.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 5, height: 5), radius: 2, cornerRadius: 20)
        self.soundBackgroundView.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 2, height: 2), radius: 2, cornerRadius: 21)
        self.learnMoreBackgroundView.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 2, height: 2), radius: 2, cornerRadius: 21)
        
        // Fix the width and height of the card
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 214).isActive = true
        self.heightAnchor.constraint(equalToConstant: 264).isActive = true
        
        // Add subviews
        self.addSubview(contentView)
        self.addSubview(soundBackgroundView)
        self.addSubview(learnMoreBackgroundView)
        
        // If there is text there is no color circle
        if self.text != nil {
            
            self.addSubview(textLabel)
            textLabel.text = self.text
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
            textLabel.bottomAnchor.constraint(lessThanOrEqualTo: soundBackgroundView.topAnchor, constant: -20).isActive = true
        }
        
        else {
            
            self.addSubview(colorCircle)
            colorCircle.backgroundColor = self.color
            colorCircle.translatesAutoresizingMaskIntoConstraints = false
            colorCircle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            colorCircle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            colorCircle.bottomAnchor.constraint(lessThanOrEqualTo: soundBackgroundView.topAnchor, constant: -20).isActive = true
            
        }
        
        contentView.anchor(top: self.topAnchor,
                           bottom: self.bottomAnchor,
                           leading: self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           height: nil,
                           width: nil)
        
        soundBackgroundView.anchor(top: nil,
                           bottom: contentView.bottomAnchor,
                           leading: contentView.leadingAnchor,
                           trailing: nil,
                           height: nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 40, left: 40, bottom: -25, right: 0))
        
        soundBackgroundView.addSubview(soundButton)
        soundButton.anchor(top: soundBackgroundView.topAnchor,
                           bottom: soundBackgroundView.bottomAnchor,
                           leading: soundBackgroundView.leadingAnchor,
                           trailing: soundBackgroundView.trailingAnchor,
                           height: nil,
                           width: nil)
        
        learnMoreBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        learnMoreBackgroundView.centerYAnchor.constraint(equalTo: soundBackgroundView.centerYAnchor).isActive = true
        learnMoreBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
                
        soundBackgroundView.trailingAnchor.constraint(lessThanOrEqualTo: learnMoreBackgroundView.leadingAnchor, constant: -20).isActive = true
        
        learnMoreBackgroundView.addSubview(learnMoreButton)
        learnMoreButton.anchor(top: learnMoreBackgroundView.topAnchor,
                           bottom: learnMoreBackgroundView.bottomAnchor,
                           leading: learnMoreBackgroundView.leadingAnchor,
                           trailing: learnMoreBackgroundView.trailingAnchor,
                           height: nil,
                           width: nil)
        
        if color == K.Colors.lightGrey || color == K.Colors.yellow {
            
            if #available(iOS 13.0, *) {
                soundButton.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
            } else {
                soundButton.setImage(#imageLiteral(resourceName: "speaker.slash.fill").withRenderingMode(.alwaysTemplate), for: .normal)
            }
            soundButton.isUserInteractionEnabled = false
            
        }
        
    }
    
    @objc func soundButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.4, animations: {
            
            sender.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            
        }) { (completion) in
            
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
                sender.superview?.transform = .identity
                sender.superview?.layer.shadowOpacity = 0.3
            }
            
        }
                
        if let audioString = audioString {
            
            Utilities.shared.playSound(audioString)
            
        }
    }
    
    @objc func learnMoreButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2, animations: {
            
            sender.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            
        }) { (completion) in
            
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
            
        }
        
        print("learning more")
    }
    
    @objc func touchDown(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
        }
    }
    
    @objc func cancelEvent(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.transform = .identity
        }
    }
    
}
