//
//  UtilityFunctions.swift
//  Aura
//
//  Created by Max Dolensky on 8/3/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

protocol FirebaseUpdaterDelegate {
    
    func updateMyDecksDisplay()
    func updatePopularDecksDisplay()
    func updateLessonsDisplay()
    func updateSecretsThumbnail()
    
}

extension FirebaseUpdaterDelegate {
    func updateMyDecksDisplay() { return }
    func updatePopularDecksDisplay() { return }
    func updateLessonsDisplay() { return }
    func updateSecretsThumbnail() { return }
}

protocol AddSearchHistoryDelegate {
    
    func updateSearchHistory()
    
}

class Utilities {
    
    static let shared = Utilities()
    
    var homeDelegate: FirebaseUpdaterDelegate?
    var decksDelegate: FirebaseUpdaterDelegate?
    var resultsDelegate: FirebaseUpdaterDelegate?
    var searchHistoryDelegate: AddSearchHistoryDelegate?
    var lessonsTabDelegate: FirebaseUpdaterDelegate?
    var settingsLauncher = SettingsLauncher()
    var popUpDelegate: FirebaseUpdaterDelegate?
    var learnMoreDelegates = [FirebaseUpdaterDelegate]()
    
    var user: User? {
        
        didSet {
            self.decksDelegate?.updateMyDecksDisplay()
            self.searchHistoryDelegate?.updateSearchHistory()
            self.homeDelegate?.updateMyDecksDisplay()
            self.resultsDelegate?.updateMyDecksDisplay()
            for delegate in learnMoreDelegates {
                delegate.updateMyDecksDisplay()
            }
            updateFunnelForSignIn()
        }
        
    }
    
    var superUser: User? {
        
        didSet {
            self.homeDelegate?.updatePopularDecksDisplay()
            self.decksDelegate?.updatePopularDecksDisplay()
        }
        
    }
    
    var lessons: [VideoGroup]? {
        didSet {
            self.homeDelegate?.updateLessonsDisplay()
            self.homeDelegate?.updateSecretsThumbnail()
            self.lessonsTabDelegate?.updateLessonsDisplay()
            self.resultsDelegate?.updateSecretsThumbnail()
            self.popUpDelegate?.updateSecretsThumbnail()
            for delegate in learnMoreDelegates {
                delegate.updateSecretsThumbnail()
            }
            
        }
    }
    
    var creatorCodes = Set<String>()
    
    //MARK: - Sound Variables and Functions
    var soundItOutPlayer: AVAudioPlayer?
    var player : AVPlayer?

//    func playAudioFile(urlString: String, loop: Int = 0, sender: UIButton) {
//        
//    }
    
    func updateFunnelForSignIn() {
        guard let funnelProgress = AdManager.shared.funnelProgress else {
            return
        }
        
        if funnelProgress == .completedVideo1Bought && user == nil {
            AdManager.shared.funnelProgress = .completedVideo1NoBuy
            return
        }
        
        if user != nil && user!.purchases[K.productNames.ehdMasterCourse] == true {
            AdManager.shared.funnelProgress = .completedVideo1Bought
            return
        }
        
        // For testing I can change a purchase back to false
//        if user != nil && user!.purchases[K.productNames.ehdMasterCourse] == false {
//            AdManager.shared.funnelProgress = .completedVideo2NoBuy
//            return
//        }
        
    }
    
    func playSound(_ soundFileName: String, volume: Float = 1) {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            soundItOutPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = soundItOutPlayer else { return }
            player.volume = volume
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Email and Password Validation
    
    func isPasswordValid(_ password : String) -> Bool{
        
        // 1 - Password length at least 8.
        // 2 - One Alphabet in Password.
        // 3 - One Special Character in Password
        // NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        
        // Password must contain at least 8 characters
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^.{8,}$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid(_ enteredEmail:String) -> Bool {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)

    }
    
    //MARK: - Log In Properties/Methods
    var isUserSignedIn: Bool = false {
        
        didSet {
            
            self.settingsLauncher.signInLabel.text = isUserSignedIn ? NSLocalizedString("Sign Out", comment: "Sign out(Log out) of your user account") : NSLocalizedString("Sign Up / Log In", comment: "Sign up or login to create a new user account")
            
        }
        
    }
    var tabController: TabBarController?
    
    func signUserOut(alertIn vc: UIViewController) {
        
        if let user = Utilities.shared.user {
            FirebaseManager.shared.updateUser(user: user)
        }
        
        // Logout Alert
        let alert = UIAlertController(title: NSLocalizedString("Logout", comment: "Log out of your user account"), message: NSLocalizedString("Are you sure you want to logout", comment: "Checking to make sure they actually want to log out before we log them out of their account"), preferredStyle: .alert)
        
        // Alert Actions
        let actionOk = UIAlertAction(title: NSLocalizedString("OK", comment: "ok, I acknowledge the action (for example successfully signing out) that just happened. When I press ok, the alert will go away and I can continue doing what I am doing in the app"), style: .default) { (action) in
            return
        }
        
        let actionNo = UIAlertAction(title: NSLocalizedString("No", comment: "No I don't want to perform this action (for example sign out)"), style: .cancel) { (action) in
            return
        }
        
        let actionYes = UIAlertAction(title: NSLocalizedString("Yes", comment: "Yes I do want to perform this action (for example sign out)"), style: .default) { (action) in
            
            // Sign Out
            do {
                
                try Auth.auth().signOut()
                
                self.isUserSignedIn = false
                self.user = nil
                
                let window = UIApplication.shared.keyWindow
                window?.rootViewController = Utilities.shared.getLoginVC()
            }
            
            catch let signOutError as NSError {
                
                let errorAlert = UIAlertController(title: NSLocalizedString("Error Signing Out", comment: "Something went wrong and we were unable to sign you out"), message: signOutError.localizedDescription, preferredStyle: .alert)
                errorAlert.addAction(actionOk)
                vc.present(errorAlert, animated: true, completion: nil)
                
            }
            
        }
        
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
    func getLoginVC() -> UINavigationController {
        if #available(iOS 13.0, *) {
            return  (UIApplication.shared.windows.first?.windowScene?.delegate as! SceneDelegate).loginNav
        } else {
            return (UIApplication.shared.delegate as! AppDelegate).loginNav
        }
    }
    
    func getTabVC() -> TabBarController {
        if #available(iOS 13.0, *) {
            return  (UIApplication.shared.windows.first?.windowScene?.delegate as! SceneDelegate).tabVC
        } else {
            return (UIApplication.shared.delegate as! AppDelegate).tabVC!
        }
    }

    //MARK: - Add New Deck Function
    func getUniqueDeckName(from input: String, given myDecks: [DeckModel]) -> String {
        
        var nameSet = Set<String>()
        
        for deck in myDecks {
            
            nameSet.insert(deck.name)
            
        }
        
        if !nameSet.contains(input) {
            
            return input
            
        }
        
        var count = 1
        
        while true {
            
            let text = "\(input) \(count)"
            
            if !nameSet.contains(text) {
                
                return text
                
            }
            
            count += 1
            
        }
        
    }
    
    let uuids = [
        "8LmCEu6wQrVj9LxWXa23R0nmGqf2",
        "QV9FkX78WlPtSQtGrReA0RGUdHi2",
        "AGzIcdOE4aNpeUQE3MHNlqCscAC3",
        "m14eZefpPkZSl83RJvXC3ZPug1u1",
        "aNvqUJMejQgvHElaurWjqXIYHJB3",
        "vQbnVIpagwXS8ZLJchRGZpsYjit2",
        "Boz8t3pIWBhokcUvFMVNEA3CkxN2",
        "ixPgrfGiF4Yhcj3ZP5F9XN8Qiyn2",
        "SFud3tCLDzVhvOfgpAhEtQGE7TO2",
        "kXrbN9sYGae3SkPlm9kt3Z4zAgm2",
        "FbRMcf20ukO05tyzGwek8dTSIF33",
        "ZOg6EaMVG6gBVKsbKv25eX70nt33",
        "BdaLk2CzwNafbCZWMjXv8z0R9uj1",
        "zyqBVD8WdYf1aN8hvioJTRWZEYz2",
        "geSdlyMUzufl4Kin6N0iiLNh1tt2",
        "dcr3nLjxUdPIVQ9iXZdNmwY3s472",
        "v4XB5SBFMrfjvnt5iq1bvgDKeDt2",
        "LLq7QfaKllQJvXwuuR1HXwCNnQB2",
        "eiXa3rm71NPda5ZxIwfrO6EK8ha2",
        "BurprpuvIscTnx913FAbxy6XGUr1",
        "UpaAccGC6KZN1C16jZMRvlNAQkU2",
        "FsgABVw0EoeYwwcQinq8G2KcdWM2",
        "egrHUDemqJdMHbwmpKxeKnKtc713",
        "mFYvUqkckAOzYmX8Scyd6DtZyiz2",
        "0YYhiIq1rKS67khGMrrbEBJMsCA3",
        "6magrBxkRPVEEzONXgyLX69R2Y13",
        "YpxNbGwjFgQQjbGe30oIkm5c15m2",
        "3DHJgjVuEugqxO6rJDOupTnxpve2",
        "LbZGr4nQTJXgxplCAQh8Sb5w3ro2",
        "eHIuflxM9iNeUz83p3Cec0n10oH3",
        "rYkITGbRV3gk9kOvTfAC2RedMF53",
        "vF9tagLsexbZh7qOkxKvaBimp2m2",
        "tuERsQjnL2MMI3oYGSZiayobNOk1",
        "Zij58M1c71YSlt0blpBedJF3VqW2",
        "kzR0BBP0fSWeABJmqsMawHvJoat1",
        "5XvWVzocTwNvbp4GChMb5SFvzPO2",
        "rwJDQmq9DkOs427UJm6bW0VAaPt2",
        "LwAMFyDw1YWmqUL7FGQEuOxkb483",
        "zYxG4A9fM6fHmg1J2sLNOWWwtM62",
        "RlHhYsAo3CePRKL20pbIyUZiNbj1",
        "j1QsTs9Aj7RO7IFwM6OWmCHU1fu1"
    ]
    
    func addPurchasesAndDecksSoIDontHaveTo() {
        for uid in uuids {
            FirebaseManager.shared.giveUserAccesstoCoursesAndFlashcards(uid: uid)
        }
    }
}
