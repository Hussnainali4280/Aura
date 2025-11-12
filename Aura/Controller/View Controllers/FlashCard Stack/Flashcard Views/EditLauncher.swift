//
//  EditLauncher.swift
//  Aura
//
//  Created by Max Dolensky on 9/23/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class EditLauncher: NSObject {
    
    // Data
    var parentView: UIViewController!
    var navBarYValue: CGFloat!
    
    // Views
    var blackView: UIView = {
        
        let v = UIView()
        v.backgroundColor = UIColor(white: 0 , alpha: 0.5)
        return v
        
    }()
    
    var whiteView: UIView = {
        
        let v = UIView()
        v.backgroundColor = .white
        v.roundCorners(cornerRadius: 10)
        v.isUserInteractionEnabled = true
        return v
        
    }()
    
    var changeNameButton: UIView = {
        
        let v = UIView()
        // Image Subview
        let iv = UIImageView()
        
        if #available(iOS 13.0, *) {
            iv.image = UIImage(systemName: "pencil")
        }
            
        else {
            iv.image = #imageLiteral(resourceName: "pencil").withRenderingMode(.alwaysTemplate)
        }
        
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        // Label Subview
        let l = UILabel()
        l.text = NSLocalizedString("Edit Deck Name", comment: "")
        l.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        l.textAlignment = .left
        
        v.addSubview(iv)
        v.addSubview(l)
        
        l.anchor(top: v.topAnchor, bottom: v.bottomAnchor, leading: v.leadingAnchor, trailing: nil, height: nil, width: nil, padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0))
        
        iv.centerYAnchor.constraint(equalTo: l.centerYAnchor).isActive = true
        iv.leadingAnchor.constraint(equalTo: l.trailingAnchor, constant: 30).isActive = true
        iv.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -8).isActive = true
        
        return v
        
    }()
    
    var trashButton: UIView = {
        
        let v = UIView()
        
        // Image Subview
        let iv = UIImageView()
        
        if #available(iOS 13.0, *) {
            iv.image = UIImage(systemName: "trash")
        }
            
        else {
            iv.image = #imageLiteral(resourceName: "trash").withRenderingMode(.alwaysTemplate)
        }
        
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        // Label Subview
        let l = UILabel()
        l.text = NSLocalizedString("Delete Deck", comment: "")
        l.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        l.textAlignment = .left
        
        v.addSubview(iv)
        v.addSubview(l)
        
        l.anchor(top: v.topAnchor, bottom: v.bottomAnchor, leading: v.leadingAnchor, trailing: nil, height: nil, width: nil, padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0))
        
        iv.centerYAnchor.constraint(equalTo: l.centerYAnchor).isActive = true
        iv.leadingAnchor.constraint(equalTo: l.trailingAnchor, constant: 30).isActive = true
        iv.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -8).isActive = true
        
        return v
        
    }()
    
    var lineView: UIView = {
        
        let v = UIView()
        v.backgroundColor = .black
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return v
        
    }()
    
    override init() {
        super.init()
        
        setupWhiteView()
        addGestureRecognizers()
    }
    
    func setupWhiteView() {
        
        whiteView.addSubview(changeNameButton)
        whiteView.addSubview(lineView)
        whiteView.addSubview(trashButton)
        
        changeNameButton.anchor(top: whiteView.topAnchor,
                                bottom: nil,
                                leading: whiteView.leadingAnchor,
                                trailing: whiteView.trailingAnchor,
                                height: nil,
                                width: nil,
                                padding: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: -8))
        
        lineView.anchor(top: changeNameButton.bottomAnchor,
                        bottom: nil,
                        leading: whiteView.leadingAnchor,
                        trailing: whiteView.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0))
        
        trashButton.anchor(top: lineView.bottomAnchor,
                           bottom: whiteView.bottomAnchor,
                           leading: whiteView.leadingAnchor,
                           trailing: whiteView.trailingAnchor,
                           height:  nil,
                           width: nil,
                           padding: UIEdgeInsets(top: 4, left: 8, bottom: -8, right: -8))
    }
    
    func showSettings() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(whiteView)
            
            
            whiteView.anchor(top: window.topAnchor,
                             bottom: nil,
                             leading: nil,
                             trailing: window.trailingAnchor,
                             height: nil,
                             width: nil, padding: UIEdgeInsets(top: navBarYValue + 8, left: 0, bottom: 0, right: -8))
            
            whiteView.alpha = 0
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                self.whiteView.alpha = 1
                
            }, completion: nil)
            
        }
    }
    
    func addGestureRecognizers() {
        
        // Add Gesture Recognizers for Sign Up / Sign In
        let b1 = UIButton()
        b1.backgroundColor = .clear
        
        b1.addTarget(self, action: #selector(changeDeckName(_:)), for: .touchUpInside)
        b1.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        b1.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        b1.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        b1.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        changeNameButton.addSubview(b1)
        
        b1.anchor(top: changeNameButton.topAnchor,
                  bottom: changeNameButton.bottomAnchor,
                  leading: changeNameButton.leadingAnchor,
                  trailing: changeNameButton.trailingAnchor,
                  height: nil,
                  width: nil)
        
        // Add Gesture Recognizers for Toggle
        let b2 = UIButton()
        b2.backgroundColor = .clear
        
        
        b2.addTarget(self, action: #selector(deleteDeck(_:)), for: .touchUpInside)
        b2.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        b2.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        b2.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        b2.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        trashButton.addSubview(b2)
        
        b2.anchor(top: trashButton.topAnchor,
                  bottom: trashButton.bottomAnchor,
                  leading: trashButton.leadingAnchor,
                  trailing: trashButton.trailingAnchor,
                  height: nil,
                  width: nil)
        
    }
    
    @objc func handleDismiss() {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.blackView.alpha = 0
            self.whiteView.alpha = 0
            
        }) { (_) in
            
            self.blackView.removeFromSuperview()
            self.whiteView.removeFromSuperview()
            
        }
        
    }
    
    @objc func changeDeckName(_ sender: UIButton) {
        
        // First Animation: Highlight
        UIView.animate(withDuration: 0.2, animations: {
            
            sender.backgroundColor = UIColor(white: 1, alpha: 0.4)
            
        }) { (_ ) in
            
            // Second Animation: Back to Normal
            UIView.animate(withDuration: 0.2, animations: {
                
                sender.backgroundColor = .clear
                
            }) { (_ ) in
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.blackView.alpha = 0
                    self.whiteView.alpha = 0
                    
                }) { (_) in
                    
                    self.blackView.removeFromSuperview()
                    self.whiteView.removeFromSuperview()
                    self.presentAlertForNewDeckName()
                    
                }
            }
        }
    }
    
    @objc func deleteDeck(_ sender: UIButton) {
        
        // First Animation: Highlight
        UIView.animate(withDuration: 0.2, animations: {
            
            sender.backgroundColor = UIColor(white: 1, alpha: 0.4)
            
        }) { (_ ) in
            
            // Second Animation: Back to Normal
            UIView.animate(withDuration: 0.2, animations: {
                
                sender.backgroundColor = .clear
                
            }) { (_ ) in
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.blackView.alpha = 0
                    self.whiteView.alpha = 0
                    
                }) { (_) in
                    
                    self.blackView.removeFromSuperview()
                    self.whiteView.removeFromSuperview()
                    self.presentDeleteDeckAlert()
                    
                }
            }
        }
    }
    
    func presentDeleteDeckAlert() {
        
        let alert = UIAlertController(title: NSLocalizedString("Delete Deck", comment: ""), message: NSLocalizedString("Are you sure you want to delete this entire deck?", comment: ""), preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: NSLocalizedString("Delete", comment: ""), style: .destructive) { (action) in
            
            if var user = Utilities.shared.user {
                
                let parentVC = self.parentView as! DeckController
                
                user.decks.remove(at: parentVC.myDeckIndex)
                FirebaseManager.shared.updateUser(user: user)
                
                parentVC.navigationController?.popToRootViewController(animated: true)
                
            }
        }
        
        let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { (action) in
            return
        }
        
        alert.addAction(actionOK)
        alert.addAction(cancel)
        parentView.present(alert, animated: true, completion: nil)
        
    }
    
    func presentAlertForNewDeckName() {
        
        var textField = UITextField()
        
        // Main Alert
        let alert = UIAlertController(title: NSLocalizedString("Change Deck Name", comment: ""), message: "", preferredStyle: .alert)
        
        // Action: Save New Name
        let action = UIAlertAction(title: NSLocalizedString("Save", comment: "save changes"), style: .default) { (action) in
            
            if textField.text != nil && textField.text!.count > 0 {
                
                let newDeckName = Utilities.shared.getUniqueDeckName(from: textField.text!, given: Utilities.shared.user!.decks)
                
                // Edit Current Deck Name
                if var user = Utilities.shared.user {
                    
                    let parentVC = self.parentView as! DeckController
                    
                    user.decks[parentVC.myDeckIndex].name = newDeckName
                    FirebaseManager.shared.updateUser(user: user)
                    
                    parentVC.centerTitle.text = newDeckName
                    
                    if let window = UIApplication.shared.keyWindow {
                        
                        window.displayCheck(text: NSLocalizedString("Saved", comment: "changes saved"))
                        
                    }
                }
            }
        }
        
        // Action: Cancel
        let action1 = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { (action) in
            return
        }
        
        // Add TextField to alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = NSLocalizedString("Enter new name", comment: "Enter a new title for the flashcard deck name")
            textField = alertTextField
        }
        
        // Add Actions and Present
        alert.addAction(action)
        alert.addAction(action1)
        parentView.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func touchDown(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.backgroundColor = UIColor(white: 1, alpha: 0.4)
        }
    }
    
    @objc func cancelEvent(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
            sender.backgroundColor = .clear
        }
    }
    
}
