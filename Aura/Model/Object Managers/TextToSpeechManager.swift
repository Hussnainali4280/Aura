//
//  TextToSpeechManager.swift
//  Aura
//
//  Created by Max Dolensky on 9/11/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation

struct TextToSpeechBody: Codable {
    
    var input: SynthesisInput
    var voice: VoiceSelectionParams
    var audioConfig: AudioConfig
    
}

struct SynthesisInput: Codable {
    
    var text: String
    
}

struct VoiceSelectionParams: Codable {
    
    var languageCode: String
    var name: String
    var ssmlGender: String
    
}

struct AudioConfig: Codable {
    
    var audioEncoding: String
    
}

struct ResponseBody: Codable {
    
    var audioContent: String
    
}

class TextToSpeechManager: NSObject {
    
    //MARK: - Variables
    static let shared = TextToSpeechManager()
    
    private let baseURL = "https://texttospeech.googleapis.com/v1/text:synthesize?key=AIzaSyBirAtubkd-R8rTzQZZb1kJ06BTc-4xlYE"
    private let httpMethod = "POST"
    private let languageCode = "en-US"
    private let maleVoice = "en-US-WaveNet-I"
    private let femaleVoice = "en-US-WaveNet-H"
    private let audioEncoding = "LINEAR16"
    private let encoder = JSONEncoder()
    
    var avPlayer: AVAudioPlayer?
    var audioCache = NSCache<AnyObject, AnyObject>()
    
    //MARK: - INIT
    override init() {
        super.init()
    }
    
    func fetchAudio(from text: String, completion: @escaping (_ audioData: Data) -> Void) {
        
        var result = Data()
        let voiceGender = UserDefaults.standard.object(forKey: K.UserDefaultKeys.voiceGender) as! String
        
        // Check Cache For Audio
        if let result = audioCache.object(forKey: "\(text)_\(voiceGender)" as AnyObject) as? Data {
            
            completion(result)
            return
            
        }
        
        // Otherwise fetch the Data over the network
        DispatchQueue.global().async {
            
            // Initialize URL
            guard let url = URL(string: self.baseURL) else {
                print("Unable to form url")
                return
            }
            
            // Setup Request
            var request = URLRequest(url: url)
            request.httpMethod = self.httpMethod
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            
            // Encode http Body
            let voiceName = voiceGender == "MALE" ? self.maleVoice : self.femaleVoice
            
            let synthesisInput = SynthesisInput(text: text)
            let voiceParams = VoiceSelectionParams(languageCode: self.languageCode, name: voiceName, ssmlGender: voiceGender)
            let audioConfig = AudioConfig(audioEncoding: self.audioEncoding)
            let body = TextToSpeechBody(input: synthesisInput, voice: voiceParams, audioConfig: audioConfig)
            
            guard let encodedBody = try? self.encoder.encode(body) else {
                print("Error Encoding Body")
                return
            }
            
            request.httpBody = encodedBody
            
            // Using semaphore to make request synchronous
            let semaphore = DispatchSemaphore(value: 0)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error fetching audio: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    print("Data is nil")
                    return
                }
                
                // print(String(decoding: data, as: UTF8.self))
                
                guard let response = try? JSONDecoder().decode(ResponseBody.self, from: data) else {
                    print("Unable to decode data")
                    return
                }
                
                guard let audioData = Data(base64Encoded: response.audioContent) else {
                    print("Unable to get audio data")
                    return
                }
                
                result  = audioData
                
                semaphore.signal()
                
            }
            task.resume()
            _ = semaphore.wait(timeout: .distantFuture)
            
            completion(result)
            self.audioCache.setObject(result as AnyObject, forKey: "\(text)_\(voiceGender)" as AnyObject)
        }
        
    }
    
    func playAudio(of text: String, numberOfTimes: Int = 1, sender: AVAudioPlayerDelegate) {
        
        fetchAudio(from: text) { (audioData) in
            
            do {
                
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                self.avPlayer = try AVAudioPlayer(data: audioData)
                self.avPlayer?.numberOfLoops = numberOfTimes
                self.avPlayer?.delegate = sender
                self.avPlayer?.play()
                
            } catch let error {
                print("Error occurred while playing audio: \(error.localizedDescription)")
            }
        }
    }
}
