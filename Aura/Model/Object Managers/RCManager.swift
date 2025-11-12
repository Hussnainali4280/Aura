//
//  RCManager.swift
//  Aura
//
//  Created by Maxwell Dolensky on 5/6/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig

class RCManager {
    
    static let shared = RCManager()
    
    private var remoteConfig: RemoteConfig = {
        var remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = K.RCConstants.minimumFetchTime
        remoteConfig.configSettings = settings
        
        let defaults: [String: NSObject] = [
            K.RCConstants.introBaseID : "intro_medium" as NSObject,
            K.RCConstants.minuteToShowBuyBtn : 14 as NSObject,
            K.RCConstants.secondToShowBuyBtn : 30 as NSObject
        ]
        remoteConfig.setDefaults(defaults)
        
        return remoteConfig
        
    }()
    
    // 3600 is 1 Hr: CHANGE to longer
    func configure(expirationDuration: TimeInterval = K.RCConstants.minimumFetchTime) {
        remoteConfig.fetch(withExpirationDuration: expirationDuration) { status, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("\nReceived values from Remote Config\n")
            RemoteConfig.remoteConfig().activate { _, error in
                FirebaseManager.shared.loadLessons()
            }
        }
    }
    
    func value(forKey key: String) -> String {
        return remoteConfig.configValue(forKey: key).stringValue!
    }
    
    func value(forKey key: String) -> Bool {
        return remoteConfig.configValue(forKey: key).boolValue
    }
    
    func value(forKey key: String) -> Data {
        return remoteConfig.configValue(forKey: key).dataValue
    }
    
    func value(forKey key: String) -> NSNumber {
        return remoteConfig.configValue(forKey: key).numberValue
    }
    
}
