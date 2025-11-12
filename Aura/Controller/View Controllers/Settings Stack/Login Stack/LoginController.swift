//
//  LoginController.swift
//  Aura
//
//  Created by Max Dolensky on 7/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

protocol AddFlashcardDelegate {
    
    func tapAddFlashcardButton()
    
}

class LoginController: UIViewController {
    
    var isModal = false
    var isForPurchase = false
    var buyDelegate: BuyButtonPopUpView?
    var delegate: AddFlashcardDelegate?
    var selectedTabAfterLogin = 0
    
    var purchaseLabel: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("The only place to learn English HD!", comment: "")
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.numberOfLines = 0
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .center
        return l
    }()
    
    var auraLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        
        let title = NSMutableAttributedString(string: "Aura")
        title.addAttribute(.foregroundColor, value: K.Colors.purple, range: NSRange(location: 0, length: 2))
        title.addAttribute(.foregroundColor, value: K.Colors.darkGrey, range: NSRange(location: 2, length: 1))
        title.addAttribute(.foregroundColor, value: K.Colors.lightPink, range: NSRange(location: 3, length: 1))
        
        label.attributedText = title

        return label
        
    }()
    
    var signUpButton: UIButton = {
        
        let button = UIButton()
        button.setTitle(NSLocalizedString("Sign Up", comment: "sign up for a new account"), for: .normal)
        button.styleFilledButton(fillColor: K.Colors.purple)
        return button
        
    }()
    
    var logInButton: UIButton = {
        
        let button = UIButton()
        button.setTitle(NSLocalizedString("Log In", comment: "log in to your existing account"), for: .normal)
        button.styleHollowbutton(outlineColor: .black)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        AnalyticsManager.shared.logLoginImpression()
        
    }
    
    func setup() {
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //self.navigationController?.isNavigationBarHidden = true
        
        signUpButton.addTarget(self, action: #selector(signUpPressed(_:)), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(logInPressed(_:)), for: .touchUpInside)
        
        let container = UIView()
        
        container.addSubview(auraLabel)
        container.addSubview(purchaseLabel)
        container.addSubview(signUpButton)
        container.addSubview(logInButton)
        
        
        auraLabel.anchor(top: container.topAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil)
        
        purchaseLabel.anchor(top: auraLabel.bottomAnchor,
                             bottom: nil,
                             leading: container.leadingAnchor,
                             trailing: container.trailingAnchor,
                             height: 50,
                             width: nil,
                             padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        signUpButton.anchor(top: purchaseLabel.bottomAnchor,
                            bottom: nil,
                            leading: container.leadingAnchor,
                            trailing: container.trailingAnchor,
                            height: 50,
                            width: nil,
                            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        logInButton.anchor(top: signUpButton.bottomAnchor,
                           bottom: container.bottomAnchor,
                           leading: container.leadingAnchor,
                           trailing: container.trailingAnchor,
                           height: 50,
                           width: nil,
                           padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        container.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        
    }
    
    @objc func signUpPressed(_ sender: UIButton) {
       
        UIView.animate(withDuration: 0.1, animations: {
            
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        }) { (completion) in
            
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
            
        }
        
        let signUpVC = SignUpController()
        signUpVC.isModal = self.isModal
        signUpVC.isForPurchase = self.isForPurchase
        signUpVC.buyDelegate = self.buyDelegate
        signUpVC.delegate = self.delegate
        signUpVC.selectedTabAfterLogin = self.selectedTabAfterLogin
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    
    @objc func logInPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, animations: {
            
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        }) { (completion) in
            
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
            
        }
        
        let logInVC = SignInController()
        logInVC.isModal = self.isModal
        logInVC.isForPurchase = self.isForPurchase
        logInVC.buyDelegate = self.buyDelegate
        logInVC.delegate = self.delegate
        logInVC.selectedTabAfterLogin = self.selectedTabAfterLogin
        self.navigationController?.pushViewController(logInVC, animated: true)
        
    }
    
    @objc func cancelButtonTapped() {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func showPopUp() {
        
        guard let window = UIApplication.shared.keyWindow else { return }
                
        let popUp = FlashcardsPopUpView(frame: .zero)
        popUp.alpha = 0
        
        window.addSubview(popUp)
        
        popUp.anchor(top: window.topAnchor,
                         bottom: window.bottomAnchor,
                         leading: window.leadingAnchor,
                         trailing: window.trailingAnchor,
                         height: nil,
                         width: nil)
            
        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            popUp.alpha = 1
            
        }, completion: nil)
        
    }
    
}
