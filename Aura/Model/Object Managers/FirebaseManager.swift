//
//  FirebaseManager.swift
//  simply-english
//
//  Created by Max Dolensky on 2/10/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FirebaseManager {
    
    let db = Firestore.firestore()
    static let shared = FirebaseManager()

    //MARK: - Words Data
    
    func writeEnglishWordData(wordModel: WordModel) {
        print("writing dict data")
        do {
            try db.collection(K.FBConstants.dictionaryCollectionName).document(wordModel.id).setData(from: wordModel)
        } catch let error {
            print("Error writing word to Firestore: \(error)")
        }
    }
    
    func writeColorError(text: String) {
        do {
            try db.collection(K.FBConstants.colorErrorsCollectionName).document(text).setData(from: ["word" : text])
        } catch let error {
            print("Error writing coloring error to Firestore: \(error)")
        }
    }
    
    func writeTranslationError(translation: TranslationError) {
        do {
            try db.collection(K.FBConstants.translationErrorCollectionName).document(translation.nativeText).setData(from: translation)
        } catch let error {
            print("Error writing word to Firestore: \(error)")
        }
    }
        
    func readEnglishDocumentByWord(words: [String], completion: @escaping(_ result: [WordModel?]) -> Void) {
        
        var results = [WordModel?]()
        var finalResults = [WordModel?]()
        
        // Remove Symbols and make word lowercased
        var lowerCaseWords = words.map { $0.removeSymbols().lowercased() }
        
        // This Prevents Fatal Error when removing symbols removes every character in the word.
        // This can happen when a user searches in the wrong language
        for i in 0..<words.count {
            
            if lowerCaseWords[i] == "" {
                lowerCaseWords[i] = words[i]
            }
            
        }
        
        // Start Query
        let dispatchGroup = DispatchGroup()
        
        for word in lowerCaseWords {
            
            
            let docRef = db.collection(K.FBConstants.dictionaryCollectionName).document(word)
            dispatchGroup.enter()
            docRef.getDocument { (document, error) in

                let result = Result {
                    try document.flatMap {
                        try $0.data(as: WordModel.self)
                    }
                }
                switch result {
                case .success(let wordModel):
                    if let wordModel = wordModel {
                        results.append(wordModel)
                    } else {
                        results.append(nil)
                        print("Document does not exist")
                    }
                case .failure(let error):
                    results.append(nil)
                    print("Error decoding: \(error)")
                }
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            for word in words {
                let temp = results.filter{$0?.id == word.removeSymbols().lowercased()}
                if temp.count == 0 {finalResults.append(nil)}
                else {
                    finalResults.append(temp[0])
                }
                
            }
            completion(finalResults)
            print("Finished with \(results.count) WordModels")
        }
    }
    
    //MARK: - User Data
    
    func createUser() {
        
        if let userID = Auth.auth().currentUser?.uid {
            
            let user = User(UID: userID, decks: [], prevSearches: [], purchases: [:])
            
            // Save Updated User to Utlities Singleton Class
            Utilities.shared.user = user
            
            // Save Updated User Model to Firebase
            do {
                
                try self.db.collection(K.FBConstants.usersCollectionName).document(userID).setData(from: user)
                
            } catch let error {
                
                print("Error writing deck to Firestore: \(error)")
                
            }
            
        }
        
    }
    
    func loadUser() {
        
        var userResult = User(UID: "", decks: [], prevSearches: [], purchases: [:])

        if let userID = Auth.auth().currentUser?.uid {
            
            let docRef = db.collection(K.FBConstants.usersCollectionName).document(userID)
            
            docRef.addSnapshotListener { (querySnapshot, error) in

                if let error = error {
                    print("Error getting User Document: \(error)")
                }
                
                else {
                    let result = Result {
                        try querySnapshot?.data(as: User.self)
                    }
                    
                    switch result {
                    case .success(let user):
                        if let user = user {
                            userResult = user
                        } else {
                            print("Nil User Model")
                        }
                    case .failure(let error):
                        print("Error decoding User Model: \(error)")
                    }
                    Utilities.shared.user = userResult
                }
            }
        }
    }
    
    func loadUser(uuid: String, completion: @escaping (User) -> Void) {
        
        let docRef = db.collection(K.FBConstants.usersCollectionName).document(uuid)
            
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                do {
//                    if let user = try document.data(as: User.self) {
                    let user = try document.data(as: User.self) 
                        completion(user)
//                    }
                } catch { print ("error getting user") }
            } else {
                print("Document does not exist")
            }
        }
    }
        
    func loadUserWhoPurchased() {
        let docRef = db.collection(K.FBConstants.usersCollectionName).whereField("purchases", in: [[K.productNames.ehdMasterCourse:true]])
        
        docRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting User Document: \(error)")
            }
            
            guard let querySnapshot = querySnapshot else {
                print("nil")
                return
            }
            
            var count = 0
            for document in querySnapshot.documents {
                
                let result = Result {
                    try document.data(as: User.self)
                }
                
                switch result {
                case .success(let user):
//                    if let user = user {
                        print(user.UID)
                        count += 1
//                    } else {
//                        print("Nil User Model")
//                    }
                case .failure(let error):
                    print("Error decoding User Model: \(error)")
                }
            }
            print(count)
        }
    }
                
    func loadSuperUser() {
        
        var superUserResult = User(UID: "", decks: [], prevSearches: [], purchases: [:])
        let docRef = db.collection(K.FBConstants.usersCollectionName).document(K.FBConstants.superUser)
        
        docRef.addSnapshotListener { (querySnapshot, error) in
            
            if let error = error {
                print("Error getting Super User Doc: \(error)")
            }
            
            else {
                let result = Result {
                    try querySnapshot?.data(as: User.self)
                }
                
                switch result {
                case .success(let superUser):
                    if let superUser = superUser {
                        superUserResult = superUser
                    } else {
                        print("Nil SuperUser Loaded")
                    }
                case .failure(let error):
                    print("Error decoding super user: \(error)")
                
                }
                Utilities.shared.superUser = superUserResult
            }
        }
    }
    
    func giveUserAccesstoCoursesAndFlashcards(uid: String) {
        let docRef = db.collection(K.FBConstants.usersCollectionName).document(uid)
        docRef.getDocument { (querySnapshot, error) in
            
            if let error = error {
                print("error getting user: \(error)")
            } else {
                
                let result = Result {
                    try querySnapshot?.data(as: User.self)
                }
                
                switch result {
                case .success(let user):
                    if let user = user {
                        let updatedUser = PurchasingManager.shared.transferCourseDecksToUser(user: user)
                        if var updatedUser = updatedUser {
                            updatedUser.purchases[K.productNames.ehdMasterCourse] = true
                            updatedUser.purchases[K.productNames.kygCourse] = true
                            print("\nUpdating User !!!!!!!!!!\n")
                            self.updateUser(user: updatedUser)
                        }
                    } else {
                        print("Nil SuperUser Loaded")
                    }
                case .failure(let error):
                    print("Error decoding super user: \(error)")
                }
            }
        }
    }
    
    func updateUser(user: User) {
        
        
        // Save Updated User to Utlities Singleton Class
        Utilities.shared.user = user
        
        // Save Updated User Model to Firebase
        do {
            
            try self.db.collection(K.FBConstants.usersCollectionName).document(user.UID).setData(from: user)
            
        } catch let error {
            print("Error writing deck to Firestore: \(error)")
 
        }
    }
    
    //MARK: - Lessons Data
    
    func updateLesson(videoGroup: VideoGroup) {
        
        do {
            
            try self.db.collection(K.FBConstants.lessonsCollectionName).document(videoGroup.id).setData(from: videoGroup)
            
        } catch let error {
            print("Error writing deck to Firestore: \(error)")
        }
        
    }
    
    func markPurchaseWithCreatorCode(_ newCCPurchase: CCPurchase) {
        
        let docRef = db.collection(K.FBConstants.ccPurchasesCollectionName).document(newCCPurchase.creatorCode)

        docRef.getDocument { (document, error) in

            let result = Result {
                try document.flatMap {
                    try $0.data(as: CCPurchases.self)
                }
            }
            switch result {
            case .success(let ccPurchases):
                if var ccPurchases = ccPurchases {
                    ccPurchases.ccPurchases.append(newCCPurchase)
                    self.writeCCPurchase(ccPurchases: ccPurchases, docName: newCCPurchase.creatorCode)
                } else {
                    print("document with creator code not found")
                }
            case .failure(let error):
                print("Error decoding: \(error)")
            }
        }
    }
    
    func writeCCPurchase(ccPurchases: CCPurchases, docName: String) {
        do {
            try self.db.collection(K.FBConstants.ccPurchasesCollectionName).document(docName).setData(from: ccPurchases)
        } catch let error {
            print("Error writing ccPurchase to Firestore: \(error)")
        }
    }
    
    func loadCreatorCodes() {
       
        var creatorCodes = [String]()
        
        db.collection(K.FBConstants.ccPurchasesCollectionName).addSnapshotListener { querySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
                Utilities.shared.creatorCodes = Set(creatorCodes)
            } else {
                for document in querySnapshot!.documents {
                    creatorCodes.append(document.documentID)
                }
                Utilities.shared.creatorCodes = Set(creatorCodes)
            }
        }
    }
    
    func loadLessons() {
        
        var videoGroup = [VideoGroup]()
        
        db.collection(K.FBConstants.lessonsCollectionName).whereField("baseID", in: K.FBConstants.baseCourseIDs).addSnapshotListener { (querySnapshot, err) in
            
            if let err = err {
                
                print("Error getting documents: \(err)")
                
            }
            
            else {
                
                for document in querySnapshot!.documents {
                    
                    let result = Result {
                        try document.data(as: VideoGroup.self)
                    }
                    
                    switch result {
                        
                    case .success(let group):
                        
//                        if let group = group {
                            videoGroup.append(group)
//                        } else {
//                            print("nil lessonModel")
//                            break
//                        }
                        
                    case.failure(let error):
                        
                        print("Error decoding: \(error)")
                        
                    }
                }
                Utilities.shared.lessons = videoGroup
            }
        }
    }
}
