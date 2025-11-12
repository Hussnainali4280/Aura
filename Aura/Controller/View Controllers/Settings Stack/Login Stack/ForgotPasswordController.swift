//
//  ForgotPasswordController.swift
//  Aura
//
//  Created by Max Dolensky on 10/1/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordController: UIViewController {
    
    var isModal = false
    
    var titleLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 30))
        label.backgroundColor = .clear
        label.font = UIFont(name: K.Fonts.avenirBlack, size: 17)
        label.text = NSLocalizedString("Reset Password", comment: "")
        label.numberOfLines = 2
        label.textColor = .black
        label.textAlignment = .center
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
        
    var explanationLabel: UILabel = {
        
        let l = UILabel()
        l.text = NSLocalizedString("A link will be sent to your email address to reset your password if your account exists", comment: "")
        l.textAlignment = .center
        l.backgroundColor = .white
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        l.numberOfLines = 0
        return l
        
    }()

    var resetButton: UIButton = {
        
        let button = UIButton()
        button.setTitle(NSLocalizedString("Reset Password", comment: ""), for: .normal)
        button.styleFilledButton(fillColor: K.Colors.purple)
        button.addTarget(self, action: #selector(resetPressed(_:)), for: .touchUpInside)
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
        
        let container = UIView()
        container.addSubview(emailTextField)
        container.addSubview(explanationLabel)
        container.addSubview(resetButton)
        container.addSubview(errLabel)
        
        emailTextField.anchor(top: container.topAnchor,
                         bottom: nil,
                         leading: container.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: 40,
                         width: nil)
        
        resetButton.anchor(top: emailTextField.bottomAnchor,
                              bottom: nil,
                              leading: container.leadingAnchor,
                              trailing: container.trailingAnchor,
                              height: 50,
                              width: nil,
                              padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        explanationLabel.anchor(top: resetButton.bottomAnchor,
                                bottom: nil,
                                 leading: container.leadingAnchor,
                                 trailing: container.trailingAnchor,
                                 height: 40,
                                 width: nil,
                                 padding: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0))
        
        errLabel.anchor(top: explanationLabel.bottomAnchor,
                        bottom: container.bottomAnchor,
                        leading: container.leadingAnchor,
                        trailing: container.trailingAnchor,
                        height: nil,
                        width: nil,
                        padding: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0))
                
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
    @objc func resetPressed(_ sender: UIButton) {
        
        if let text = emailTextField.text {
            
            Auth.auth().sendPasswordReset(withEmail: text) { error in
              
                if let error = error {
                    self.showError(error.localizedDescription)
                    return
                }
                
                if let window = UIApplication.shared.keyWindow {
                    
                    window.displayCheck(text: NSLocalizedString("Sent", comment: "email sent"))
                    
                }
                
                self.navigationController?.popViewController(animated: true)
                
            }
        }
    }
    
    @objc func cancelButtonTapped() {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func showError(_ message: String) {
        
        errLabel.text = message
        errLabel.isHidden = false
        
    }
}
