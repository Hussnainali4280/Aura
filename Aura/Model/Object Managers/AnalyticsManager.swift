//
//  AnalyticsManager.swift
//  Aura
//
//  Created by Maxwell Dolensky on 3/25/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import Foundation
import FirebaseAnalytics

class AnalyticsManager {
    
    static let shared = AnalyticsManager()
    
    func logSearch(searchTerm: String) {
        Analytics.logEvent(AnalyticsEventSearch, parameters: [AnalyticsParameterSearchTerm: searchTerm.lowercased()])
    }
    
    func logTutorialBegin() {
        Analytics.logEvent(AnalyticsEventTutorialBegin, parameters: nil)
    }
    
    func logTutorialComplete() {
        Analytics.logEvent(AnalyticsEventTutorialComplete, parameters: nil)
    }
    
    func logTutorialSkipped() {
        Analytics.logEvent("tutorial_skipped", parameters: nil)
    }
    
    func logSignUp() {
        Analytics.logEvent(AnalyticsEventSignUp, parameters: nil)
    }
    
    func logLogin() {
        Analytics.logEvent(AnalyticsEventLogin, parameters: nil)
    }
    
    func logLoginImpression() {
        Analytics.logEvent("sign_up_impression", parameters: nil)
    }
    
    func logFunnelChange(funnelProgress: FunnelProgress) {
        Analytics.logEvent("funnel_change", parameters: ["curr_funnel_position" : funnelProgress.rawValue])
    }
    
    func logBuyButtonSeen() {
        Analytics.logEvent("buy_button_seen", parameters: nil)
    }
    
    func logBuyButtonPressed() {
        Analytics.logEvent("buy_button_pressed", parameters: nil)
    }
    
    func logClickedVideoPopUp(videoTitle: String) {
        Analytics.logEvent("clicked_video_popup", parameters: ["po_up_title" : videoTitle])
    }
    
    func logSkippedVideoPopUp(videoTitle: String) {
        Analytics.logEvent("skipped_video_popup", parameters: ["pop_up_title" : videoTitle])
    }
    
    func logStartedVideo(position: VideoPosition) {
        Analytics.logEvent("started_video", parameters: ["baseID" : position.baseID, "section" : position.section, "row": position.row])
    }
    
    func logFinishedVideo(position: VideoPosition) {
        Analytics.logEvent("finished_video", parameters: ["baseID" : position.baseID, "section" : position.section, "row": position.row])
    }
    
    func logAddFlashcardPressed() {
        Analytics.logEvent("added_flashcard_pressed", parameters: nil)
    }
    
    func logTestPressed() {
        Analytics.logEvent("test_pressed", parameters: nil)
    }
    
    func logStudyLoopPressed() {
        Analytics.logEvent("study_loop_pressed", parameters: nil)
    }
    
    func logKYGPurchase() {
        Analytics.logEvent("KYG_Course_Purchase", parameters: nil)
    }
    
    func logBundlePressed() {
        Analytics.logEvent("bundle_button_pressed", parameters: nil)
    }
    
}
