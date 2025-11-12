//
//  SignInController.swift
//  Aura
//
//  Created by Max Dolensky on 8/4/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import Firebase

class SignInController: UIViewController {

    var isModal = false
    var isForPurchase = false
    var buyDelegate: BuyButtonPopUpView?
    var delegate: AddFlashcardDelegate?
    var selectedTabAfterLogin = 0
    
    var titleLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 30))
        label.backgroundColor = .clear
        label.font = UIFont(name: K.Fonts.avenirBlack, size: 15)
        label.text = NSLocalizedString("Log In", comment: "")
        label.numberOfLines = 2
        label.textColor = .black
        label.textAlignment = .center
        return label
        
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
    
    var emailTextField: UITextField = {
        
        let textField = UITextFieldPadding()
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.roundCorners(cornerRadius: 4)
        textField.textColor = .black
        textField.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textField.placeholder = NSLocalizedString("Email", comment: "")
        textField.setBorder(color: K.Colors.purple)
        
        return textField
        
    }()
    
    var passwordTextField: UITextField = {
        
        let textField = UITextFieldPadding()
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.roundCorners(cornerRadius: 4)
        textField.textColor = .black
        textField.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textField.placeholder = NSLocalizedString("Password", comment: "")
        textField.setBorder(color: K.Colors.purple)
        textField.isSecureTextEntry = true
        return textField
        
    }()
    
    var userAgreementLabel: UILabel = {
        
        let l = UILabel()
        
        let attText1 = NSMutableAttributedString(string: NSLocalizedString("By creating an account you're agreeing to our ", comment: "By creating an account you're agreeing to our Terms & Privacy Policy"))
        let attText2 = NSMutableAttributedString(string: NSLocalizedString("Terms", comment: "By creating an account you're agreeing to our Terms & Privacy Policy"))
        let attText3 = NSMutableAttributedString(string: NSLocalizedString(" & ", comment: "By creating an account you're agreeing to our Terms & Privacy Policy"))
        let attText4 = NSMutableAttributedString(string: NSLocalizedString("Privacy Policy", comment: "By creating an account you're agreeing to our Terms & Privacy Policy"))
        let attText5 = NSMutableAttributedString(string: NSLocalizedString(".     ", comment: "By creating an account you're agreeing to our Terms & Privacy Policy"))
        
        attText2.addAttribute(.foregroundColor, value: K.Colors.purple, range: NSRange(location: 0, length: attText2.length))
        attText4.addAttribute(.foregroundColor, value: K.Colors.lightPink, range: NSRange(location: 0, length: attText4.length))
        
        attText1.append(attText2)
        attText1.append(attText3)
        attText1.append(attText4)
        attText1.append(attText5)
       
        attText1.addAttribute(.font, value: UIFont.systemFont(ofSize: 13), range: NSRange(location: 0, length: attText1.length))
        
        l.isUserInteractionEnabled = true
        l.attributedText = attText1
        l.textAlignment = .center
        l.backgroundColor = .white
        l.lineBreakMode = .byWordWrapping
        l.baselineAdjustment = .none
        l.numberOfLines = 0
        return l
        
    }()
    
    var forgotPasswordButton: UIButton = {
        
        let b = UIButton()
        b.setTitle(NSLocalizedString("Forgot Password?", comment: ""), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        b.setTitleColor(K.Colors.purple, for: .normal)
        return b
        
    }()
    
    var logInButton: UIButton = {
        
        let button = UIButton()
        button.setTitle(NSLocalizedString("Log In", comment: ""), for: .normal)
        button.styleFilledButton(fillColor: K.Colors.purple)
        return button
        
    }()
    
    var errLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .red
        label.numberOfLines = 0
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        
        view.backgroundColor = .white
        logInButton.addTarget(self, action: #selector(logInPressed(_:)), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordClicked), for: .touchUpInside)
        
        // Add Center Title
        self.navigationItem.titleView = titleLabel
        
        setupToHideKeyboardOnTapOnView()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.topItem?.title = " "
        errLabel.isHidden = true
        
        if isModal {
            
            // Add cancel button
            if #available(iOS 13.0, *) {
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                                                         style: .plain,
                                                                         target: self,
                                                                         action: #selector(cancelButtonTapped))
            } else {
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "multiply").withRenderingMode(.alwaysTemplate),
                                                                         style: .plain,
                                                                         target: self,
                                                                         action: #selector(cancelButtonTapped))
            }
            
        }
        
        view.addSubview(auraLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(logInButton)
        view.addSubview(userAgreementLabel)
        view.addSubview(errLabel)
        
        auraLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         bottom: nil,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0))
        
        emailTextField.delegate = self
        emailTextField.anchor(top: auraLabel.bottomAnchor,
                              bottom: nil,
                              leading: view.leadingAnchor,
                              trailing: view.trailingAnchor,
                              height: 40,
                              width: nil,
                              padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
        passwordTextField.delegate = self
        passwordTextField.anchor(top: emailTextField.bottomAnchor,
                                 bottom: nil,
                                 leading: view.leadingAnchor,
                                 trailing: view.trailingAnchor,
                                 height: 40,
                                 width: nil,
                                 padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
        forgotPasswordButton.anchor(top: passwordTextField.bottomAnchor,
                                    bottom: nil,
                                    leading: nil,
                                    trailing: passwordTextField.trailingAnchor,
                                    height: nil,
                                    width: nil,
                                    padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0))
        
        logInButton.anchor(top: forgotPasswordButton.bottomAnchor,
                           bottom: nil,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           height: 50,
                           width: nil,
                           padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
        userAgreementLabel.anchor(top: logInButton.bottomAnchor,
                                  bottom: nil,
                                  leading: view.leadingAnchor,
                                  trailing: view.trailingAnchor,
                                  height: nil,
                                  width: nil,
                                  padding: UIEdgeInsets(top: 12, left: 60, bottom: 0, right: -60))
        
        errLabel.anchor(top: userAgreementLabel.bottomAnchor,
                        bottom: nil,
                        leading: view.leadingAnchor,
                        trailing: view.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 12, left: 40, bottom: 0, right: -40))
        
        userAgreementLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(termsAndPrivacyPressed(_:))))
    }
    
    @objc func termsAndPrivacyPressed(_ gesture: UITapGestureRecognizer) {
        // Get Letter Index and Color
        guard let index = gesture.indexForTapAttributedTextInLabel(label: self.userAgreementLabel) else { return }
        guard let color = userAgreementLabel.attributedText?.attribute(.foregroundColor, at: index, effectiveRange: nil) as? UIColor else { return }
        
        if color == K.Colors.purple {
            let vc = UserAgreementVC()
            vc.titleLabel.text = "Terms & Conditions"
            vc.textView.attributedText = vc.terms.htmlToAttributedString
            present(vc, animated: true, completion: nil)
        } else if color == K.Colors.lightPink {
            let vc = UserAgreementVC()
            vc.titleLabel.text = "Privacy Policy"
            vc.textView.attributedText = vc.privacyPolicy.htmlToAttributedString
            present(vc, animated: true, completion: nil)
        } else { return }
    }
    
    @objc func logInPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, animations: {
            
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        }) { (completion) in
            
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
            
        }
        
        // Get email and password
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            
            showError(NSLocalizedString("Error retrieving input, try again", comment: ""))
            return
            
        }
        
        // Check that all fields are filled out
        if email.count == 0 || password.count == 0 {
            
            showError(NSLocalizedString("Please fill out all fields", comment: ""))
            
        }
        
        // Start Loading Screen
        DispatchQueue.main.async {
            self.startLoadingScreen()
        }
        
        // Sign In
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                
                DispatchQueue.main.async {
                    self.endLoadingScreen()
                }
                self.showError(error.localizedDescription)
                return
                
            }
            
            self.errLabel.isHidden = true
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
            
            Utilities.shared.isUserSignedIn = true
            AnalyticsManager.shared.logLogin()
            
            FirebaseManager.shared.loadUser()
            
            DispatchQueue.main.async {
                self.endLoadingScreen()
            }
            
            let tabVC = Utilities.shared.getTabVC()
            tabVC.selectedIndex = self.selectedTabAfterLogin
            
            let window = UIApplication.shared.keyWindow
            window?.rootViewController = tabVC
            
            if self.selectedTabAfterLogin == 4 {
                AdManager.shared.showBuyButton(inVideo: false,
                                               isForKYGCourse: false,
                                               isAfterEHDPurchase: false,
                                               videoVC: nil,
                                               parentVC: tabVC.children[4]
                )
            }
            
            self.selectedTabAfterLogin = 0
            
        }
    }
    
    
    func showError(_ message: String) {
        
        errLabel.text = message
        errLabel.isHidden = false
        
    }
    
    @objc func forgotPasswordClicked() {
        
        let vc = ForgotPasswordController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func cancelButtonTapped() {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

extension SignInController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
}
