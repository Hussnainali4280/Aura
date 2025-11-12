//
//  BuyButtonPopUpView.swift
//  Aura
//
//  Created by Maxwell Dolensky on 2/12/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class BuyButtonPopUpView: UIView {
    
    var isMinimized = false
    var isVideoPopUp = true
    var isAfterEHDPurchase = false
    var courseType: CourseType = .EHDMasterCourse
    var videoVC: PUAVPlayerViewController?
    var parentVC: UIViewController?
    var creatorCode: String?
    
    var mainTitleTop: NSLayoutConstraint?
    var featureHeaderTop: NSLayoutConstraint?
    var feature1Top: NSLayoutConstraint?
    var reviewsHeaderTop: NSLayoutConstraint?
    var review1Top: NSLayoutConstraint?
    
    let container: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.roundCorners(cornerRadius: 10)
        return v
    }()
    
    let mainTitle: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Get the English HD Master Course Now!", comment: "")
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textColor = K.DesignColors.primary
        return l
    }()
    
    let featuresHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Features", comment: "")
        l.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        l.textAlignment = .left
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textColor = K.DesignColors.primary
        return l
    }()
    
    let feature1: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("• 140+ lessons", comment: "")
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let feature2: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("• 500+ flashcards ", comment: "")
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let feature3: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("• Lifetime access to all future content", comment: "")
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let reviewsHeader: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("Reviews", comment: "")
        l.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        l.textAlignment = .left
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.textColor = K.DesignColors.primary
        return l
    }()
    
    let review1: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("\"After using this, I can now hear that Japanese people’s English pronunciation is wrong.\"", comment: "")
        l.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    let review2: UILabel = {
        let l = UILabel()
        l.text = NSLocalizedString("\"Japanese learners tend to be obsessed with the outdated ways that they learned from Japanese English teachers. I think your new system is better to learn English pronunciation.\"", comment: "")
        l.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    let name1: UILabel = {
        let l = UILabel()
        l.text = "- Takeshi"
        l.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        l.textColor = .gray
        l.textAlignment = .right
        l.numberOfLines = 0
        return l
    }()
    
    let name2: UILabel = {
        let l = UILabel()
        l.text = "- Yoshiaki"
        l.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        l.textColor = .gray
        l.textAlignment = .right
        l.numberOfLines = 0
        return l
    }()
            
    let buyButton: AnimatedButton = {
        
        let b = AnimatedButton()
        b.setTitle(NSLocalizedString("Purchase", comment: ""), for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        b.tintColor = .white
        b.backgroundColor = K.DesignColors.primary
        return b
        
    }()
    
    let buttonBackground = UIView()
    
    let bundleButton: AnimatedButton = {
        
        let b = AnimatedButton()
        b.setTitle(NSLocalizedString("Purchase Bundle", comment: ""), for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        b.tintColor = .white
        b.backgroundColor = K.DesignColors.primary
        return b
        
    }()
    
    let creatorButton: AnimatedButton = {
        
        let b = AnimatedButton()
        b.isFlat = true
        b.setTitle(NSLocalizedString("Support a creator", comment: ""), for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        b.setTitleColor(K.DesignColors.primary, for: .normal)
        b.backgroundColor = .white
        return b
        
    }()
    
    let bundleBackground = UIView()
    
    let closeButton: AnimatedButton = {
        let b = AnimatedButton()
        if #available(iOS 13.0, *) {
            b.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        } else {
            b.setImage(#imageLiteral(resourceName: "downChevron"), for: .normal)
        }
        b.tintColor = K.DesignColors.primary
        b.backgroundColor = .white
        b.roundCorners(cornerRadius: 15)
        b.contentVerticalAlignment = .fill
        b.contentHorizontalAlignment = .fill
        b.imageView?.contentMode = .scaleAspectFit
        b.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return b
    }()
    
    let closeButtonBackground = UIView()
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, isVideoPopUp: Bool, courseType: CourseType = .EHDMasterCourse, isAfterEHDPurchase: Bool = false) {
        self.init(frame: frame)
        self.isVideoPopUp = isVideoPopUp
        self.courseType = courseType
        self.isAfterEHDPurchase = isAfterEHDPurchase
        setup()
        setText()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        
        self.addSubview(container)
        self.setShadow(color: .black, opacity: 0.3, offset: CGSize(width: 0, height: -2), radius: 4, cornerRadius: 10)
        
        container.addSubview(mainTitle)
        container.addSubview(featuresHeader)
        container.addSubview(feature1)
        container.addSubview(feature2)
        container.addSubview(feature3)
        container.addSubview(reviewsHeader)
        container.addSubview(review1)
        container.addSubview(name1)
        container.addSubview(review2)
        container.addSubview(name2)
        container.addSubview(buttonBackground)
        container.addSubview(creatorButton)
        self.addSubview(closeButtonBackground)
        

        container.addSubview(bundleBackground)

        
        setConstraints()
        
        buyButton.addTarget(self, action: #selector(buyPressed(_:)), for: .touchUpInside)
        bundleButton.addTarget(self, action: #selector(bundlePressed(_:)), for: .touchUpInside)
        if isVideoPopUp {
            closeButton.addTarget(self, action: #selector(minimize(_:)), for: .touchUpInside)
            let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(minimizeFromSwipe(_:)))
            swipeDown.direction = .down
            self.addGestureRecognizer(swipeDown)
            let swipeUp = UISwipeGestureRecognizer(target: self, action:  #selector(minimizeFromSwipe(_:)))
            swipeUp.direction = .up
            self.addGestureRecognizer(swipeUp)
        } else {
            if #available(iOS 13.0, *) {
                closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
            } else {
                closeButton.setImage(#imageLiteral(resourceName: "xmark"), for: .normal)
            }
            closeButton.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
            let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismissFromSwipe(_:)))
            swipeDown.direction = .down
            self.addGestureRecognizer(swipeDown)
            let swipeUp = UISwipeGestureRecognizer(target: self, action:  #selector(dismissFromSwipe(_:)))
            swipeUp.direction = .up
            self.addGestureRecognizer(swipeUp)
        }
        creatorButton.addTarget(self, action: #selector(creatorButtonPressed(_:)), for: .touchUpInside)
            
    }
    
    func setConstraints() {
        
        container.anchor(top: self.topAnchor,
                         bottom: self.bottomAnchor,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitleTop = mainTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 24)
        mainTitleTop?.isActive = true
        mainTitle.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        mainTitle.leadingAnchor.constraint(greaterThanOrEqualTo: container.leadingAnchor, constant: 20).isActive = true
        mainTitle.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -20).isActive = true
        
        featuresHeader.translatesAutoresizingMaskIntoConstraints = false
        featureHeaderTop = featuresHeader.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 20)
        featureHeaderTop?.isActive = true
        featuresHeader.anchor(top: nil,
                         bottom: nil,
                         leading: mainTitle.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: -30))
        
        feature1.translatesAutoresizingMaskIntoConstraints = false
        feature1Top = feature1.topAnchor.constraint(equalTo: featuresHeader.bottomAnchor, constant: 20)
        feature1Top?.isActive = true
        feature1.anchor(top: nil,
                         bottom: nil,
                         leading: mainTitle.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: -30))
        
        feature2.anchor(top: feature1.bottomAnchor,
                         bottom: nil,
                         leading: mainTitle.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 6, left: 0, bottom: 0, right: -30))
        
        feature3.anchor(top: feature2.bottomAnchor,
                         bottom: nil,
                         leading: mainTitle.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 6, left: 0, bottom: 0, right: -30))
        
        reviewsHeader.translatesAutoresizingMaskIntoConstraints = false
        reviewsHeaderTop = reviewsHeader.topAnchor.constraint(equalTo: feature3.bottomAnchor, constant: 20)
        reviewsHeaderTop?.isActive = true
        reviewsHeader.anchor(top: nil,
                         bottom: nil,
                         leading: mainTitle.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: -30))
        
        review1.translatesAutoresizingMaskIntoConstraints = false
        review1Top = review1.topAnchor.constraint(equalTo: reviewsHeader.bottomAnchor, constant: 28)
        review1Top?.isActive = true
        review1.anchor(top: nil,
                         bottom: nil,
                         leading: mainTitle.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 28, left: 0, bottom: 0, right: -40))
        
        name1.anchor(top: review1.bottomAnchor,
                         bottom: nil,
                         leading: mainTitle.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: -50))
        
        review2.anchor(top: name1.bottomAnchor,
                         bottom: nil,
                         leading: mainTitle.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: -40))
        
        name2.anchor(top: review2.bottomAnchor,
                         bottom: nil,
                         leading: mainTitle.leadingAnchor,
                         trailing: container.trailingAnchor,
                         height: nil,
                         width: nil,
                         padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: -50))
        
        buttonBackground.translatesAutoresizingMaskIntoConstraints = false
        buttonBackground.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        buttonBackground.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonBackground.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6).isActive = true
        buttonBackground.topAnchor.constraint(greaterThanOrEqualTo: name2.bottomAnchor, constant: 15).isActive = true
        if isAfterEHDPurchase {
            buttonBackground.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -30).isActive = true
        }
        
        buttonBackground.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 10)
        
        bundleBackground.translatesAutoresizingMaskIntoConstraints = false
        bundleBackground.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        bundleBackground.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bundleBackground.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6).isActive = true
        bundleBackground.topAnchor.constraint(greaterThanOrEqualTo: buttonBackground.bottomAnchor, constant: 8).isActive = true
        bundleBackground.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 10)
        
        
        buttonBackground.addSubview(buyButton)
        buyButton.anchor(top: buttonBackground.topAnchor,
                         bottom: buttonBackground.bottomAnchor,
                         leading: buttonBackground.leadingAnchor,
                         trailing: buttonBackground.trailingAnchor,
                         height: nil,
                         width: nil)
        
        buyButton.roundCorners(cornerRadius: 10)
        
        bundleBackground.addSubview(bundleButton)
        bundleButton.anchor(top: bundleBackground.topAnchor,
                          bottom: bundleBackground.bottomAnchor,
                          leading: bundleBackground.leadingAnchor,
                          trailing: bundleBackground.trailingAnchor,
                          height: nil,
                          width: nil)
        
        bundleButton.roundCorners(cornerRadius: 10)
        
        creatorButton.translatesAutoresizingMaskIntoConstraints = false
        creatorButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        creatorButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        creatorButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6).isActive = true
        creatorButton.topAnchor.constraint(greaterThanOrEqualTo: bundleBackground.bottomAnchor, constant: 8).isActive = true
        creatorButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -30).isActive = true
        
        closeButtonBackground.anchor(top: self.topAnchor,
                           bottom: nil,
                           leading: nil,
                           trailing: container.trailingAnchor,
                           height: 30,
                           width: 30,
                           padding: UIEdgeInsets(top: -15, left: 0, bottom: 0, right: -30))
        
        closeButtonBackground.addSubview(closeButton)
        closeButton.anchor(top: closeButtonBackground.topAnchor,
                           bottom: closeButtonBackground.bottomAnchor,
                           leading: closeButtonBackground.leadingAnchor,
                           trailing: closeButtonBackground.trailingAnchor,
                           height: nil,
                           width: nil)
        
        closeButtonBackground.setShadow(color: .black, opacity: 0.7, offset: CGSize(width: 2, height: 2), radius: 4, cornerRadius: 20)
    }
    
    func setText() {
        if courseType == .KYGCourse {
            mainTitle.text = NSLocalizedString("Kalifornya Glamour Course", comment: "")
            featuresHeader.text = NSLocalizedString("Features", comment: "")
            feature1.text = NSLocalizedString("• Master spoken English Conversation", comment: "")
            feature2.text = NSLocalizedString("• Learn Californian accent", comment: "")
            feature3.text = NSLocalizedString("• 80+ video & listening lessons", comment: "")
            reviewsHeader.text = NSLocalizedString("Reviews", comment: "")
            review1.text = NSLocalizedString("I have TOEIC900 score, but I feel this lesson is one of the best that I have ever taken", comment: "")
            review2.text = NSLocalizedString("I just finished the first week of your course but I already feel the difference when I hear people talk", comment: "")
            name1.text = "- Hiroshi"
            name2.text = "- Miyu"
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            mainTitleTop?.constant = 24
            featureHeaderTop?.constant = 20
            feature1Top?.constant = 20
            reviewsHeaderTop?.constant = 20
            review1Top?.constant = 28
            
            mainTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            featuresHeader.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            feature1.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            feature2.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            feature3.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            reviewsHeader.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            review1.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            review2.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            name1.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            name2.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            
            
        } else {
            mainTitleTop?.constant = 8
            featureHeaderTop?.constant = 8
            feature1Top?.constant = 4
            reviewsHeaderTop?.constant = 8
            review1Top?.constant = 10
            
            mainTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            featuresHeader.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            feature1.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            feature2.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            feature3.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            reviewsHeader.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            review1.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            review2.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            name1.font = UIFont.systemFont(ofSize: 9, weight: .regular)
            name2.font = UIFont.systemFont(ofSize: 9, weight: .regular)
            
        }
    }
    
    
    func reset() {
        isMinimized = false
        if #available(iOS 13.0, *) {
            self.closeButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        } else {
            self.closeButton.setImage(#imageLiteral(resourceName: "downChevron"), for: .normal)
        }
    }
    
    func getProductID() -> String {
        switch courseType {
        case .EHDMasterCourse:
            return K.productIdentifiers.ehdMasterCourse
        case .KYGCourse:
            if isAfterEHDPurchase {
                return K.productIdentifiers.kygCourse
            } else {
                return K.productIdentifiers.kygCourseNoDiscount
            }
        case .Secrets:
            return "not a product"
        }
    }
    
    func showCreatorCodePrompt() {
        
        var textField = UITextField()
        let alert = ValidatingAlertController(
            title: NSLocalizedString("Input Creator Code", comment: ""),
            message: NSLocalizedString("Supporting a creator? Enter their code here.", comment: ""),
            preferredStyle: .alert
        )
        
        let submit = UIAlertAction(title: NSLocalizedString("Submit", comment: ""), style: .default) { (action) in
            
            guard let text = textField.text else {
                return
            }
            
            self.creatorCode = text
            self.creatorButton.setTitle(NSLocalizedString("Supporting", comment: "") + " \(text)", for: .normal)
        }
        
        let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { (action) in
            return
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = NSLocalizedString("Creator Code", comment: "")
            alertTextField.addTarget(alert, action: #selector(alert.textDidChange), for: .editingChanged)
            textField = alertTextField
        }
        
        alert.addAction(submit)
        alert.addAction(cancel)
        alert.actions[0].isEnabled = false
        
        parentVC?.present(alert, animated: true, completion: nil)
    }
        
    @objc func minimize(_ sender: AnimatedButton) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
            if self.isMinimized {
                self.transform = .identity
                self.isMinimized = false
                if #available(iOS 13.0, *) {
                    self.closeButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                } else {
                    self.closeButton.setImage(#imageLiteral(resourceName: "downChevron"), for: .normal)
                }
            } else {
                self.transform = CGAffineTransform(translationX: 0, y: self.frame.height - 28)
                self.isMinimized = true
                if #available(iOS 13.0, *) {
                    self.closeButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                } else {
                    self.closeButton.setImage(#imageLiteral(resourceName: "upChevron"), for: .normal)
                }
            }
        } completion: { (_) in
            // Do nothing
        }
    }
    
    @objc func dismiss(_ sender: AnimatedButton) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.transform = CGAffineTransform(translationX: 0, y: self.frame.height + 50)
        } completion: { (_) in
            self.removeFromSuperview()
        }

    }
    
    @objc func minimizeFromSwipe(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
            if self.isMinimized && sender.direction == .up {
                self.transform = .identity
                self.isMinimized = false
                if #available(iOS 13.0, *) {
                    self.closeButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                } else {
                    self.closeButton.setImage(#imageLiteral(resourceName: "downChevron"), for: .normal)
                }
            } else if !self.isMinimized && sender.direction == .down {
                self.transform = CGAffineTransform(translationX: 0, y: self.frame.height - 28)
                self.isMinimized = true
                if #available(iOS 13.0, *) {
                    self.closeButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                } else {
                    self.closeButton.setImage(#imageLiteral(resourceName: "upChevron"), for: .normal)
                }
            }
        } completion: { (_) in
            // Do nothing
        }
    }
    
    @objc func dismissFromSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .down {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn) {
                self.transform = CGAffineTransform(translationX: 0, y: self.frame.height + 50)
            } completion: { (_) in
                self.removeFromSuperview()
            }
        }
    }
    
    @objc func bundlePressed(_ sender: AnimatedButton) {
        AnalyticsManager.shared.logBundlePressed()
        
        UIView.animate(withDuration: 0.3) {
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
        } completion: { (_) in
            
            if self.isVideoPopUp {
                self.videoVC?.player?.pause()
                
                if Utilities.shared.isUserSignedIn {
                    if Utilities.shared.user?.purchases[CourseType.EHDMasterCourse.rawValue] == true || Utilities.shared.user?.purchases[CourseType.KYGCourse.rawValue] == true {
                        let alert = UIAlertController(title: NSLocalizedString("You already have purchased one of these courses", comment: ""), message: nil, preferredStyle: .alert)
                        let action = UIAlertAction(title: NSLocalizedString("Ok", comment: "ok, I acknowledge the action (for example successfully signing out) that just happened. When I press ok, the alert will go away and I can continue doing what I am doing in the app"), style: .cancel) { (action) in
                            self.closeButton.sendActions(for: .touchUpInside)
                        }
                        alert.addAction(action)
                        self.videoVC?.present(alert, animated: true, completion: nil)
                    } else {
                        // Handle Purchase
                        let productID = K.productIdentifiers.EHD_KYG_Bundle
                        PurchasingManager.shared.creatorCode = self.creatorCode
                        PurchasingManager.shared.fetchProducts(productIdentifier: productID, parentVC: self.videoVC)
                        self.videoVC?.startLoadingScreen()
                    }
                } else {
                    // Sign In Then Handle Purchase
                    self.videoVC?.goToLogin(self)
                }
            } else {
                if Utilities.shared.isUserSignedIn {
                    if Utilities.shared.user?.purchases[CourseType.EHDMasterCourse.rawValue] == true || Utilities.shared.user?.purchases[CourseType.KYGCourse.rawValue] == true {
                        let alert = UIAlertController(title: NSLocalizedString("You already have purchased one of these courses", comment: ""), message: nil, preferredStyle: .alert)
                        let action = UIAlertAction(title: NSLocalizedString("Ok", comment: "ok, I acknowledge the action (for example successfully signing out) that just happened. When I press ok, the alert will go away and I can continue doing what I am doing in the app"), style: .cancel) { (action) in
                            self.closeButton.sendActions(for: .touchUpInside)
                        }
                        alert.addAction(action)
                        self.parentVC?.present(alert, animated: true, completion: nil)
                    } else {
                        // Handle Purchase
                        let productID = K.productIdentifiers.EHD_KYG_Bundle
                        PurchasingManager.shared.creatorCode = self.creatorCode
                        PurchasingManager.shared.fetchProducts(productIdentifier: productID, parentVC: self.parentVC)
                        self.parentVC?.startLoadingScreen()
                    }
                } else {
                    // Sign In Then Handle Purchase
                    self.parentVC?.goToLoginForPurchase(self)
                }
            }

        }
    }
    
    @objc func buyPressed(_ sender: AnimatedButton) {
        
        AnalyticsManager.shared.logBuyButtonPressed()
        
        UIView.animate(withDuration: 0.3) {
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
        } completion: { (_) in
            
            if self.isVideoPopUp {
                self.videoVC?.player?.pause()
                
                if Utilities.shared.isUserSignedIn {
                    if Utilities.shared.user?.purchases[self.courseType.rawValue] == true {
                        let alert = UIAlertController(title: NSLocalizedString("You already have purchased this course", comment: ""), message: nil, preferredStyle: .alert)
                        let action = UIAlertAction(title: NSLocalizedString("Ok", comment: "ok, I acknowledge the action (for example successfully signing out) that just happened. When I press ok, the alert will go away and I can continue doing what I am doing in the app"), style: .cancel) { (action) in
                            self.closeButton.sendActions(for: .touchUpInside)
                        }
                        alert.addAction(action)
                        self.videoVC?.present(alert, animated: true, completion: nil)
                    } else {
                        // Handle Purchase
                        let productID = self.getProductID()
                        PurchasingManager.shared.creatorCode = self.creatorCode
                        PurchasingManager.shared.fetchProducts(productIdentifier: productID, parentVC: self.videoVC)
                        self.videoVC?.startLoadingScreen()
                    }
                } else {
                    // Sign In Then Handle Purchase
                    self.videoVC?.goToLogin(self)
                }
            } else {
                if Utilities.shared.isUserSignedIn {
                    if Utilities.shared.user?.purchases[self.courseType.rawValue] == true {
                        let alert = UIAlertController(title: NSLocalizedString("You already have purchased this course", comment: ""), message: nil, preferredStyle: .alert)
                        let action = UIAlertAction(title: NSLocalizedString("Ok", comment: "ok, I acknowledge the action (for example successfully signing out) that just happened. When I press ok, the alert will go away and I can continue doing what I am doing in the app"), style: .cancel) { (action) in
                            self.closeButton.sendActions(for: .touchUpInside)
                        }
                        alert.addAction(action)
                        self.parentVC?.present(alert, animated: true, completion: nil)
                    } else {
                        // Handle Purchase
                        let productID = self.getProductID()
                        PurchasingManager.shared.creatorCode = self.creatorCode
                        PurchasingManager.shared.fetchProducts(productIdentifier: productID, parentVC: self.parentVC)
                        self.parentVC?.startLoadingScreen()
                    }
                } else {
                    // Sign In Then Handle Purchase
                    self.parentVC?.goToLoginForPurchase(self)
                }
            }

        }
    }
    
    @objc func creatorButtonPressed(_ sender: AnimatedButton) {
        UIView.animate(withDuration: 0.3) {
            sender.superview?.transform = .identity
            sender.superview?.layer.shadowOpacity = 0.3
        } completion: { (_) in
            self.showCreatorCodePrompt()
        }
    }
}
