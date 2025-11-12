//
//  SceneDelegate.swift
//  Aura
//
//  Created by Max Dolensky on 7/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import Firebase
@available(iOS 13.0, *)

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let loginNav = UINavigationController(rootViewController: LoginController())
    let tabVC = TabBarController()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        if Auth.auth().currentUser != nil {
            window?.rootViewController = tabVC
        } else {
            window?.rootViewController = loginNav
        }
        
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        if let user = Utilities.shared.user {
            FirebaseManager.shared.updateUser(user: user)
        }
        NetworkManager.shared.stopMonitoring()
        print("background")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        NetworkManager.shared.startMonitoring()
        FirebaseManager.shared.loadUser()
        FirebaseManager.shared.loadLessons()
        FirebaseManager.shared.loadSuperUser()
        FirebaseManager.shared.loadCreatorCodes()
        print("foreground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
              let host = components.host else { return }
        
        if host == "ehdmastercourse" {
            
            if Auth.auth().currentUser != nil {
                tabVC.selectedIndex = 4
                AdManager.shared.showBuyButton(inVideo: false,
                                               isForKYGCourse: false,
                                               isAfterEHDPurchase: false,
                                               videoVC: nil,
                                               parentVC: tabVC.children[4]
                )
            } else {
                (loginNav.viewControllers.first as! LoginController).selectedTabAfterLogin = 4
            }
           
        }
    }


}

