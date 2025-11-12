//
//  SettingsView.swift
//  Aura
//
//  Created by Max Dolensky on 9/14/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import FirebaseAuth
import MessageUI

class SettingsLauncher: NSObject {
    
    // Data
    var isShowing = false
    var parentVC: UIViewController?
    let width: CGFloat = UIScreen.main.bounds.width * 0.85
    let initialCenterX: CGFloat = ((UIScreen.main.bounds.width) * 0.85) / 2.0
    let initialCenterY: CGFloat = UIScreen.main.bounds.height / 2.0
    
    var tabBarVC: UITabBarController?
    
    // Views
    var blackView: UIView = {
        
        let v = UIView()
        v.backgroundColor = UIColor(white: 0 , alpha: 0.5)
        return v
        
    }()
    
    var whiteView: UIView = {
        
        let v = UIView()
        v.backgroundColor = .white
        return v
        
    }()
    
    var titleLabel: UILabel = {
        
        let l = UILabel()
        l.backgroundColor = .clear
        l.text = "Aura"
        l.font = UIFont(name: K.Fonts.avenirBlack, size: 25)
        l.textAlignment = .left
        l.textColor = K.DesignColors.primary
        return l
        
    }()
    
    var lineView: UIView = {
        
        let v = UIView()
        v.backgroundColor = K.DesignColors.primary
        return v
        
    }()
    
    var signInLabel: UILabel = {
        
        // Label Subview
        let l = UILabel()
        l.text = NSLocalizedString("Sign Up / Log In", comment: "")
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        l.textAlignment = .left
        return l
        
    }()
    
    var signInButton: UIView = {
        
        let v = UIView()
        return v
        
    }()
    
    var voiceGenderButton: UIView = {
        
        let v = UIView()
        return v
        
    }()
    
    var genderLabel = UILabel()
    
    let toggle = UISwitch()
    
    var tutorialButton: UIView = {
        
        let v = UIView()
        
        // Image Subview
        let iv = UIImageView()
        
        if #available(iOS 13.0, *) {
            iv.image = UIImage(systemName: "questionmark.circle")
        }
        
        else {
            iv.image = #imageLiteral(resourceName: "questionmark.circle").withRenderingMode(.alwaysTemplate)
        }
        
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        // Label Subview
        let l = UILabel()
        l.text = NSLocalizedString("App Tutorial", comment: "directions on how to use the app")
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        l.textAlignment = .left
        
        v.addSubview(iv)
        v.addSubview(l)
        
        l.anchor(top: v.topAnchor, bottom: v.bottomAnchor, leading: nil, trailing: v.trailingAnchor, height: nil, width: nil)
        
        iv.centerYAnchor.constraint(equalTo: l.centerYAnchor).isActive = true
        iv.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20).isActive = true
        iv.trailingAnchor.constraint(equalTo: l.leadingAnchor, constant: -20).isActive = true
        
        return v
        
    }()
    
    var contactButton: UIView = {
        
        let v = UIView()
        
        // Image Subview
        let iv = UIImageView()
        
        if #available(iOS 13.0, *) {
            iv.image = UIImage(systemName: "envelope")
        }
        
        else {
            iv.image = #imageLiteral(resourceName: "envelope").withRenderingMode(.alwaysTemplate)
        }
        
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        // Label Subview
        let l = UILabel()
        l.text = NSLocalizedString("Contact", comment: "Contact us via email")
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        l.textAlignment = .left
        
        v.addSubview(iv)
        v.addSubview(l)
        
        l.anchor(top: v.topAnchor, bottom: v.bottomAnchor, leading: nil, trailing: v.trailingAnchor, height: nil, width: nil)
        
        iv.centerYAnchor.constraint(equalTo: l.centerYAnchor).isActive = true
        iv.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20).isActive = true
        iv.trailingAnchor.constraint(equalTo: l.leadingAnchor, constant: -20).isActive = true
        
        return v
        
    }()
    
    
    // INIT
    override init() {
        super.init()
        
        setupVoiceGender()
        setupWhiteView()
        addGestureRecognizers()
    }
    
    func setupVoiceGender() {
        
        // Setup voiceGender User Default
        if let _ = UserDefaults.standard.object(forKey: K.UserDefaultKeys.voiceGender) as? String {
            
            // Do Nothing
            
        } else { UserDefaults.standard.set("FEMALE", forKey: K.UserDefaultKeys.voiceGender) }
        
    }
    
    func setupSignInButton() {
        
        // Image Subview
        let iv = UIImageView()
        
        if #available(iOS 13.0, *) {
            iv.image = UIImage(systemName: "person")
        }
        
        else {
            iv.image = #imageLiteral(resourceName: "person").withRenderingMode(.alwaysTemplate)
        }
        
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        signInButton.addSubview(iv)
        signInButton.addSubview(signInLabel)
        
        signInLabel.anchor(top: signInButton.topAnchor,
                           bottom: signInButton.bottomAnchor,
                           leading: nil,
                           trailing: signInButton.trailingAnchor,
                           height: nil,
                           width: nil)
        
        iv.centerYAnchor.constraint(equalTo: signInLabel.centerYAnchor).isActive = true
        iv.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor, constant: 20).isActive = true
        iv.trailingAnchor.constraint(equalTo: signInLabel.leadingAnchor, constant: -20).isActive = true
        
    }
    
    func setupWhiteView() {
        
        // Add Title and UnderLine
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(lineView)
        
        titleLabel.anchor(top: whiteView.topAnchor,
                          bottom: nil,
                          leading: whiteView.leadingAnchor,
                          trailing: whiteView.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 50, left: 20, bottom: 0, right: 0))
        
        lineView.anchor(top: titleLabel.bottomAnchor,
                        bottom: nil,
                        leading: whiteView.leadingAnchor,
                        trailing: whiteView.trailingAnchor,
                        height: 1,
                        width: nil,
                        padding: UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0))
        
        // Add Sign In / Sign Up Button
        setupSignInButton()
        
        whiteView.addSubview(signInButton)
        
        if Auth.auth().currentUser != nil {
            
            signInLabel.text = NSLocalizedString("Sign Out", comment: "")
            
        }
        
        signInButton.anchor(top: lineView.bottomAnchor,
                            bottom: nil,
                            leading: whiteView.leadingAnchor,
                            trailing: whiteView.trailingAnchor,
                            height: 30,
                            width: nil,
                            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        
        // Add MALE or FEMALE voice Toggle
        setupGenderToggle()
        
        whiteView.addSubview(voiceGenderButton)
        
        voiceGenderButton.anchor(top: signInButton.bottomAnchor,
                                 bottom: nil,
                                 leading: whiteView.leadingAnchor,
                                 trailing: whiteView.trailingAnchor,
                                 height: 30,
                                 width: nil,
                                 padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        // Add Tutorial Button
        whiteView.addSubview(tutorialButton)
        
        tutorialButton.anchor(top: voiceGenderButton.bottomAnchor,
                              bottom: nil,
                              leading: whiteView.leadingAnchor,
                              trailing: whiteView.trailingAnchor,
                              height: 30,
                              width: nil,
                              padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        // Add Contact Button
        whiteView.addSubview(contactButton)
        
        contactButton.anchor(top: tutorialButton.bottomAnchor,
                             bottom: nil,
                             leading: whiteView.leadingAnchor,
                             trailing: whiteView.trailingAnchor,
                             height: 30,
                             width: nil,
                             padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    func setupGenderToggle() {
        
        // Image Subview
        let iv = UIImageView()
        
        if #available(iOS 13.0, *) {
            iv.image = UIImage(systemName: "waveform.path")
        }
        
        else {
            iv.image = #imageLiteral(resourceName: "waveform.path").withRenderingMode(.alwaysTemplate)
        }
        
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        // Label Subview
        let voiceGender = UserDefaults.standard.object(forKey: K.UserDefaultKeys.voiceGender) as? String
        genderLabel.text = voiceGender! == "FEMALE" ? NSLocalizedString("Audio Gender: Female", comment: "") : NSLocalizedString("Audio Gender: Male", comment: "")
        genderLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        genderLabel.textAlignment = .left
        
        voiceGenderButton.addSubview(iv)
        voiceGenderButton.addSubview(genderLabel)
        
        genderLabel.anchor(top: voiceGenderButton.topAnchor,
                 bottom: voiceGenderButton.bottomAnchor,
                 leading: nil,
                 trailing: nil,
                 height: nil,
                 width: nil)
        
        iv.centerYAnchor.constraint(equalTo: genderLabel.centerYAnchor).isActive = true
        iv.leadingAnchor.constraint(equalTo: voiceGenderButton.leadingAnchor, constant: 20).isActive = true
        iv.trailingAnchor.constraint(equalTo: genderLabel.leadingAnchor, constant: -20).isActive = true
        
        // Toggle
        toggle.onTintColor = K.DesignColors.primary
        toggle.backgroundColor = .white
        
        voiceGenderButton.addSubview(toggle)
        
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.centerYAnchor.constraint(equalTo: genderLabel.centerYAnchor).isActive = true
        toggle.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor).isActive = true
        toggle.trailingAnchor.constraint(equalTo: voiceGenderButton.trailingAnchor, constant: -20).isActive = true
        
        toggle.setOn(voiceGender! == "FEMALE", animated: false)
        
        if UIScreen.main.bounds.width <= 320 {
            toggle.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
        
    }
    
    func addGestureRecognizers() {
        
        // Add Gesture Recognizers for Sign Up / Sign In
        let b1 = UIButton()
        b1.backgroundColor = .clear
                
        b1.addTarget(self, action: #selector(signInPressed(_:)), for: .touchUpInside)
        b1.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        b1.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        b1.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        b1.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        signInButton.addSubview(b1)
        
        b1.anchor(top: signInButton.topAnchor,
                  bottom: signInButton.bottomAnchor,
                  leading: signInButton.leadingAnchor,
                  trailing: signInButton.trailingAnchor,
                  height: nil,
                  width: nil)
        
        // Add Gesture Recognizers for Toggle
        let b2 = UIButton()
        b2.backgroundColor = .clear
        
                
        b2.addTarget(self, action: #selector(togglePressed(_:)), for: .touchUpInside)
        b2.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        b2.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        b2.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        b2.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        voiceGenderButton.addSubview(b2)
        
        b2.anchor(top: voiceGenderButton.topAnchor,
                  bottom: voiceGenderButton.bottomAnchor,
                  leading: voiceGenderButton.leadingAnchor,
                  trailing: voiceGenderButton.trailingAnchor,
                  height: nil,
                  width: nil)
        
        // Add Gesture Recognizers for Tutorial
        let b3 = UIButton()
        b3.backgroundColor = .clear
                
        b3.addTarget(self, action: #selector(tutorialPressed(_:)), for: .touchUpInside)
        b3.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        b3.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        b3.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        b3.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        tutorialButton.addSubview(b3)
        
        b3.anchor(top: tutorialButton.topAnchor,
                  bottom: tutorialButton.bottomAnchor,
                  leading: tutorialButton.leadingAnchor,
                  trailing: tutorialButton.trailingAnchor,
                  height: nil,
                  width: nil)
        
        // Add Gesture Recognizers for Contact
        let b4 = UIButton()
        b4.backgroundColor = .clear
                
        b4.addTarget(self, action: #selector(contactPressed(_:)), for: .touchUpInside)
        b4.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        b4.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpOutside)
        b4.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchDragOutside)
        b4.addTarget(self, action: #selector(touchDown(_:)), for: .touchDragInside)
        
        contactButton.addSubview(b4)
        
        b4.anchor(top: contactButton.topAnchor,
                  bottom: contactButton.bottomAnchor,
                  leading: contactButton.leadingAnchor,
                  trailing: contactButton.trailingAnchor,
                  height: nil,
                  width: nil)

    }
    
    func showSettings() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            blackView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(_:))))
            
            window.addSubview(blackView)
            window.addSubview(whiteView)
            
            whiteView.frame = CGRect(x: -width, y: 0, width: width, height: window.frame.height)
            whiteView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(_:))))
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                self.whiteView.frame = CGRect(x: 0, y: 0, width: self.whiteView.frame.width, height: self.whiteView.frame.height)
                
            }, completion: nil)
            
        }
    }
    
    @objc func handleDismiss() {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.blackView.alpha = 0
            self.whiteView.frame = CGRect(x: -self.whiteView.frame.width, y: 0, width: self.whiteView.frame.width, height: self.whiteView.frame.height)
            
        }) { (_) in
            
            self.blackView.removeFromSuperview()
            self.whiteView.removeFromSuperview()
            
        }
        
    }
    
    @objc func handleSwipe(_ sender: UIPanGestureRecognizer) {
        
        let point = sender.translation(in: sender.view!)
        
        if whiteView.frame.origin.x + point.x <= 0 {
            
            whiteView.center = CGPoint(x: initialCenterX + point.x, y: initialCenterY)
            let alphaValue = abs((width + whiteView.frame.origin.x) / width)
            blackView.alpha = alphaValue
            
        }
        
        if sender.state == .ended {
            
            if whiteView.frame.origin.x < -(width * 0.3) {
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.blackView.alpha = 0
                    self.whiteView.frame = CGRect(x: -self.whiteView.frame.width, y: 0, width: self.whiteView.frame.width, height: self.whiteView.frame.height)
                    
                }) { (_) in
                    
                    self.blackView.removeFromSuperview()
                    self.whiteView.removeFromSuperview()
                    
                }
                
            }
            
            else {
                
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    
                    self.blackView.alpha = 1
                    self.whiteView.frame = CGRect(x: 0, y: 0, width: self.whiteView.frame.width, height: self.whiteView.frame.height)
                    
                }, completion: nil)
                
            }
            
        }
        
    }
    
    @objc func signInPressed(_ sender: UIButton) {
        
        // First Animation: Highlight
        UIView.animate(withDuration: 0.2, animations: {
            
            sender.backgroundColor = UIColor(white: 1, alpha: 0.4)
            
        }) { (_ ) in
            
            // Second Animation: Back to Normal
            UIView.animate(withDuration: 0.2, animations: {
                
                sender.backgroundColor = .clear
                
            }) { (_ ) in
                
                
                // Run Sign In / Sign Out Process
                if Utilities.shared.isUserSignedIn {
                    
                    self.handleDismiss()
                    Utilities.shared.signUserOut(alertIn: self.parentVC!)
                }
                    
                else {
                    
                    self.handleDismiss()
                    let vc = Utilities.shared.getLoginVC()
                    let login = vc.viewControllers[0] as! LoginController
                    login.isModal = true
                    self.parentVC!.present(vc, animated: true, completion: nil)
                    
                }
            }
        }
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
    
    @objc func togglePressed(_ sender: UIButton) {
        
        // First Animation: Highlight
        UIView.animate(withDuration: 0.2, animations: {
            
            sender.backgroundColor = UIColor(white: 1, alpha: 0.4)
            
        }) { (_ ) in
            
            // Second Animation: Back to Normal
            UIView.animate(withDuration: 0.2, animations: {
                
                sender.backgroundColor = .clear
                
            }) { (_ ) in
                
                // Run Toggle
                if !self.toggle.isOn {
                    
                    // Update User Defaults
                    UserDefaults.standard.set("FEMALE", forKey: K.UserDefaultKeys.voiceGender)
                    
                    // Update Toggle
                    self.toggle.setOn(true, animated: true)
                    self.genderLabel.text = NSLocalizedString("Audio Gender: Female", comment: "")
                    
                }
                    
                else {
                    
                    UserDefaults.standard.set("MALE", forKey: K.UserDefaultKeys.voiceGender)
                    
                    self.toggle.setOn(false, animated: true)
                    self.genderLabel.text = NSLocalizedString("Audio Gender: Male", comment: "")

                }
            }
        }
    }
    
    @objc func tutorialPressed(_ sender: UIButton) {
        
        // First Animation: Highlight
        UIView.animate(withDuration: 0.2, animations: {
            
            sender.backgroundColor = UIColor(white: 1, alpha: 0.4)
            
        }) { (_ ) in
            
            // Second Animation: Back to Normal
            UIView.animate(withDuration: 0.2, animations: {
                
                sender.backgroundColor = .clear
                
            }) { (_ ) in
                
                self.handleDismiss()
                let vc = TutorialController()
                vc.modalPresentationStyle = .fullScreen
                self.parentVC?.present(vc, animated: true, completion: nil)
                
            }
        }
    }
    
    @objc func contactPressed(_ sender: UIButton) {
        
        // First Animation: Highlight
        UIView.animate(withDuration: 0.2, animations: {
            
            sender.backgroundColor = UIColor(white: 1, alpha: 0.4)
            
        }) { (_ ) in
            
            // Second Animation: Back to Normal
            UIView.animate(withDuration: 0.2, animations: {
                
                sender.backgroundColor = .clear
                
            }) { (_ ) in
                
                // Run Tutorial
                self.handleDismiss()
                let vc = SendEmailViewController()
                self.tabBarVC!.selectedViewController!.present(vc, animated: true, completion: nil)
                
            }
        }
    }
    
}
