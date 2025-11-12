//
//  VideoManager.swift
//  Aura
//
//  Created by Maxwell Dolensky on 6/11/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

enum ObserverType {
    case secretsObserver
    case ehdObserver
    case kygSalesAfterPurchaseObserver
    case kygSalesObserver
    case kygObserver
}

class VideoManager {
    
    static let shared = VideoManager()
        
    var parentView: UIViewController!
    let av = PUAVPlayerViewController()
    private var lesson: VideoGroup!
    private var position: VideoPosition!
    
    private func setParameters(lesson: VideoGroup, position: VideoPosition) {
        self.lesson = lesson
        self.position = position
    }
    
    func getTimeObserver(courseType: CourseType) -> ObserverType {
        switch courseType {
        case .EHDMasterCourse:
            return .ehdObserver
        case .KYGCourse:
            return .kygObserver
        case .Secrets:
            return .secretsObserver
        }
    }
    
    func getTimeObserver(_ observer: ObserverType, isAfterEHDPurchase: Bool = false) -> (CMTime) -> Void {
        switch observer {
        case .secretsObserver:
            return handleSecretsTimeObserver(_:)
        case .ehdObserver:
            return handleEHDTimeObserver(_:)
        case .kygSalesAfterPurchaseObserver:
            return handleKYGSalesTimeObserverAfterPurchase(_:)
        case .kygSalesObserver:
            return handleKYGSalesTimeObserver(_:)
        case .kygObserver:
            return handleKYGTimeObserver(_:)
        }
    }
    
    func handleSecretsTimeObserver(_ progressTime: CMTime) {
        let seconds = CMTimeGetSeconds(progressTime)
    
        switch AdManager.shared.funnelProgress {
        
        case .hasNotSeenVideo1:
            AdManager.shared.funnelProgress = .seenPartOfVideo1
            AnalyticsManager.shared.logFunnelChange(funnelProgress: .seenPartOfVideo1)
        
        case .seenPartOfVideo1:
            if Int(seconds) >= (K.FunnelConstants.minuteToShowBuyBtn * 60 + K.FunnelConstants.secondToShowBuyBtn) {
                AdManager.shared.funnelProgress = .completedVideo1NoBuy
                AnalyticsManager.shared.logFunnelChange(funnelProgress: .completedVideo1NoBuy)
                AdManager.shared.showBuyButton(videoVC: av, parentVC: nil)
                AdManager.shared.isBuyButtonShowing = true
                AdManager.shared.currentVideoPosition = VideoPosition(baseID: K.FBConstants.baseCourseIDs[1], section: 0, row: 0)
            }
        
        case .completedVideo1NoBuy:
            if Int(seconds) >= K.FunnelConstants.secondToShowBuyIfIntroSeen && AdManager.shared.isBuyButtonShowing == false {
                AdManager.shared.showBuyButton(videoVC: av, parentVC: nil)
                AdManager.shared.isBuyButtonShowing = true
            }
            self.updateNextVideoIfNecessary(av, progressTime: seconds, currPosition: position, videoGroup: lesson)
        
        default:
            self.updateNextVideoIfNecessary(av, progressTime: seconds, currPosition: position, videoGroup: lesson)
        }
    }
    
    fileprivate func handleEHDTimeObserver(_ progressTime: CMTime) {
        let seconds = CMTimeGetSeconds(progressTime)
        
        switch AdManager.shared.funnelProgress {
        
        case .completedVideo1NoBuy:
            if Int(seconds) >= K.FunnelConstants.secondToShowBuyIfIntroSeen && AdManager.shared.isBuyButtonShowing == false {
                AdManager.shared.showBuyButton(videoVC: av, parentVC: nil)
                AdManager.shared.isBuyButtonShowing = true
            }
            self.updateNextVideoIfNecessary(av, progressTime: seconds, currPosition: position, videoGroup: lesson)
        
        default:
            self.updateNextVideoIfNecessary(av, progressTime: seconds, currPosition: position, videoGroup: lesson)
        }
    }
    
    fileprivate func handleKYGSalesTimeObserverAfterPurchase(_ progressTime: CMTime) {
        let seconds = CMTimeGetSeconds(progressTime)
        
        if Int(seconds) >= K.FunnelConstants.minToShowKYGBuyBtnAfterPurchase * 60 + K.FunnelConstants.secToShowKYGBuyBtnAfterPurchase
            && AdManager.shared.isBuyButtonShowing == false
        {
            AdManager.shared.showBuyButton(isForKYGCourse: true, isAfterEHDPurchase: true, videoVC: av, parentVC: nil)
            AdManager.shared.isBuyButtonShowing = true
        }
        
        self.updateNextVideoIfNecessary(av, progressTime: seconds, currPosition: position, videoGroup: lesson)
    }
    
    fileprivate func handleKYGSalesTimeObserver(_ progressTime: CMTime) {
        let seconds = CMTimeGetSeconds(progressTime)
        
        if Int(seconds) >= K.FunnelConstants.minToShowKYGBuyBtn * 60 + K.FunnelConstants.secToShowKYGBuyBtn
            && AdManager.shared.isBuyButtonShowing == false
        {
            AdManager.shared.showBuyButton(isForKYGCourse: true, videoVC: av, parentVC: nil)
            AdManager.shared.isBuyButtonShowing = true
        }
        
        self.updateNextVideoIfNecessary(av, progressTime: seconds, currPosition: position, videoGroup: lesson)
    }
    
    fileprivate func handleKYGTimeObserver(_ progressTime: CMTime) {
        let seconds = CMTimeGetSeconds(progressTime)
        
        if let duration = av.player?.currentItem?.duration {
            let durationSecs = CMTimeGetSeconds(duration)
            if durationSecs - seconds <= Double(K.FunnelConstants.secondToShowBuyIfIntroSeen) && AdManager.shared.isBuyButtonShowing == false {
                if Utilities.shared.user == nil || Utilities.shared.user!.purchases[K.productNames.kygCourse] == nil {
                    AdManager.shared.showBuyButton(isForKYGCourse: true, videoVC: av, parentVC: nil)
                    AdManager.shared.isBuyButtonShowing = true
                }
            }
        }
        
        self.updateNextVideoIfNecessary(av, progressTime: seconds, currPosition: position, videoGroup: lesson)
    }
    
    func playVideo(lesson: VideoGroup, position: VideoPosition, urlString: String, observerType: ObserverType, presenter: UIViewController) {
        parentView = presenter
        setParameters(lesson: lesson, position: position)
        av.parentView = parentView
                    
        AdManager.shared.currentVideoPosition = position
        AnalyticsManager.shared.logStartedVideo(position: position)
       
        if let url = URL(string: urlString) {
            
            let player = AVPlayer(url: url)
            av.player = player
            av.player?.automaticallyWaitsToMinimizeStalling = true
            
            // Add Observer
            let interval = CMTime(value: 1, timescale: 2)
            av.timeObserver = av.player?.addPeriodicTimeObserver(forInterval: interval, queue: .main, using: getTimeObserver(observerType))
            
            parentView!.present(av, animated: true) {
                
                self.av.player!.play()
                if AdManager.shared.funnelProgress == .seenPartOfVideo1 && self.lesson.baseID == K.FBConstants.baseCourseIDs[0] {
                    self.av.player!.seek(to: CMTime(seconds: AdManager.shared.introVideoTimeLeftAt, preferredTimescale: 1))
                }
            }
        }
    }
        
    func updateNextVideoIfNecessary(_ av: PUAVPlayerViewController, progressTime: Double, currPosition: VideoPosition, videoGroup: VideoGroup) {
        
        if let duration = av.player?.currentItem?.duration {
            let durationSecs = CMTimeGetSeconds(duration)
            if durationSecs - progressTime <= Double(K.VideoConstants.secondsToMarkVideoFinished) {
            
                if currPosition.row < videoGroup.sections[currPosition.section].videos.count - 1 {
                    let newPosition = VideoPosition(baseID: currPosition.baseID, section: currPosition.section, row: currPosition.row + 1)
                    AdManager.shared.currentVideoPosition = newPosition
                    AnalyticsManager.shared.logFinishedVideo(position: newPosition)
                } else if currPosition.section < videoGroup.sections.count - 1 {
                    let newPosition = VideoPosition(baseID: currPosition.baseID, section: currPosition.section + 1, row: 0)
                    AdManager.shared.currentVideoPosition = newPosition
                    AnalyticsManager.shared.logFinishedVideo(position: newPosition)
                }
            }
        }
    }
}
