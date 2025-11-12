//
//  PurchasingManager.swift
//  Aura
//
//  Created by Maxwell Dolensky on 1/20/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import UIKit
import StoreKit
import Firebase

class PurchasingManager: NSObject {
    
   
    //MARK: - Variables
    static let shared = PurchasingManager()
    
    var myProduct: SKProduct?
    var parentVC: UIViewController?
    var creatorCode: String? 
    
    //MARK: - INIT
    override init() {
        super.init()
    }
    
    // Call this to get the product with the specific identifier
    func fetchProducts(productIdentifier: String, parentVC: UIViewController?) {
        self.parentVC = parentVC
        
        let request = SKProductsRequest(productIdentifiers: [productIdentifier])
        request.delegate = self
        request.start()
    }
    
    // This is the function to call to perform the purchase
    func makePayment() {
        
        guard let myProduct = myProduct else {
            print("my product is nil")
            DispatchQueue.main.async {
                self.parentVC?.endLoadingScreen()
            }
            return
        }
        
        if SKPaymentQueue.canMakePayments() {
            DispatchQueue.main.async {
                self.parentVC?.endLoadingScreen()
            }
            let payment = SKPayment(product: myProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }
        
    }
    
    func handlePurchase(transactionID: String) {
        switch myProduct?.productIdentifier {
        
        case K.productIdentifiers.ehdMasterCourse:
            unlockEHDCourse(transactionID, isBundle: false)
            recordBoughtWithCreatorCode()
            break
        
        case K.productIdentifiers.kygCourse, K.productIdentifiers.kygCourseNoDiscount:
            unlockKYGCourse(transactionID)
            recordBoughtWithCreatorCode()
            break
        
        case K.productIdentifiers.EHD_KYG_Bundle:
            unlockEHDCourse(transactionID, isBundle: true)
            unlockKYGCourse(transactionID)
            recordBoughtWithCreatorCode()
            break
        
        default:
            break
        }
    }
    
    func unlockEHDCourse(_ transactionID: String, isBundle: Bool) {
        AdManager.shared.funnelProgress = .completedVideo1Bought
        AnalyticsManager.shared.logFunnelChange(funnelProgress: .completedVideo1Bought)
        Utilities.shared.user?.purchases[K.productNames.ehdMasterCourse] = true
        Utilities.shared.user?.purchaseIDs[K.productIdentifiers.ehdMasterCourse] = transactionID
        
        transferCourseDecksToUser()
        
        if let user = Utilities.shared.user {
            FirebaseManager.shared.updateUser(user: user)
        }
        AdManager.shared.removeBuyButton()
        if let window = UIApplication.shared.keyWindow {
            window.displayCheck(text: NSLocalizedString("Success!", comment: "Success, whatever action you just performed worked successfully"))
            if !isBundle {
                AdManager.shared.showKYGCoursePopUP(parentVC: window.rootViewController!, didJustPurchaseEHDCourse: true)
            }
        }
    }
    
    func unlockKYGCourse(_ transactionID: String) {
        AnalyticsManager.shared.logKYGPurchase()
        Utilities.shared.user?.purchases[K.productNames.kygCourse] = true
        Utilities.shared.user?.purchaseIDs[K.productIdentifiers.kygCourse] = transactionID
        
        if let user = Utilities.shared.user {
            FirebaseManager.shared.updateUser(user: user)
        }
        AdManager.shared.removeBuyButton()
        if let window = UIApplication.shared.keyWindow {
            window.displayCheck(text: NSLocalizedString("Success!", comment: "Success, whatever action you just performed worked successfully"))
        }
    }
    
    func transferCourseDecksToUser() {
        guard let decks = Utilities.shared.superUser?.decks else {
            print("could not retrieve super user decks")
            return
        }
        
        let courseDecks = decks.filter {K.EHDMasterCourseDeckTitle.contains($0.name)}
        Utilities.shared.user?.decks.append(contentsOf: courseDecks)
    }
    
    func transferCourseDecksToUser(user: User) -> User? {
        guard let decks = Utilities.shared.superUser?.decks else {
            print("could not retrieve super user decks")
            return nil
        }
        
        var updatedUser = user
        let courseDecks = decks.filter {K.EHDMasterCourseDeckTitle.contains($0.name)}
        updatedUser.decks.append(contentsOf: courseDecks)
        return updatedUser
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: NSLocalizedString("Unable To Process this Purchase", comment: "Something went wrong and we could not process the purchase for this course try again later"), message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("Ok", comment: "ok, I acknowledge the action (for example successfully signing out) that just happened. When I press ok, the alert will go away and I can continue doing what I am doing in the app"), style: .cancel) { (action) in }
        alert.addAction(action)
        DispatchQueue.main.async {
            self.parentVC?.present(alert, animated: true, completion: nil)
        }
    }
    
    func recordBoughtWithCreatorCode() {
        guard let creatorCode = creatorCode else {
            return
        }
        
        if let product = myProduct {
            let price = Double(truncating: product.price)
            let courseName = product.productIdentifier
            let calanderDate = Calendar.current.dateComponents([.day, .year, .month], from: Date())
            
            if let day = calanderDate.day,
               let month = calanderDate.month,
               let year = calanderDate.year {
                
                let newCCPurchase = CCPurchase(
                    creatorCode: creatorCode,
                    day: day,
                    month: month,
                    year: year,
                    price: price,
                    courseName: courseName,
                    userEmail: Auth.auth().currentUser?.email ?? ""
                )
                
                FirebaseManager.shared.markPurchaseWithCreatorCode(newCCPurchase)
            }
        }
    }
}

//MARK: - Request Delegate
extension PurchasingManager: SKProductsRequestDelegate {
    
    // Called when the request returns
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        guard let product = response.products.first else {
            print("Unable to fetch product")
            DispatchQueue.main.async {
                self.parentVC?.endLoadingScreen()
            }
            showError(error: NSLocalizedString("Unable to fetch product. Please try again later", comment: "Could not connect to the apple store to get the course you want to purchase, try again later"))
            return
        }
        
        myProduct = product
        print(product.productIdentifier)
        print(product.price)
        print(product.priceLocale)
        print(product.localizedTitle)
        print(product.localizedDescription)
        
        makePayment()
        
    }
    
    // Called if request failed. Should inform user
    func request(_ request: SKRequest, didFailWithError error: Error) {
        
        guard request is SKProductsRequest else {
            return
        }
        
        print("Product fetch request failed")
        DispatchQueue.main.async {
            self.parentVC?.endLoadingScreen()
            self.showError(error: NSLocalizedString("Unable to fetch product. Please try again later", comment: "Could not connect to the apple store to get the course you want to purchase, try again later"))
        }
    }
    
}

//MARK: - Transaction Observer
extension PurchasingManager: SKPaymentTransactionObserver {
    
    // Called when you initiate a transaction
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            
            // Make sure the transaction is the same as the myProduct otherwise continue
            if transaction.payment.productIdentifier != myProduct?.productIdentifier {
                continue
            }
            
            switch transaction.transactionState {
    
            case .purchased, .restored:
                
                // Unlock their in app purchase
                if let originalTransactionID = transaction.original?.transactionIdentifier {
                    if  originalTransactionID != Utilities.shared.user?.purchaseIDs[myProduct!.productIdentifier] {
                        showError(error: NSLocalizedString("Could not restore purchase. The current signed in account does not match the account used when purchasing this product.", comment: ""))
                        SKPaymentQueue.default().finishTransaction(transaction)
                        SKPaymentQueue.default().remove(self)
                        return
                    } else {
                        handlePurchase(transactionID: originalTransactionID)
                        SKPaymentQueue.default().finishTransaction(transaction)
                        SKPaymentQueue.default().remove(self)
                        return
                    }
                }
                
                guard let transactionID = transaction.transactionIdentifier else {
                    showError(error: NSLocalizedString("Could not retrieve transaction identifier", comment: ""))
                    SKPaymentQueue.default().finishTransaction(transaction)
                    SKPaymentQueue.default().remove(self)
                    return
                }
                
                handlePurchase(transactionID: transactionID)
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            
            case .failed:
                
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                if let transactionError = transaction.error as NSError?,
                      let localizedDescription = transaction.error?.localizedDescription,
                        transactionError.code != SKError.paymentCancelled.rawValue {
                        showError(error: localizedDescription)
                      }
                break
            
            case .deferred:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
                
            case .purchasing:
                break
                
            default:
                
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            }
        }
    }
}
