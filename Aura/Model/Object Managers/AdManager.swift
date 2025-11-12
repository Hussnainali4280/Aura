//
//  AdManager.swift
//  Aura
//
//  Created by Maxwell Dolensky on 2/3/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import UIKit

enum FunnelProgress: String {
    case hasNotSeenVideo1 = "hasNotSeenVideo1"
    case seenPartOfVideo1 = "seenPartOfVideo1"
    case completedVideo1NoBuy = "completedVideo1NoBuy"
    case completedVideo1Bought = "completedVideo1Bought"
}

protocol AdManagerDelegate {
    func updateSecretsThumbnail()
}

class AdManager: NSObject {
    
    static var shared = AdManager()
    
    var homeDelegate: AdManagerDelegate?
    var searchDelegate: AdManagerDelegate?
    var resultDelegate: AdManagerDelegate?
    var learnMoreDelegates = [FirebaseUpdaterDelegate]()
    var lessonDelegate: FirebaseUpdaterDelegate?
    
    var funnelProgress: FunnelProgress? {
        
        get {
            
            guard let progressString = UserDefaults.standard.object(forKey: "funnelProgress") as? String else {
                return nil
            }
            
            guard let funnelProgress = FunnelProgress(rawValue: progressString) else {
                return nil
            }
            
            return funnelProgress
        }
        
        set(newValue) {
            UserDefaults.standard.setValue(newValue?.rawValue, forKey: "funnelProgress")
            homeDelegate?.updateSecretsThumbnail()
            searchDelegate?.updateSecretsThumbnail()
            resultDelegate?.updateSecretsThumbnail()
            for delegate in learnMoreDelegates {
                delegate.updateSecretsThumbnail()
            }
            lessonDelegate?.updateLessonsDisplay()
            
        }
    }
    
    var currentVideoPosition: VideoPosition {
        get {
            
            guard let positionData = UserDefaults.standard.data(forKey: "currentVideoPosition") else {
                return VideoPosition(baseID: K.FBConstants.baseCourseIDs[0], section: 0, row: 0)
            }
            return VideoPosition(data: positionData)
            
        }
        
        set(newValue) {
    
            if let data = newValue.encode() {
                UserDefaults.standard.set(data, forKey: "currentVideoPosition")
                homeDelegate?.updateSecretsThumbnail()
                searchDelegate?.updateSecretsThumbnail()
                resultDelegate?.updateSecretsThumbnail()
                for delegate in learnMoreDelegates {
                    delegate.updateSecretsThumbnail()
                }
            }
        }
    }
    
    var introVideoTimeLeftAt: Double {
        get {
            return UserDefaults.standard.double(forKey: "introVideoTimeLeftAt")
        }
        
        set(newValue) {
            UserDefaults.standard.setValue(newValue, forKey: "introVideoTimeLeftAt")
        }
    }
    
    let videoBuyPopUp = BuyButtonPopUpView(frame: .zero, isVideoPopUp: true)
    let vcBuyPopUp = BuyButtonPopUpView(frame: .zero, isVideoPopUp: false)
    let videoKYGBuyPopUp = BuyButtonPopUpView(frame: .zero, isVideoPopUp: true, courseType: .KYGCourse)
    let vcKYGBuyPopUp = BuyButtonPopUpView(frame: .zero, isVideoPopUp: false, courseType: .KYGCourse)
    let videoKYGBuyPopUpAfterPurchase = BuyButtonPopUpView(frame: .zero, isVideoPopUp: true, courseType: .KYGCourse, isAfterEHDPurchase: true)
    
    var isBuyButtonShowing = false
    
    func getFunnelThumbnailURLForCurrentUserState() -> String {
        
        guard let lessons = Utilities.shared.lessons else {
            return ""
        }
        
        guard let intro = lessons.first(where: {$0.baseID == K.FBConstants.baseCourseIDs[0]}) else {
            return ""
        }
        
        let position = currentVideoPosition
        
        switch funnelProgress {
        case .none, .hasNotSeenVideo1, .seenPartOfVideo1:
            return intro.sections[0].videos[0].thumbnailURL
        case .completedVideo1NoBuy, .completedVideo1Bought:
            AnalyticsManager.shared.logStartedVideo(position: position)
            guard let currCourse = lessons.first(where: {$0.baseID == position.baseID}) else {
                return ""
            }
            return currCourse.sections[position.section].videos[position.row].thumbnailURL
        }
    }
    
    func shouldVideoBeLocked() -> Bool {
        
        guard let funnelProgress = funnelProgress else {
            return false
        }
        
        if funnelProgress != .completedVideo1Bought
            && currentVideoPosition.baseID == K.FBConstants.baseCourseIDs[1]
            &&  currentVideoPosition.section > 2 {
            return true
        } else {
            return false
        }
        
    }
    
    func lessonPageToScrollTo() -> Int {
        switch funnelProgress {
        case .hasNotSeenVideo1, .seenPartOfVideo1:
            return 1
        case .completedVideo1NoBuy, .completedVideo1Bought:
            return 0
        default:
            return 0
        }
    }
    
    func getFunnelLabelTitleForCurrentUserState() -> String {
        
        if currentVideoPosition.baseID == K.FBConstants.baseCourseIDs[0] || currentVideoPosition.baseID == K.FBConstants.baseCourseIDs[1] {
            switch funnelProgress {
            case .hasNotSeenVideo1:
                return NSLocalizedString("Where to Start", comment: "Start of using this app by watching this video")
            case .seenPartOfVideo1:
                return NSLocalizedString("Continue Watching", comment: "Finish watching this video that you already started")
            case .completedVideo1NoBuy where currentVideoPosition.baseID == K.FBConstants.baseCourseIDs[1] && currentVideoPosition.section <= 2:
                return NSLocalizedString("Sample the English HD Master Course", comment: "Try out watching a video from the course for free")
            case .completedVideo1NoBuy:
                return NSLocalizedString("Get the English HD Master Course Now!", comment: "Purchase the course now")
            case .completedVideo1Bought:
                return NSLocalizedString("Continue Learning", comment: "Continue watching videos where you left off in the course to keep learning")
            default:
                return NSLocalizedString("Where to Start", comment: "Start of using this app by watching this video")
            }
        } else {
            if currentVideoPosition.section == 0 && currentVideoPosition.row == 0 {
                return NSLocalizedString("New Conversational Course!", comment: "")
            } else {
                return NSLocalizedString("New Conversational Course!", comment: "")
            }
        }
    }
    
    func getVideoURLForCurrentUserState() -> String {
        guard let lessons = Utilities.shared.lessons else {
            return ""
        }
        
        guard let intro = lessons.first(where: {$0.baseID == K.FBConstants.baseCourseIDs[0]}) else {
            return ""
        }
        
        let position = currentVideoPosition
        
        switch funnelProgress {
        case .none, .hasNotSeenVideo1, .seenPartOfVideo1:
            return intro.sections[0].videos[0].videoURL
        case .completedVideo1NoBuy, .completedVideo1Bought:
            AnalyticsManager.shared.logStartedVideo(position: position)
            guard let currCourse = lessons.first(where: {$0.baseID == position.baseID}) else {
                return ""
            }
            return currCourse.sections[position.section].videos[position.row].videoURL
        }
    }
    
    func getPositionForCurrentUserState() -> VideoPosition {
        switch funnelProgress {
        case .none, .hasNotSeenVideo1, .seenPartOfVideo1:
            return VideoPosition(baseID: RCManager.shared.value(forKey: K.RCConstants.introBaseID), section: 0, row: 0)
        case .completedVideo1NoBuy, .completedVideo1Bought:
            return currentVideoPosition
        }
    }
    
    func getSecretsVideoPopUpManagerForCurrentFunnelState() -> VideoPopUpManager {
        switch funnelProgress {
        case .hasNotSeenVideo1:
            return VideoPopUpManager(title: NSLocalizedString("Welcome to Aura!", comment: ""),
                                            info: NSLocalizedString("Get started with this tutorial video. Learn how to use this app and discover the 3 Secrets of English HD", comment: ""),
                                            thumbnailURL: getFunnelThumbnailURLForCurrentUserState(),
                                            buttonText: NSLocalizedString("Watch Tutorial", comment: "Click this button to watch the tutorial video"))
        case .seenPartOfVideo1:
            return VideoPopUpManager(title: NSLocalizedString("Finish the tutorial!", comment: "Finish watching the tutorial video"),
                                            info: NSLocalizedString("We recommend finishing this video to help you better understand the features in this app and how to use them", comment: ""),
                                            thumbnailURL: getFunnelThumbnailURLForCurrentUserState(),
                                            buttonText: NSLocalizedString("Finish Tutorial", comment: "Click this button to finish watching the tutorial video"))
        default:
            return VideoPopUpManager(title: NSLocalizedString("Welcome to Aura!", comment: ""),
                                            info: NSLocalizedString("Get started with this tutorial video. Learn how to use this app and discover the 3 Secrets of English HD", comment: ""),
                                            thumbnailURL: getFunnelThumbnailURLForCurrentUserState(),
                                            buttonText: NSLocalizedString("Watch Tutorial", comment: "Click this button to watch the tutorial video"))
        }
    }
    
    func showAdPopUP(parentVC: UIViewController) {
        
        guard let funnelProgress = funnelProgress else { return }
        if funnelProgress == .completedVideo1Bought || funnelProgress == .completedVideo1NoBuy {
            return
        }
        
        let popUpManager = AdManager.shared.getSecretsVideoPopUpManagerForCurrentFunnelState()
        popUpManager.parentView = parentVC
        popUpManager.showPopUpFadingIn()
    }
    
    func showKYGCoursePopUP(parentVC: UIViewController, didJustPurchaseEHDCourse: Bool) {
        if didJustPurchaseEHDCourse {
            let popUpManager = VideoPopUpManager(title: NSLocalizedString("Thanks for your purchase!", comment: ""),
                                                        info: NSLocalizedString("Thanks for purchasing our pronunciation course. Do you want to learn american conversation as well. Watch this video to the end for a special offer.", comment: ""),
                                                        thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/0_kyg_sales_thumbnail.png?alt=media&token=402475ed-23ae-413c-a205-00e290daa6cf",
                                                        buttonText: NSLocalizedString("Watch Now!", comment: ""))
            popUpManager.isAfterEHDPurchase = true
            popUpManager.isForKYGCourse = true
            popUpManager.parentView = parentVC
            popUpManager.showPopUpFadingIn()
        } else {
            let popUpManager = VideoPopUpManager(title: NSLocalizedString("Mastered American pronunciation?", comment: ""),
                                                        info: NSLocalizedString("Already mastered American pronunciation? How about American Conversation? Watch this video to see if Japanese college student can understand this easy question.", comment: ""),
                                                        thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/0_kyg_sales_thumbnail.png?alt=media&token=402475ed-23ae-413c-a205-00e290daa6cf",
                                                        buttonText: NSLocalizedString("Watch Now!", comment: ""))
            popUpManager.isForKYGCourse = true
            popUpManager.parentView = parentVC
            popUpManager.showPopUpFadingIn()
        }
    }
    
    func updateSearchCount() {
    
        guard let searchCount = UserDefaults.standard.object(forKey: "searchCount") else {
            UserDefaults.standard.setValue(1, forKey: "searchCount")
            return
        }
        
        guard let count = searchCount as? Int else { return }
        
        if count > 15 {
            UserDefaults.standard.setValue(0, forKey: "searchCount")
        } else {
            UserDefaults.standard.setValue(count + 1, forKey: "searchCount")
        }
    }
    
    let popUpManager = SeminarPopUpManager()
    
    func showPopUpAfterSearch(parentVC: UIViewController) {
        guard let searchCount = UserDefaults.standard.object(forKey: "searchCount") else {
            return
        }
        
        guard let count = searchCount as? Int else { return }
        
        if count == 15 &&  Utilities.shared.user!.purchases.count == 0 {
           
            UserDefaults.standard.setValue(0, forKey: "searchCount")
            popUpManager.showPopUpFadingIn()
        } 
    }
    
    func getBuyPopUp(inVideo: Bool, isForKYGCouse: Bool, isAfterEHDPurchase: Bool) -> BuyButtonPopUpView {
        if inVideo && !isForKYGCouse {
            return videoBuyPopUp
        } else if !inVideo && !isForKYGCouse {
            return vcBuyPopUp
        } else if inVideo && isForKYGCouse {
            if isAfterEHDPurchase {
                return videoKYGBuyPopUpAfterPurchase
            } else {
                return videoKYGBuyPopUp
            }
        } else {
            return vcKYGBuyPopUp
        }
    }
    
    func showBuyButton(inVideo: Bool = true, isForKYGCourse: Bool = false, isAfterEHDPurchase: Bool = false, videoVC: PUAVPlayerViewController?, parentVC: UIViewController?) {
        
        AnalyticsManager.shared.logBuyButtonSeen()
        
        let buyPopUp = getBuyPopUp(inVideo: inVideo, isForKYGCouse: isForKYGCourse, isAfterEHDPurchase: isAfterEHDPurchase)
        
        if buyPopUp.courseType == .KYGCourse {
            if Utilities.shared.user == nil
                || Utilities.shared.user!.purchases[K.productNames.ehdMasterCourse] == nil
                || Utilities.shared.user!.purchases[K.productNames.ehdMasterCourse] == false {
                buyPopUp.bundleBackground.isHidden = false
                buyPopUp.bundleButton.isHidden = false
            } else {
                buyPopUp.bundleBackground.isHidden = true
                buyPopUp.bundleButton.isHidden = true
            }
        } else {
            buyPopUp.bundleBackground.isHidden = true
            buyPopUp.bundleButton.isHidden = true
        }
        
        buyPopUp.videoVC = videoVC
        buyPopUp.parentVC = parentVC
        if let window = UIApplication.shared.keyWindow {
            
            window.addSubview(buyPopUp)
            buyPopUp.translatesAutoresizingMaskIntoConstraints = false
            buyPopUp.anchor(top: nil,
                            bottom: window.bottomAnchor,
                            leading: window.safeAreaLayoutGuide.leadingAnchor,
                            trailing: window.safeAreaLayoutGuide.trailingAnchor,
                            height: nil,
                            width: nil,
                            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            
            if inVideo {
                buyPopUp.reset()
            }
            
            buyPopUp.transform = CGAffineTransform(translationX: 0, y: 150)
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                buyPopUp.transform = .identity
            }, completion: nil)
        }
    }
    
    func removeBuyButton() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
            if self.videoBuyPopUp.superview != nil  {
                self.videoBuyPopUp.transform = CGAffineTransform(translationX: 0, y: 300)
            } else if self.videoKYGBuyPopUp.superview != nil {
                self.videoKYGBuyPopUp.transform = CGAffineTransform(translationX: 0, y: 300)
            } else if self.vcKYGBuyPopUp.superview != nil {
                self.vcKYGBuyPopUp.transform = CGAffineTransform(translationX: 0, y: 300)
            } else {
                self.vcBuyPopUp.transform = CGAffineTransform(translationX: 0, y: 300)
            }
        } completion: { (_) in
            if self.videoBuyPopUp.superview != nil {
                self.videoBuyPopUp.removeFromSuperview()
                self.isBuyButtonShowing = false
            } else if self.videoKYGBuyPopUp.superview != nil {
                self.videoKYGBuyPopUp.removeFromSuperview()
                self.isBuyButtonShowing = false
            } else if self.vcKYGBuyPopUp.superview != nil {
                self.vcKYGBuyPopUp.removeFromSuperview()
            } else {
                self.vcBuyPopUp.removeFromSuperview()
            }
        }
    }
}
