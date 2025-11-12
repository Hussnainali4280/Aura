//
//  PopUpManager.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/19/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

// MARK: - Base Class
class PopUpManager: NSObject {
    
    var blackView: UIView = {
        
        let v = UIView()
        v.backgroundColor = UIColor(white: 0 , alpha: 0.5)
        return v
        
    }()
    
    override init() {
        super.init()
    }
    
    func showPopUpFromBottom() {}
        
    fileprivate func showPopUpFromBottom(v: UIView) {
        
        if let window = UIApplication.shared.keyWindow {
            
            window.addSubview(blackView)
            window.addSubview(v)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            v.translatesAutoresizingMaskIntoConstraints = false
            v.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
            v.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            
            v.transform = CGAffineTransform(translationX: 0, y: window.frame.height)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                v.transform = .identity
            }, completion: nil)
        }
    }
    
    func showPopUpFadingIn() {}
    
    fileprivate func showPopUpFadingIn(v: UIView) {
        
        if let window = UIApplication.shared.keyWindow {
            
            window.addSubview(blackView)
            window.addSubview(v)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            v.alpha = 0
            
            v.translatesAutoresizingMaskIntoConstraints = false
            v.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
            v.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            
            UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                v.alpha = 1
            }, completion: nil)
        }
    }
}

protocol TestManagerDelegate {
    func finishTest(willRestart: Bool)
}

// MARK: - Test Result Pop Up Class
class TestResultPopUpManager: PopUpManager, TestResultPopUpDelegate {
    
    var popUpView = TestResultPopUpView()
    var delegate: TestManagerDelegate?
    
    convenience init(popUpView: TestResultPopUpView) {
        self.init()
        self.popUpView = popUpView
        self.popUpView.delegate = self
    }
    
    override func showPopUpFromBottom() {
        showPopUpFromBottom(v: popUpView)
    }
    
    func dismiss(completion: @escaping() -> Void) {
        UIView.animate(withDuration: 0.3, animations: {
            self.blackView.alpha = 0
            self.popUpView.transform = CGAffineTransform.init(translationX: 0, y: UIScreen.main.bounds.height)
        }) { (_) in
            self.blackView.removeFromSuperview()
            self.popUpView.removeFromSuperview()
            completion()
        }
    }
    
    func done() {
        dismiss { self.delegate?.finishTest(willRestart: false) }
    }
    
    func restart() {
        dismiss { self.delegate?.finishTest(willRestart: true) }
    }
    
}

// MARK: - Study Result Pop Up Class
class StudyResultPopUpManager: PopUpManager, TestResultPopUpDelegate {
    
    var popUpView = StudyResultPopUpView()
    var delegate: TestManagerDelegate?
    
    convenience init(popUpView: StudyResultPopUpView) {
        self.init()
        self.popUpView = popUpView
        self.popUpView.delegate = self
    }
    
    override func showPopUpFromBottom() {
        showPopUpFromBottom(v: popUpView)
    }
    
    func dismiss(completion: @escaping() -> Void) {
        UIView.animate(withDuration: 0.3, animations: {
            self.blackView.alpha = 0
            self.popUpView.transform = CGAffineTransform.init(translationX: 0, y: UIScreen.main.bounds.height)
        }) { (_) in
            self.blackView.removeFromSuperview()
            self.popUpView.removeFromSuperview()
            completion()
        }
    }
    
    func done() {
        dismiss { self.delegate?.finishTest(willRestart: false) }
    }
    
    func restart() {
        dismiss { self.delegate?.finishTest(willRestart: true) }
    }
    
}

// MARK: - Swipe Tutorial Pop Up Class
class SwipeTutorialPopUpManager: PopUpManager, SwipeTutorialDelegate {
    
    lazy var popUpView: SwipeTutorialView = {
        let v = SwipeTutorialView()
        v.delegate = self
        return v
    }()
    
    override func showPopUpFadingIn() {
        showPopUpFadingIn(v: popUpView)
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.3, animations: {
            self.blackView.alpha = 0
            self.popUpView.alpha = 0
        }) { (_) in
            self.blackView.removeFromSuperview()
            self.popUpView.removeFromSuperview()
        }
    }
}

// MARK: - Seminar Pop Up Class
class SeminarPopUpManager: PopUpManager, SeminarPopUpDelegate {
    
    lazy var popUpView: SeminarPopUpView = {
        let v = SeminarPopUpView()
        v.delegate = self
        return v
    }()
    
    override func showPopUpFadingIn() {
        showPopUpFadingIn(v: popUpView)
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.3, animations: {
            self.blackView.alpha = 0
            self.popUpView.alpha = 0
        }) { (_) in
            self.blackView.removeFromSuperview()
            self.popUpView.removeFromSuperview()
        }
    }
}

// MARK: - Video Pop Up Manager
class VideoPopUpManager: PopUpManager, SecretsTutorialDelegate {
    
    var popUpView = SecretsPopUpView()
    var parentView: UIViewController?
    var isForKYGCourse = false
    var isAfterEHDPurchase = false
    
    convenience init(title: String, info: String, thumbnailURL: String, buttonText: String) {
        self.init()
        popUpView = SecretsPopUpView(
            frame: .zero,
            titleText: title,
            infoText: info,
            thumbnailURL: thumbnailURL,
            buttonText: buttonText
        )
        popUpView.delegate = self
    }
    
    override func showPopUpFadingIn() {
        showPopUpFadingIn(v: popUpView)
        print("\nPopping Up\n")
    }
    
    func dismiss(didSkip: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            self.blackView.alpha = 0
            self.popUpView.alpha = 0
        }) { (_) in
            self.blackView.removeFromSuperview()
            self.popUpView.removeFromSuperview()
            
            guard let funnelProgress = AdManager.shared.funnelProgress else { return }
            
            if didSkip  {
                if let _ = self.parentView as? HomeController {
                    if funnelProgress == .hasNotSeenVideo1 || funnelProgress == .seenPartOfVideo1 {
                        let vc = TutorialController()
                        vc.modalPresentationStyle = .fullScreen
                        self.parentView?.present(vc, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    func getURLForPopUP() -> String {
        if isForKYGCourse {
            if isAfterEHDPurchase {
                return "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/0_kyg_sales_after_purchase.mp4?alt=media&token=68a62274-6c75-44a9-b313-3a25a8662acf"
            } else {
                return "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/0_kyg_sales.mp4?alt=media&token=29b8227c-3708-4324-a97a-d745ca9bc598"
            }
        } else {
            return AdManager.shared.getVideoURLForCurrentUserState()
        }
    }
    
    func getVideoPosition() -> VideoPosition {
        if isForKYGCourse {
            return VideoPosition(baseID: K.FBConstants.baseCourseIDs[2], section: 0, row: 0)
        } else {
            return AdManager.shared.getPositionForCurrentUserState()
        }
    }
    
    func getObserverType() -> ObserverType {
        if isForKYGCourse {
            if isAfterEHDPurchase {
                return .kygSalesAfterPurchaseObserver
            } else {
                return .kygSalesObserver
            }
        } else {
            return .secretsObserver
        }
    }
    
    func playVideo() {
        
        dismiss(didSkip: false)
        
        guard let videoGroups = Utilities.shared.lessons else {
            return
        }
        
        let urlString = getURLForPopUP()
        let position = getVideoPosition()
        let observer = getObserverType()
        
        guard let lesson = videoGroups.first(where: {$0.baseID == position.baseID}) else {
            return
        }
    
        VideoManager.shared.playVideo(
            lesson: lesson,
            position: position,
            urlString: urlString,
            observerType: observer,
            presenter: self.parentView!
        )
    }
}

// MARK: - Pop Up AV Player View Controller
class PUAVPlayerViewController: AVPlayerViewController {
    
    override func viewDidDisappear(_ animated: Bool) {
        handleVideoCloseForCurrentState()
        player?.pause()
        if let currentTime = player?.currentTime().seconds {
            AdManager.shared.introVideoTimeLeftAt = currentTime - 5 >= 0  ? currentTime - 5 : 0
        }
        player?.removeTimeObserver(timeObserver!)
        AdManager.shared.removeBuyButton()
    }
    
    var parentView: UIViewController?
    var timeObserver: Any?
    
    func handleVideoCloseForCurrentState() {
        
        guard let funnelProgress = AdManager.shared.funnelProgress else { return }
    
        if let _ = parentView as? HomeController {
            if funnelProgress == .hasNotSeenVideo1 || funnelProgress == .seenPartOfVideo1 {
                let vc = TutorialController()
                vc.modalPresentationStyle = .fullScreen
                self.parentView?.present(vc, animated: true, completion: nil)
                return
            } else { return }
        }
    
        if let _ = parentView as? ResultsController {
            if funnelProgress == .completedVideo1Bought {
                parentView?.tabBarController?.selectedIndex = 4
            } else { return }
        }
        
        if let _ = parentView as? FlashCardController {
            if funnelProgress == .completedVideo1Bought {
                parentView?.tabBarController?.selectedIndex = 4
            } else { return }
        }
        
        if let _ = parentView as? DeckSelectingController {
            if funnelProgress == .completedVideo1Bought {
                parentView?.tabBarController?.selectedIndex = 4
            } else { return }
        }
        
        if let _ = parentView as? LessonsController {
            if funnelProgress == .completedVideo1Bought {
                parentView?.tabBarController?.selectedIndex = 4
            } else { return }
        }
    }
    
    func goToLogin(_ delegate: BuyButtonPopUpView) {
        
        let vc = Utilities.shared.getLoginVC()
        let login = vc.viewControllers[0] as! LoginController
        login.isModal = true
        login.isForPurchase = true
        login.buyDelegate = delegate
        self.present(vc, animated: true, completion: nil)
        
    }

}
