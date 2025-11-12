//
//  SendEmailViewController.swift
//  Aura
//
//  Created by Maxwell Dolensky on 3/5/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import UIKit
import MessageUI

class SendEmailViewController: UIViewController {
    
    var cancelButton: UIButton = {
        
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "multiply"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "multiply").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        button.backgroundColor = .white
        button.tintColor = .black
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return button
        
    }()
    
    let header: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Contact", comment: "Contact")
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        return l
    }()
    
    var nameTextField: UITextField = {
        
        let textField = UITextFieldPadding()
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.roundCorners(cornerRadius: 4)
        textField.textColor = .black
        textField.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textField.placeholder = NSLocalizedString("Name", comment: "Users Name")
        textField.setBorder(color: K.DesignColors.primary)
        textField.returnKeyType = .done
        
        return textField
        
    }()
    
    var emailTextField: UITextField = {
        
        let textField = UITextFieldPadding()
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.roundCorners(cornerRadius: 4)
        textField.textColor = .black
        textField.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textField.placeholder = NSLocalizedString("Email", comment: "Users Email")
        textField.setBorder(color: K.DesignColors.primary)
        textField.returnKeyType = .done
        
        return textField
        
    }()
    
    var subjectTextField: UITextField = {
        
        let textField = UITextFieldPadding()
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.roundCorners(cornerRadius: 4)
        textField.textColor = .black
        textField.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textField.placeholder = NSLocalizedString("Subject", comment: "Email subject")
        textField.setBorder(color: K.DesignColors.primary)
        textField.returnKeyType = .done
        return textField
        
    }()
    
    var bodyTextView: UITextView = {
        
        let textView = UITextView()
        textView.returnKeyType = .done
        textView.text = NSLocalizedString("Enter text", comment: "enter the text you want to  search here")
        textView.textColor = .lightGray
        textView.font = .systemFont(ofSize: 17)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 2
        textView.layer.borderColor = K.DesignColors.primary.cgColor
        return textView
    
    }()
    
    var contactButton: AnimatedButton = {
        let b = AnimatedButton()
        b.backgroundColor = K.DesignColors.primary
        b.setTitle(NSLocalizedString("Contact", comment: "Contact"), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        b.isFlat = true
        b.addTarget(self, action: #selector(contactPressed(_:)), for: .touchUpInside)
        return b
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        self.setupToHideKeyboardOnTapOnView()
        
        
        view.backgroundColor = .white
        view.addSubview(cancelButton)
        view.addSubview(header)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(subjectTextField)
        view.addSubview(bodyTextView)
        view.addSubview(contactButton)
        
        cancelButton.anchor(top: view.topAnchor,
                            bottom: nil,
                            leading: nil,
                            trailing: view.trailingAnchor,
                            height: 25,
                            width: 25,
                            padding: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: -12))
        
        header.anchor(top: view.topAnchor,
                      bottom: nil,
                      leading: view.leadingAnchor,
                      trailing: view.trailingAnchor,
                      height: nil,
                      width: nil,
                      padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: -30))
        
        nameTextField.delegate = self
        nameTextField.anchor(top: header.bottomAnchor,
                    bottom: nil,
                    leading: header.leadingAnchor,
                    trailing: header.trailingAnchor,
                    height: 40,
                    width: nil,
                    padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        emailTextField.delegate = self
        emailTextField.anchor(top: nameTextField.bottomAnchor,
                    bottom: nil,
                    leading: header.leadingAnchor,
                    trailing: header.trailingAnchor,
                    height: 40,
                    width: nil,
                    padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        subjectTextField.delegate = self
        subjectTextField.anchor(top: emailTextField.bottomAnchor,
                    bottom: nil,
                    leading: header.leadingAnchor,
                    trailing: header.trailingAnchor,
                    height: 40,
                    width: nil,
                    padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        bodyTextView.delegate = self
        bodyTextView.anchor(top: subjectTextField.bottomAnchor,
                    bottom: nil,
                    leading: header.leadingAnchor,
                    trailing: header.trailingAnchor,
                    height: 120,
                    width: nil,
                    padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        contactButton.anchor(top: bodyTextView.bottomAnchor,
                             bottom: nil,
                             leading: header.leadingAnchor,
                             trailing: header.trailingAnchor,
                             height: 50,
                             width: nil,
                             padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
    }
    
    @objc func contactPressed(_ sender: AnimatedButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
        } completion: { (_) in
            if MFMailComposeViewController.canSendMail() {
                let recipient = ["imaginativeai.aura.help@gmail.com"]
                let mc = MFMailComposeViewController()
                mc.mailComposeDelegate = self
                mc.setToRecipients(recipient)
                mc.setSubject(self.subjectTextField.text!)
                mc.setMessageBody("Name: \(self.nameTextField.text!)\n\nEmail: \(self.emailTextField.text!)\n\nBody:\n\(self.bodyTextView.text!)", isHTML: false)
                self.present(mc, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: NSLocalizedString("Unable to access the mail app", comment: ""),
                                              message: NSLocalizedString("If you need to contact us, please send an email to imaginativeai.aura.help@gmail.com", comment: ""),
                                              preferredStyle: .alert)
                let action = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}

extension SendEmailViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        // In future we can give people a free deck if they share the app or something
        switch result {
        case MFMailComposeResult.cancelled:
            break
        case MFMailComposeResult.failed:
            break
        case MFMailComposeResult.saved:
            break
        case MFMailComposeResult.sent:
            break
        @unknown default:
            break
        }
        
        dismiss(animated: true, completion: nil)
    }
}

extension SendEmailViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        DispatchQueue.main.async {
            
            if textView.textColor == .lightGray {
                textView.text = ""
                textView.textColor = .black
            }
            
        }
    }

    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        DispatchQueue.main.async {
            
            if textView.text.isEmpty || textView.text == "" {
                textView.textColor = .lightGray
                textView.text = NSLocalizedString("Enter text", comment: "enter the text you want to  search here")
            }
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

extension SendEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
}
