//
//  AzureTranslateManager.swift
//  Aura
//
//  Created by Max Dolensky on 9/9/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation

class AzureTranslationManager: NSObject {
    
    //MARK: - Variables
    static let shared = AzureTranslationManager()
    private let apiKey = "001acc10a90b49138985e8502cab1243"
    var supportedLanguages = [SupportedLanguage]()
    var sourceLanguageCode: String?
    var textToTranslate: String?
    var targetLanguageCode: String? = "en"
    let jsonEncoder = JSONEncoder()
    
    //MARK: - INIT
    override init() {
        super.init()
    }
    
    //MARK: - Functions
    func fetchSupportedLanguages(completion: @escaping() -> Void) {
        
        let urlString = "https://api.cognitive.microsofttranslator.com/languages?api-version=3.0&scope=dictionary"

        guard let url = URL(string: urlString) else {
            print("unable to form URL")
            completion()
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Check For error
            if let error = error {
                print("Error fetching supported Languages: \(error.localizedDescription)")
                completion()
                return
                
            }
            
            // Unwrap Data
            guard let data = data else {
                print("Data is nil")
                completion()
                return
            }
            
            // Decode Data
            let decoder = JSONDecoder()
            
            guard let languages = try? decoder.decode(Dictionary.self, from: data) else {
                print("Unable to Decode Data")
                completion()
                return
            }
            
            // Get all languages supported by English then add English
            self.supportedLanguages = []
            
            guard let englishLanguage = languages.dictionary["en"] else {
                print(" \"en\" not in dictionary")
                completion()
                return
            }
            
//            // Add Auto Detect
//            let supportedLanguage0 = SupportedLanguage(name: "Auto Detect", nativeName: "Auto Detect", code: "")
//            self.supportedLanguages.append(supportedLanguage0)
            
            // Add English
            let supportedLanguage = SupportedLanguage(name: "English", nativeName: "English", code: "en")
            self.supportedLanguages.append(supportedLanguage)
            
            // Add rest of supported languages
            for translationLanguage in englishLanguage.translations {
                
                let supportedLanguage = SupportedLanguage(name: translationLanguage.name,
                                                          nativeName: translationLanguage.nativeName,
                                                          code: translationLanguage.code)

                self.supportedLanguages.append(supportedLanguage)
            }
            
            completion()
            
        }
        task.resume()
    }
    
    func fetchTranslation(completion: @escaping (_ translations: String?) -> Void) {
        
        // Setup URL
        let urlString = "https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&from=\(sourceLanguageCode!)&to=\(targetLanguageCode!)"
        
        guard let url = URL(string: urlString) else {
            print("Unable to form url")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Setup Request Body
        struct EncodeLookupText: Codable {
            var text: String
        }
        
        let encodedLookupText = [EncodeLookupText(text: self.textToTranslate!)]
        
        guard let jsonToTranslate = try? jsonEncoder.encode(encodedLookupText) else {
            print("Unable to encode text to translate")
            completion(nil)
            return
        }
        
        request.httpBody = jsonToTranslate
        
        // Add Headers
        request.addValue(apiKey, forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(String(describing: jsonToTranslate.count), forHTTPHeaderField: "Content-Length")
        request.addValue(UUID.init().uuidString, forHTTPHeaderField: "X-ClientTraceId")
        
        // Request Data
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check For error
            if let error = error {
                
                print("Error fetching regular translations: \(error.localizedDescription)")
                completion(nil)
                return
                
            }
            
            // Unwrap Data
            guard let data = data else {
                print("Data is nil")
                completion(nil)
                return
            }
                        
            // Decode Data
            let decoder = JSONDecoder()
            
            guard let translationResponse = try? decoder.decode(Array<TranslationResponse>.self, from: data) else {
                print("Unable to Decode Data")
                completion(nil)
                return
            }
            
            if translationResponse.count > 0 && translationResponse[0].translations.count > 0 {
                completion(translationResponse[0].translations[0].text)
            }
            
            else {
                completion(nil)
            }
            
            
        }
        task.resume()
        
    }
    
    func fetchDictionaryTranslations(completion: @escaping(_ dictionaryResults: [String : [DictionaryResult]]) -> Void) {
        
        var results = [String : [DictionaryResult]]()
        
        // Setup URL
        let urlString = "https://api.cognitive.microsofttranslator.com/dictionary/lookup?api-version=3.0&from=\(sourceLanguageCode!)&to=\(targetLanguageCode!)"
        
        guard let url = URL(string: urlString) else {
            print("Unable to form url")
            completion(results)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Setup Request Body
        struct EncodeLookupText: Codable {
            var text: String
        }
        
        let encodedLookupText = EncodeLookupText(text: self.textToTranslate!)
        
        guard let jsonToTranslate = try? jsonEncoder.encode(encodedLookupText) else {
            print("Unable to encode text to translate")
            completion(results)
            return
        }
        
        request.httpBody = jsonToTranslate
        
        // Add Headers
        request.addValue(apiKey, forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(String(describing: jsonToTranslate.count), forHTTPHeaderField: "Content-Length")
        request.addValue(UUID.init().uuidString, forHTTPHeaderField: "X-ClientTraceId")
        
        // Request Data
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check For error
            if let error = error {
                
                print("Error fetching dictionary translations: \(error.localizedDescription)")
                completion(results)
                return
                
            }
            
            // Unwrap Data
            guard let data = data else {
                print("Data is nil")
                completion(results)
                return
            }
            
            // Decode Data
            let decoder = JSONDecoder()
            
            guard let dictionaryResponse = try? decoder.decode(DictionaryResponse.self, from: data) else {
                print("Unable to Decode Data")
                completion(results)
                return
            }
            
            for translation in dictionaryResponse.translations {
                
                let backTranslations = translation.backTranslations.map { $0.displayText }
                
                let newDictResult = DictionaryResult(displayTarget: translation.displayTarget, backTranslations: backTranslations)
                
                if let _ = results[translation.posTag] {
                    
                    results[translation.posTag]!.append(newDictResult)
                    
                }
                
                else {
                    
                    results[translation.posTag] = [newDictResult]
                    
                }
                
            }
            
            completion(results)
            
        }
        task.resume()
    }
    
    func fetchExamples(backTranslationNormalizedText: String, translationsNormalizedTarget: String) {
        
        // Setup URL
        let urlString = "https://api.cognitive.microsofttranslator.com/dictionary/examples?api-version=3.0&from=\(sourceLanguageCode!)&to=\(targetLanguageCode!)"
        
        guard let url = URL(string: urlString) else {
            print("Unable to form url")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Setup Request Body
        struct EncodeLookupExample: Codable {
            var text: String
            var translation: String
        }
        
        let encodedLookupExample = [EncodeLookupExample(text: backTranslationNormalizedText,
                                                       translation: translationsNormalizedTarget)]
        
        guard let jsonToTranslate = try? jsonEncoder.encode(encodedLookupExample) else {
            print("Unable to encode text to translate")
            return
        }
        
        request.httpBody = jsonToTranslate
        
        // Add Headers
        request.addValue(apiKey, forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(String(describing: jsonToTranslate.count), forHTTPHeaderField: "Content-Length")
        request.addValue(UUID.init().uuidString, forHTTPHeaderField: "X-ClientTraceId")
        
        // Request Data
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check For error
            if let error = error {
                
                print("Error fetching dictionary translations: \(error.localizedDescription)")
                return
                
            }
            
            // Unwrap Data
            guard let data = data else {
                print("Data is nil")
                return
            }
            
            // Decode Data
            let decoder = JSONDecoder()
            
            guard let dictionaryResponse = try? decoder.decode([ExampleResponse].self, from: data) else {
                print("Unable to Decode Data")
                return
            }
            
            print(dictionaryResponse)
            
        }
        task.resume()
        
    }
    
}
