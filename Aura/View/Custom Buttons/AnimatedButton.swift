//
//  tappableUIView.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/10/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class AnimatedButton: UIButton {
    
    var index = 0
    var isFlat = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTargets()
        self.backgroundColor = .clear
        self.roundCorners(cornerRadius: 10)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addTargets() {
        
        self.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        self.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        self.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        self.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
    }
    
    @objc func touchDown(_ sender: UIButton) {
        
        if !isFlat {
            UIView.animate(withDuration: 0.1) {
                sender.superview?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                sender.superview?.layer.shadowOpacity = 0.5
            }
        } else {
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        }

    }
    
    @objc func cancelEvent(_ sender: UIButton) {
        
        if !isFlat {
            UIView.animate(withDuration: 0.1) {
                sender.superview?.transform = .identity
                sender.superview?.layer.shadowOpacity = 0.3
            }
        } else {
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
            }
        }
    }
}

