//
//  NetworkManager.swift
//  Aura
//
//  Created by Maxwell Dolensky on 3/7/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import UIKit
import Network

protocol NetworkConnectionUpdater {
    func setInterfaceForNetworkConnection()
    func setInterfaceForNoNetworkConnection()
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let queue = DispatchQueue.global(qos: .background)
    private var monitor: NWPathMonitor?
    
    var homeDelegate: NetworkConnectionUpdater?
    var searchDelegate: NetworkConnectionUpdater?
    var resultDelegate: NetworkConnectionUpdater?
    var learnMoreDelegates = [NetworkConnectionUpdater]()
    var deckDelegate: NetworkConnectionUpdater?
    var lessonsDelegate: NetworkConnectionUpdater?
    
    public private(set) var isConnected: Bool = false
    
    public func startMonitoring() {
        
        monitor = NWPathMonitor()
        
        monitor!.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    self.isConnected = true
                    self.setViewControllerLayoutsForNetworkConnection()
                }
            } else {
                DispatchQueue.main.async {
                    self.isConnected = false
                    self.setViewControllerLayoutsForNoNetworkConnection()
                }
            }
        }
        
        monitor!.start(queue: queue)
    }
    
    public func stopMonitoring() {
        monitor!.cancel()
    }
    
    private func setViewControllerLayoutsForNetworkConnection() {
        homeDelegate?.setInterfaceForNetworkConnection()
        searchDelegate?.setInterfaceForNetworkConnection()
        resultDelegate?.setInterfaceForNetworkConnection()
        
        for delegate in learnMoreDelegates {
            delegate.setInterfaceForNetworkConnection()
        }
        
        deckDelegate?.setInterfaceForNetworkConnection()
        lessonsDelegate?.setInterfaceForNetworkConnection()
    }
    
    private func setViewControllerLayoutsForNoNetworkConnection() {
        homeDelegate?.setInterfaceForNoNetworkConnection()
        searchDelegate?.setInterfaceForNoNetworkConnection()
        resultDelegate?.setInterfaceForNoNetworkConnection()
        
        for delegate in learnMoreDelegates {
            delegate.setInterfaceForNoNetworkConnection()
        }
        
        deckDelegate?.setInterfaceForNoNetworkConnection()
        lessonsDelegate?.setInterfaceForNoNetworkConnection()
    }
}
