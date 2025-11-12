//
//  AppDelegate.swift
//  Aura
//
//  Created by Max Dolensky on 7/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var hasAlreadyLaunched :Bool!
    var window : UIWindow?
    let loginNav = UINavigationController(rootViewController: LoginController())
    var tabVC: TabBarController?
    
    // MARK: - Language Configuration Helper
    private func configureAppLanguage() {
        // Remove any cached language preference to get true system language
        UserDefaults.standard.removeObject(forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        // Get actual system language
        let systemLang = Locale.preferredLanguages.first ?? "en"
        let langCode = systemLang.split(separator: "-").map { String($0) }[0]
        
        // Set app language: Japanese if system is Japanese, otherwise English
        let appLang = (langCode == "ja") ? "ja" : "en"
        UserDefaults.standard.set([appLang], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        print("✅ Language Configuration - System: \(systemLang), App set to: \(appLang)")
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Configure app language based on system settings
        configureAppLanguage()
        
        // Paste into AppDelegate or SceneDelegate at startup
        print("Locale.preferredLanguages: ", Locale.preferredLanguages)
        print("Bundle.main.localizations: ", Bundle.main.localizations)
        print("Bundle.main.developmentLocalization: ", Bundle.main.developmentLocalization ?? "nil")
        let preferredForApp = Bundle.preferredLocalizations(from: Locale.preferredLanguages)
        print("Bundle.preferredLocalizations(from: preferredLanguages): ", preferredForApp)
            
        // Configure Firebase
        FirebaseApp.configure()
        RCManager.shared.configure(expirationDuration: K.RCConstants.minimumFetchTime)
        
        _ = Firestore.firestore()
        _ = Storage.storage()
        
        FirebaseManager.shared.loadLessons()
        FirebaseManager.shared.loadSuperUser()
        FirebaseManager.shared.loadCreatorCodes()
        
        if Auth.auth().currentUser != nil {
            FirebaseManager.shared.loadUser()
            Utilities.shared.isUserSignedIn = true
        }
        
        // Initialize New Realm
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
        
        // Retrieve value from local store, if value doesn't exist then false is returned
        hasAlreadyLaunched = UserDefaults.standard.bool(forKey: "hasAlreadyLaunched")
        
        // Check first launched
        if (hasAlreadyLaunched)
        {
            print("exists")
            hasAlreadyLaunched = true
            
        }else{
            UserDefaults.standard.set(true, forKey: "hasAlreadyLaunched")
            RealmPopulater.populateRealm()
            RealmPopulater.addWildcardsToRealm()
            print("1st time")
        }
        
        // Setup audio to prevent first time  lag
        Utilities.shared.playSound("empty", volume: 0)
        
        // Do interface stuff for ios 12 version
        if #available(iOS 13.0, *) {
            // Do only pure app launch stuff, not interface stuff
        } else {
            
            tabVC = TabBarController()
            
            window = UIWindow()
            if Auth.auth().currentUser != nil {
                window?.rootViewController = tabVC
            } else {
                window?.rootViewController = loginNav
            }
            window?.makeKeyAndVisible()
                        
        }
        
        NetworkManager.shared.startMonitoring()
                
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        if let user = Utilities.shared.user {
            FirebaseManager.shared.updateUser(user: user)
        }
        
        NetworkManager.shared.stopMonitoring()
        print("background")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        NetworkManager.shared.startMonitoring()
        FirebaseManager.shared.loadUser()
        FirebaseManager.shared.loadLessons()
        FirebaseManager.shared.loadSuperUser()
        FirebaseManager.shared.loadCreatorCodes()
        print("foreground")
    }
    
    func getDeviceLanguageCode() -> String {
        
        guard let code = Locale.preferredLanguages.first else { return "en" }
        
        let codeAndRegion = code.split(separator: "-").map { String($0) }
        
        if codeAndRegion.count >= 3 {
            
            return "\(codeAndRegion[0])-\(codeAndRegion[1])"
            
        } else { return codeAndRegion[0] }
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
              let host = components.host else {
            return false
        }
        
        if host == "ehdmastercourse" {
            
            if Auth.auth().currentUser != nil {
                tabVC!.selectedIndex = 4
                AdManager.shared.showBuyButton(inVideo: false,
                                               isForKYGCourse: false,
                                               isAfterEHDPurchase: false,
                                               videoVC: nil,
                                               parentVC: tabVC!.children[4]
                )
            } else {
                (loginNav.viewControllers.first as! LoginController).selectedTabAfterLogin = 4
            }
           
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }


}

